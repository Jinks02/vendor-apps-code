
<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Paypal extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        
        $this->load->helper('url');
           $this
            ->load
            ->model("Api_model");
	
    }
	
	function index($para1='',$para2=''){
        
       if ($this->Api_model ->singleselectbox('user', 'user_id', $para1, 'token') == $this->input ->get('api_token', true))
        {
         $data['grandtotal'] = $para2;
         $this->load->view('payment_gateway/paypal',$data);
       } else{
          echo 'invalid token';
       }
    }
    
    
    function vendorRegister($para1='', $para2='', $para3=''){
        $value =    json_decode($this->input ->get('api_token', true),true);
        
       
        
      if ($this->Api_model ->singleselectbox('vendor', 'vendor_id', $para1, 'token') == $value['token'])
        {
       
         $data['grandtotal']      =  $this->db->get_where('vendor_membership', array('vendor_membership_id' => $value['planId']))->row()->price;
         $data['pageType']        = 'vendor';  
         $data['key']             =  $value['key'];
         $data['planId']          =  $value['planId'];
         $data['paymentType']    =  $value['paymentType'];
         $data['vendorId']        =  $value['vendorId'];
         $this->load->view('payment_gateway/paypal',$data);
       } else{
          echo 'invalid token';
       }
        
        
    }
    
    function vendorRegisterSuccess($para1='', $para2='', $para3=''){
     
        
        
       
    }
    
    function success(){
       echo 'success';
    }
}

?>
 
