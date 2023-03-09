<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Razorpay extends CI_Controller {

	 public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->library(array('form_validation','session'));
        $this->load->helper(array('url','html','form'));
         $this ->load ->model("Api_model");
             
     }
  
    public function index()
    {
       
        $this->load->view('payment_gateway/razorpay',$data);
    }   
    function vendorRegister($para1='', $para2='', $para3=''){
      $value =    json_decode($this->input ->get('api_token', true),true);  
    if ($this->Api_model ->singleselectbox('vendor', 'vendor_id', $para1, 'token') == $value['token'])
      {
       
     
       $data['grandtotal']      =  $this->db->get_where('vendor_membership', array('vendor_membership_id' => $value['planId']))->row()->price;
       $data['pageType']        = 'vendor';  
       $data['planId']          =  $value['planId'];
       $data['paymentType']    =  $value['paymentType'];
       $data['vendorId']        =  $value['vendorId'];
         
        $data['key'] =  $this->Api_model->get_type_name_by_id('general_settings', '84', 'value'); 
        $data['system_name'] = $this ->Api_model->get_type_name_by_id('general_settings', '3', 'value'); 
       $this->load->view('payment_gateway/razorpay',$data);
     } else{
        echo 'invalid token';
     }
      
      
  }
    public function razorPaySuccess()
    { 
   
    }
    public function RazorThankYou()
    {
     $this->load->view('razorthankyou');
    }
}