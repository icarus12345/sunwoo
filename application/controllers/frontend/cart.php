<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class cart extends FE_Controller {

    function __construct() {
        parent::__construct();
        // $this->load->model('ecommerce/customer_model');
        // $this->load->model('ecommerce/category_model');
        $this->load->model('scooter/product_model');
        $this->load->model('scooter/order_model');
    }
    function index(){
        $this->smarty->view( 'binbon/cart', $this->assigns );
    }
    function checkout(){
        $this->smarty->view( 'binbon/checkout', $this->assigns );
    }
    function onckeckout(){
        $output["result"] = -1;
        $output["message"] = 'Data invalid !';
        $params = $this->input->post('params');
        $cartInfo = $_SESSION['cart']['info'];
        $cartItems = $_SESSION['cart']['items'];
        if(empty($cartItems)){
            $output["message"] = 'Your cart is empty.';
        }else{

            $orderParams = array(
                '_status' => 'New',
                '_name' => $params['name'],
                '_phone' => $params['phone'],
                '_email' => $params['email'],
                '_note' => $params['note'],
                '_total' => $cartInfo['cash'],
                '_data'=> json_encode(array(
                    'info' => $params,
                    'items' => $cartItems
                ),true)
            );
            $rs = $this->order_model->onInsert($orderParams);
            if($rs===true){
                $output["result"] = 1;
                $output["message"] = 'Success ! Thank you for this order.';
                $output["cartinfo"] = $this->smarty->view('binbon/widget/cart-info', $this->assigns,true);
                $this->sendMail();
                $_SESSION['cart'] = null;
            }
        }
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    function updateitem(){
        $id = $this->input->post('id');
        $color = $this->input->post('color');
        $size = $this->input->post('size');
        $materia = $this->input->post('materia');
        $key = "{$color}-{$size}-{$materia}";
        $item = $_SESSION['cart']['items'][$id][$key];
        $quantity = (int)$this->input->post('quantity');
        if(!empty($item)){
            $cash = $quantity*$item->sale_price;
            $item->quantity = $quantity;
            $_SESSION['cart']['info']['cash'] += ($cash - $item->cash);
            $item->cash = $cash;
        }
        $output["code"] = 1;
        $output["data"] = $_SESSION['cart'];
        $output["message"] = 'Update your cart success !';
        $output["html"] = $this->smarty->view('binbon/widget/cart-info', $this->assigns,true);
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    function removeitem(){
        $id = $this->input->post('id');
        $color = $this->input->post('color');
        $size = $this->input->post('size');
        $materia = $this->input->post('materia');
        $key = "{$color}-{$size}-{$materia}";
        $item = $_SESSION['cart']['items'][$id][$key];
        if(!empty($item)){
            $_SESSION['cart']['info']['cash'] -= $item->cash;
            $_SESSION['cart']['info']['amount'] --;
            unset($_SESSION['cart']['items'][$id][$key]);
        }
        $output["code"] = 1;
        $output["data"] = $_SESSION['cart'];
        $output["message"] = 'Remove product to your cart !';
        $output["html"] = $this->smarty->view('binbon/widget/cart-info', $this->assigns,true);
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    function onAddToCart(){
    	$output["code"] = -1;
        $output["message"] = 'Data invalid !';

        $id = $this->input->post('id');
        $color = $this->input->post('color');
        $size = $this->input->post('size');
        $materia = $this->input->post('materia');
        $quantity = (int)$this->input->post('quantity');
        $key = "{$color}-{$size}-{$materia}";
        $product = $this->product_model->onGet($id);
        $cartInfo = $_SESSION['cart']['info'];
        $cartItems = $_SESSION['cart']['items'];
        if(empty($cartItems)) $cartItems = array();
        if(empty($cartInfo)) $cartInfo = array(
            'amount'=>0, 'cash'=>0
        );

        if($product){
            unset($product->_content);
            $product->quantity = $quantity;
            $sale_price = $product->_discount;
            if($color){
                $sale_price+=1 * $product->_data['price_incurred'][$color];
            }
            if($materia){
                $sale_price+=1 * $product->_data['price_incurred'][$materia];
            }
            if($size){
                $sale_price+=1 * $product->_data['price_incurred'][$size];
            }
            $product->color = $this->line_model->onGet($color);
            $product->size = $this->line_model->onGet($size);
            $product->materia = $this->line_model->onGet($materia);
            $product->sale_price = $sale_price;
            $product->cash = $quantity*$product->sale_price;
            if(empty($cartItems[$id][$key])){
                $cartItems[$id][$key] = $product;
                $cartInfo['amount'] += 1;
            }else{
                $cartItems[$id][$key]->quantity += $quantity;
                $cartItems[$id][$key]->cash += $product->cash;
            }
            $cartInfo['cash'] += $product->cash;
            $_SESSION['cart']['items'] = $cartItems;
            $_SESSION['cart']['info'] = $cartInfo;
            
            $output["code"] = 1;
            $output["message"] = 'Add product to your cart !';
            $output["html"] = $this->smarty->view('binbon/widget/cart-info', $this->assigns,true);
        }else{
            $output["message"] = 'Product doest exists !';
        }
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    private function sendMail(){
        // $this->load->model('front/setting_model');
        $this->load->library('CI_Phpmailer');
        $mailer = new CI_Phpmailer();
        $mailer->prm = $this->setting_model->getByType('mailer');
        if($mailer->prm['Send Message']->_value=='true'){
            $this->assigns->params = $this->input->post('params');
            $subject = "You have new request at ". date('d/m/Y');
            $body = $this->smarty->view( 'mailbodyorder', $this->assigns, true );
            $mailer->send_mail($mailer->prm['To']->_value,$subject,$body);
        }
    }
}