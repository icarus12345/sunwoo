<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class paypal extends FE_Controller {
	function __construct() {
        parent::__construct();
		$this->paypalConfig=array(
            "currencyCode"  =>"USD",
            "paypalID"      =>"info-facilitator@ezzerider.com",
            "returnUrl"     =>base_url("paypal/transactionreturn"),
            "notifyUrl"     =>base_url("paypal/transactionnotify"),
            "cancelUrl"     =>base_url("paypal/transactioncancel"),
            "paypalsandbox" =>true,
            "paypalhttps"   =>true,

            'PayPalMode'        => 'sandbox',
            'PayPalApiUsername' => 'info-facilitator_api1.ezzerider.com',
            'PayPalApiPassword' => 'FLWVTLW957GZTNMT',
            'PayPalApiSignature'=> 'AqggbImtyRxFNjRjHPniUskkhrGNAlNYVTziq991i.YBjVJSCsRrNPec',
            'PayPalCurrencyCode'=> 'USD',
            'PayPalReturnURL'   => base_url("paypal/transactionreturn"),
            'PayPalCancelURL'   => base_url("paypal/transactioncancel")

        );
    }
    function index(){
        include_once(APPPATH . "libraries/paypal/paypal.class.php");
        $ItemName       = $_POST["itemname"]; //Item Name
        $ItemPrice      = $_POST["itemprice"]; //Item Price
        $ItemNumber     = $_POST["itemnumber"]; //Item Number
        $ItemDesc       = $_POST["itemdesc"]; //Item Number
        $ItemQty        = $_POST["itemQty"]; // Item Quantity
        $ItemTotalPrice = ($ItemPrice*$ItemQty);

        //Other important variables like tax, shipping cost
        $TotalTaxAmount     = 2.58;  //Sum of tax for all items in this order. 
        $HandalingCost      = 2.00;  //Handling cost for this order.
        $InsuranceCost      = 1.00;  //shipping insurance cost for this order.
        $ShippinDiscount    = -3.00; //Shipping discount for this order. Specify this as negative number.
        $ShippinCost        = 3.00; //Although you may change the value later, try to pass in a shipping amount that is reasonably accurate.
        //Grand total including all tax, insurance, shipping cost and discount
        $GrandTotal = ($ItemTotalPrice + $TotalTaxAmount + $HandalingCost + $InsuranceCost + $ShippinCost + $ShippinDiscount);

        $cartInfo = $_SESSION['cart']['info'];
        $cartItems = $_SESSION['cart']['items'];
        $ItemTotalPrice = $cartInfo['total'];
        $PayPalParams = array(
            'METHOD' => 'SetExpressCheckout',
            'RETURNURL' => $this->paypalConfig['PayPalReturnURL'],
            'CANCELURL' => $this->paypalConfig['PayPalCancelURL'],

            'PAYMENTREQUEST_0_PAYMENTACTION' => 'SASE',
            // 'L_PAYMENTREQUEST_0_NAME0' => $ItemName,
            // 'L_PAYMENTREQUEST_0_NUMBER0' => $ItemNumber,
            // 'L_PAYMENTREQUEST_0_DESC0' => $ItemDesc,
            // 'L_PAYMENTREQUEST_0_AMT0' => $ItemPrice,
            // 'L_PAYMENTREQUEST_0_QTY0' => $ItemQty,

            'NOSHIPPING' => '0',
            'PAYMENTREQUEST_0_ITEMAMT'      => $ItemTotalPrice,
            'PAYMENTREQUEST_0_TAXAMT'       => $TotalTaxAmount,
            'PAYMENTREQUEST_0_SHIPPINGAMT'  => $ShippinCost,
            'PAYMENTREQUEST_0_HANDLINGAMT'  => $HandalingCost,
            'PAYMENTREQUEST_0_SHIPDISCAMT'  => $ShippinDiscount,
            'PAYMENTREQUEST_0_INSURANCEAMT' => $InsuranceCost,
            'PAYMENTREQUEST_0_AMT'          => $GrandTotal,
            'PAYMENTREQUEST_0_CURRENCYCODE' => $this->paypalConfig['PayPalCurrencyCode'],
            'LOCALECODE' => 'GB',
            'LOGOIMG' => 'http://www.sanwebe.com/wp-content/themes/sanwebe/img/logo.png',
            'CARTBORDERCOLOR' => 'FFFFFF',
            'ALLOWNOTE' => '1',

        );
        $n = 0;$ItemTotalPrice=0;
        foreach($cartItems as $product_id=>$items){
            foreach($items as $color=>$item){
                $PayPalParams["L_PAYMENTREQUEST_0_NAME$n"] = $item->product_title;
                $PayPalParams["L_PAYMENTREQUEST_0_NUMBER$n"] = $item->product_code;
                $PayPalParams["L_PAYMENTREQUEST_0_DESC$n"] = "Color : $color";
                $PayPalParams["L_PAYMENTREQUEST_0_AMT$n"] = $item->product_price;
                $PayPalParams["L_PAYMENTREQUEST_0_QTY$n"] = $item->quantity;
                $n++;
            }
        }
        $_SESSION['PaypalParams'] = $PayPalParams;
        $httpParsedResponseAr = $this->PPHttpPost(
            'SetExpressCheckout', 
            http_build_query($PayPalParams,'', '&'), 
            $this->paypalConfig['PayPalApiUsername'], 
            $this->paypalConfig['PayPalApiPassword'], 
            $this->paypalConfig['PayPalApiSignature'], 
            $this->paypalConfig['PayPalMode']
        );
        if("SUCCESS" == strtoupper($httpParsedResponseAr["ACK"]) || "SUCCESSWITHWARNING" == strtoupper($httpParsedResponseAr["ACK"]))
        {

            //Redirect user to PayPal store with Token received.
            $paypalurl ='https://www'.$paypalmode.'.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token='.$httpParsedResponseAr["TOKEN"].'';
            header('Location: '.$paypalurl);
             
        }else{
            //Show error message
            echo '<div style="color:red"><b>Error : </b>'.urldecode($httpParsedResponseAr["L_LONGMESSAGE0"]).'</div>';
            echo '<pre>';
            print_r($httpParsedResponseAr);
            echo '</pre>';
        }

        echo '<pre>';
        print_r($this->paypalConfig);
        print_r($_SESSION['PaypalParams']);
    }
    function process(){

    }
    function transactioncancel(){
        
    }
    function transactionreturn(){
        
    }
    function transactionnotify(){
        
    }
    function transactioncheckout(){
        $cartInfo = $_SESSION['cart']['info'];
        $cartItems = $_SESSION['cart']['items'];
    	
        // Build the query string
        $params=array(
            "cmd"           =>  "_cart",
            "upload"        =>  "1",
            "charset"       =>  "utf-8",
            "no_shipping"   =>  "1",
            "currency_code" =>  $this->paypalConfig['currencyCode'],
            "business"      =>  $this->paypalConfig['paypalID'],
            "return"        =>  $this->paypalConfig['returnUrl'],
            "notify_url"    =>  $this->paypalConfig['notifyUrl'],
        );
        if(empty($cartItems)) redirect('/');
        $n = 0;
        foreach($cartItems as $product_id=>$items){
            foreach($items as $color=>$item){
                $n++;
                $params['item_number_' . $n]    = $item->product_code;
                $params['item_name_' . $n]    = $item->product_title;
                $params['item_desc_' . $n]    = $item->product_desc;
                $params['item_tax_' . $n]    = 0;
                $params['amount_' . $n]    = $item->product_price;
                $params['quantity_' . $n]    = $item->quantity;
                
            }
        }
        
        // echo '<pre>',print_r($params);die;
        // Add the sandbox subdomain if necessary
        $sandbox = '';
        if ($this->paypalConfig['paypalsandbox'] === true) {
            $sandbox = '.sandbox';
        }
        // Use HTTPS by default
        $protocol = 'https://';
        if ($this->paypalConfig['paypalhttps'] == false) {
            $protocol = 'http://';
        }
        // Send the visitor to PayPal https://www.sandbox.paypal.com/cgi-bin/webscr
        
        $url=$protocol . 'www' . $sandbox . '.paypal.com/cgi-bin/webscr?' . http_build_query($params);
        //echo "Payment width <a href='$url'>Paypal</a> or <a href=''>Order</a>";
        @header("Location: $url");
    }
    function PPHttpPost($methodName_, $nvpStr_, $PayPalApiUsername, $PayPalApiPassword, $PayPalApiSignature, $PayPalMode) {
            // Set up your API credentials, PayPal end point, and API version.
            $API_UserName = urlencode($PayPalApiUsername);
            $API_Password = urlencode($PayPalApiPassword);
            $API_Signature = urlencode($PayPalApiSignature);
            
            $paypalmode = ($PayPalMode=='sandbox') ? '.sandbox' : '';
    
            $API_Endpoint = "https://api-3t".$paypalmode.".paypal.com/nvp";
            $version = urlencode('109.0');
        
            // Set the curl parameters.
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $API_Endpoint);
            curl_setopt($ch, CURLOPT_VERBOSE, 1);
        
            // Turn off the server and peer verification (TrustManager Concept).
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
        
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($ch, CURLOPT_POST, 1);
        
            // Set the API operation, version, and API signature in the request.
            $nvpreq = "METHOD=$methodName_&VERSION=$version&PWD=$API_Password&USER=$API_UserName&SIGNATURE=$API_Signature$nvpStr_";
            echo $nvpreq;
            // Set the request as a POST FIELD for curl.
            curl_setopt($ch, CURLOPT_POSTFIELDS, $nvpreq);
        
            // Get response from the server.
            $httpResponse = curl_exec($ch);
        
            if(!$httpResponse) {
                exit("$methodName_ failed: ".curl_error($ch).'('.curl_errno($ch).')');
            }
        
            // Extract the response details.
            $httpResponseAr = explode("&", $httpResponse);
        
            $httpParsedResponseAr = array();
            foreach ($httpResponseAr as $i => $value) {
                $tmpAr = explode("=", $value);
                if(sizeof($tmpAr) > 1) {
                    $httpParsedResponseAr[$tmpAr[0]] = $tmpAr[1];
                }
            }
        
            if((0 == sizeof($httpParsedResponseAr)) || !array_key_exists('ACK', $httpParsedResponseAr)) {
                exit("Invalid HTTP Response for POST request($nvpreq) to $API_Endpoint.");
            }
        
        return $httpParsedResponseAr;
    }
}