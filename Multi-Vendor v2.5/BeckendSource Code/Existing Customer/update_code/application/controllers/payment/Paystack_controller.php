<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Paystack_controller extends CI_Controller
{
    
    /**  
     * class construct
    */
    public function __construct()
    {
        // Load parent construct
        parent::__construct();

        // Load required libraries, models, helpers, etc.
        $this->load->library('paystack_lib'); // the paystack library
        $this->load->helper('string'); // to generate random string
        $this->load->helper('url');
             $this
            ->load
            ->model("Api_model");
          
    }



    /**  
     * Index
     * 
     * Maps to the following URL
	 * 		http://example.com/
	 *	- or -
	 * 		http://example.com/index.php/
     * 
     * This initializes payment to paystack's page.
    */
    public function index($para1='', $para2='', $para3='')
    {
        
     if ($this->Api_model ->singleselectbox('vendor', 'vendor_id', $para1, 'token') == $value['token'])
      {
        $payment_amount = $para2 * 100;
        $user_email = $para3;
        $payment_reference = random_string('md5');
        $this->paystack_lib->add_field('email', $user_email); // user email (required)
        $this->paystack_lib->add_field('amount', $payment_amount); // amount (required)
        $this->paystack_lib->add_field('callback_url', base_url('payment/paystack_controller/verification')); // callback (required for verifaction)
        $this->paystack_lib->add_field('reference', $payment_reference); // only if you do not want to use reference provided by paystack
        

        // Render Paystack form
      $this->paystack_lib->ps_auto_form();
      } else{
        echo 'invalid token';
     }
      
    }



    /**  
     * Verify
     * 
     * Maps to the following URL
	 * 		http://example.com/paystack-verify
	 *	- or -
	 * 		http://example.com/index.php/paystack-verify
     * 
     * This method handles the verification of payments from 
     * the paystack api.
    */
    public function verify()
    {
        // Check if trxref or reference is passed in the url
        if ( $this->input->get('trxref') OR $this->input->get('reference') )
        {
            // Valid url, store reference in variable
            $reference = ($this->input->get('trxref')) ? $this->input->get('trxref') : $this->input->get('reference');

            // Callback paystack to get real transaction status
            $ps_api_response = $this->paystack_lib->verify_transaction($reference);

            /**  
             * Check API response
            */
            if (array_key_exists('data', $ps_api_response) && array_key_exists('status', $ps_api_response['data']) && ($ps_api_response['data']['status'] === 'success')) 
            {
                
                // Payment was successful

                // Redirect to success page

            } 
            else
            {
                // Payment was not successful

                // Redirect to error page
            } 
            
        }
        else 
        {
            // Redirect to dashboard or 404 (as you choose)
            redirect(base_url());
        }
    }
    
    function verification(){
         if ( $this->input->get('trxref') OR $this->input->get('reference') )
        {
        echo 'verified';
         redirect('payment/paystack_controller/success');
        }
        
    }
    
    function success(){
        echo 'success';
    }


}
