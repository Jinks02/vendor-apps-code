<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');



class Email_model extends CI_Model
{
 
    
    function __construct()
    {
        parent::__construct();
    }
    
    

   
    
	function otp_page($to='',$otp='', $username=''){
	
          
        $to         =  $to;
        $subject    = 'Verification code to reset password';
		$page_data['username'] = $username;
		$page_data['optdata'] = $otp;
     	$from_name =  $this->db->get_where('general_settings', array('type' => 'system_name'))->row()->value;
        $msg        =  $this->load->view('email/otp_page',$page_data,true);
		$this->smpt_test($from, $from_name, $to, $subject, $msg);
	}

    function do_email($from = '', $from_name = '', $to = '', $sub ='', $msg ='')
    {   
        $this->load->library('email');
        $this->email->set_newline("\r\n");
        $this->email->from($from, $from_name);
        $this->email->to($to);        
        $this->email->subject($sub);
        $this->email->message($msg);
        
        if($this->email->send()){
            return true;
        }else{
          echo $this->email->print_debugger();
            return false;
        }
        //echo $this->email->print_debugger();
    }
    
    
    function smpt_test($from = '', $from_name = '', $to = '', $sub ='', $msg =''){
        
             $config = array();
        $smtp_config = array();
      
      

        $smtp_config = $this->get_smtp_config();
        $this->load->library('email');
        $this->email->set_newline("\r\n");

        $config['priority'] = 1;
		$config['mailtype'] =  'html';
        $config['charset'] = "iso-8859-1";
         //echo "<pre>";
         //print_r($config);die();

        
            $from = $smtp_config['smtp_user'];
            $config = array_merge($config,$smtp_config);
        

       
            $this->email->initialize($config);
        
       
        $this->email->from($from, $from_name);
        $this->email->to($to);        
        $this->email->subject($sub);
        $this->email->message($msg);
        $this->email->print_debugger();
        if ($this->email->send()) {
           // echo $this->email->print_debugger();exit;
            return true;
        } else {
           // echo $this->email->print_debugger();exit;
            return false;
        }
        echo $this->email->print_debugger();
    }
    
    
    public function get_smtp_config()
    {
        $config = array();
        $flag_count = 0;

      $smtp_host = $this->db->get_where('general_settings', array('type' => 'smtp_host'))->row()->value;
        $smtp_port = $this->db->get_where('general_settings', array('type' => 'smtp_port'))->row()->value;
        $smtp_user = $this->db->get_where('general_settings', array('type' => 'smtp_user'))->row()->value;
        $smtp_pass = $this->db->get_where('general_settings', array('type' => 'smtp_pass'))->row()->value;


        if (!empty($smtp_host)) {

            $config['smtp_host'] = $smtp_host;
            $flag_count++; // 1

        }

        if (!empty($smtp_port)) {

            $config['smtp_port'] = $smtp_port;
            $flag_count++; // 2

        }

        if (!empty($smtp_user)) {

            $config['smtp_user'] = $smtp_user;
            $flag_count++; // 3

        }

        if (!empty($smtp_pass)) {

            $config['smtp_pass'] = $smtp_pass;
            $flag_count++; // 4

        }

        if ($flag_count < 4) {
            $config = array();
        }

        return $config;
    }

    
}