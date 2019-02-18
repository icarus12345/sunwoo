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
        $this->smarty->view( 'scooter/cart', $this->assigns );
    }
    function checkout(){
        $this->smarty->view( 'scooter/checkout', $this->assigns );
    }
    function onckeckout(){
        $output["result"] = -1;
        $output["message"] = 'Data invalid !';
        $params = $this->input->post('params');
        $cartInfo = $_SESSION['cart']['info'];
        $cartItems = $_SESSION['cart']['items'];
        $order_id = strtoupper(random_string('alnum', 12));
        if(empty($cartItems)){
            $output["message"] = 'Your cart is empty.';
        }else{

            $orderParams = array(
                'order_id' => $order_id,
                'order_status' => 'New',
                'order_customer_id' => $_SESSION['accountInfo']->Id,
                'order_total' => $cartInfo['cash'],
                'order_customer_name' => $params['order_shipping_name'],
                'order_data'=> json_encode(array(
                    'info' => $params,
                    'items' => $cartItems
                ),true)
            );
            $rs = $this->order_model->onInsert($orderParams);
            if($rs===true){
                $output["result"] = 1;
                $output["message"] = 'Success ! Thank you for this order.';
                $_SESSION['cart'] = null;
                $output["cartinfo"] = $this->smarty->view('scooter/widget/cartInfo', $this->assigns,true);
            }
        }
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    function removeitem($product_id='',$color=''){
        $item = $_SESSION['cart']['items'][$product_id][$color];
        if(!empty($item)){
            $_SESSION['cart']['info']['cash'] -= $item->cash;
            $_SESSION['cart']['info']['amount'] --;
            unset($_SESSION['cart']['items'][$product_id][$color]);
        }
        redirect('/cart');
    }
    function onAddToCart(){
    	$output["result"] = -1;
        $output["message"] = 'Data invalid !';
        $id = $this->input->post('id');
        $color = $this->input->post('color');
        $quantity = (int)$this->input->post('quantity');
        $this->db->select('product_id,product_code,product_title,product_price,product_thumb,product_desc');
        $product = $this->product_model->onGet($id);
        if($product){
            $product->quantity = $quantity;
            $product->cash = $quantity*$product->product_price;
            $cartInfo = $_SESSION['cart']['info'];
            $cartItems = $_SESSION['cart']['items'];
            if(empty($cartItems)) $cartItems = array();
            if(empty($cartInfo)) $cartInfo = array(
                'amount'=>0, 'cash'=>0
            );
            if(empty($cartItems[$id][$color])){
                $cartItems[$id][$color] = $product;
                $cartInfo['amount'] += 1;
            }else{
                $cartItems[$id][$color]->quantity += $quantity;
                $cartItems[$id][$color]->cash += $product->cash;
            }
            $cartInfo['cash'] += $product->cash;
            $_SESSION['cart']['items'] = $cartItems;
            $_SESSION['cart']['info'] = $cartInfo;
            
            $output["result"] = 1;
            $output["message"] = 'Add product to your cart !';
            $output["cartinfo"] = $this->smarty->view('scooter/widget/cartInfo', $this->assigns,true);
        }else{
            $output["message"] = 'Product doest exists !';
        }
        $this->output->set_header('Content-type: application/json');
        $this->output->set_output(json_encode($output));
    }
    
}