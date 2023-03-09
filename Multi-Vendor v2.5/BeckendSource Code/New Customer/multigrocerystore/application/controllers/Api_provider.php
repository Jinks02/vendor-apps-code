<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');
class Api_provider extends CI_Controller
{
    
    function __construct()
    {
        parent::__construct();
        /*cache control*/
        $this->output->set_header('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');
        $this->output->set_header('Pragma: no-cache');
        header('Content-Type: application/json');
        $this->load->helper('url');
			$this->load->model("Home_model");
            $this
            ->load
            ->model("Api_model");


    }
    
    /* index of the admin. Default: Dashboard; On No Login Session: Back to login page. */
    public function index()
    {
		
		
      
    }
    
	function Register($para1='', $para2=''){
	 	
		     $row  =          json_decode($_POST['name'],true);
		$data['username'] = $row['firstname'];
		$data['lastname'] = $row['lastname'];
		$data['dob'] = $row['dob'];
		$data['gender'] = $row['gender'];
        $data['email'] = $row['email'];
		$data['password'] = sha1($row['password']);
		$data['mobile'] = $row['mobile'];
		$data['address1'] = $row['address1'];
		$data['address2'] = $row['address2'];
		$data['city'] = $row['city'];
		$data['state'] = $row['state'];
		$data['zipcode'] = $row['zipcode'];
		$data['aboutyou'] = $row['aboutyou'];
		$data['work_exp'] = $row['workexp'];
		$data['latitude'] = $row['latitude'];
		$data['longitude'] = $row['longtitude'];
		$data['date'] = time();
		$data['status']   = 'success';
		$data['token']   = '1';
		$data['device_id']   = '1';
		$data['livestatus'] =  'true';
        $data['zone_id'] =  $row['zoneId'];
		$this->db->insert('provider',$data);
		$id = $this->db->insert_id();
            
        
        
        
             $path1 = $_FILES['proofImage']['name'];
        $ext1 = pathinfo($path1, PATHINFO_EXTENSION);
        $provider_proof = 'provider_proof' . $id . '.' . $ext1;
        
          $this
            ->crud_model
            ->file_up("proofImage", "provider_proof", $id, '', 'no', '.' . $ext1);
        
        
        $kyc_details = array(
                           'proof_type' => $row['proofType'],
                           'account_holder' => $row['accountName'],
                           'account_no' => $row['accountNo'],
                           'bank_name' => $row['bankName'],
                           'bank_code' => $row['bankCode'],
                           'proof' => $provider_proof
                         ); 
        
        $data_banner['kyc_details'] =  json_encode( $kyc_details);
        
        
        
        
            $path = $_FILES['image']['name'];
            $ext = pathinfo($path, PATHINFO_EXTENSION);
            $data_banner['image']       = 'provider_'.$id.'.'.$ext;
            $this->crud_model->file_up("image", "provider", $id, '', 'no', '.'.$ext);
        
        
            $this->db->where('provider_id', $id);
            $this->db->update('provider', $data_banner);
        
        
			foreach($row['category'] as $row1){
				 $data1['categoryName'] = $row1['categoryName'];
				 $data1['categoryId']   = $row1['categoryId'];
				 $data1['subcategoryName'] = $row1['subcategoryName'];
				 $data1['subcategoryId'] = $row1['subcategoryId'];
				 $data1['experience'] = $row1['experience'];
				 $data1['chargePreHrs'] = $row1['chargePreHrs'];
				  $data1['quickPitch'] = $row1['quickPitch'];
				 $data1['userid'] = $id;
				 $this->db->insert('provider_databook',$data1);
			}
			
	}
	
    
       /** dashboard **/
    function dashboard($para1 = '', $para2 = '', $para3 = '')
    {
        if ($para1 == 'topbar')
            {
                $today = date("Y-m-d");
               
                $start = $this
                    ->Api_model
                    ->date_timestamp($today, 'start');
                $end = $this
                    ->Api_model
                    ->date_timestamp($today, 'end');
					$sevenStart =  strtotime('-7 day', strtotime($today));
                $todayEarn = 0;
                $thismonthEarn = 0;
                $totalEarn = 0;
                $lastsDayEarn = 0;
                
               
                /** today earn **/
                  //$todayEarn =   $this ->Api_model->sumof_sammaryReportdatewiseprovider('booking', 'driver_id', $para2, 'deliverycompleted_time >=', $start, 'deliverycompleted_time <=', $end, 'driver_settlement_value') ;
                
                /** thismonth **/
                  $month = date('m');
                  $thismonthEarn =  $this ->Api_model->sum_totalsalesreportprovider($month, 'booking', 'date', 'settlement_value', $para2) ;
                
                /** totalEarn **/
                  //$totalEarn = $this->Api_model->sumof_sammaryReport('vendor_invoice', 'driver_id', $para2, 'driver_settlement_value');
                
                 /** last seven earn **/
                  $lastsDayEarn = $this ->Api_model->sumof_sammaryReportdatewiseprovider('booking', 'provider_id', $para2, 'date >=',  $sevenStart, 'date <=', $end, 'settlement_value');
                
                
                $data = array(
					'thisMonthEarn' => $thismonthEarn,
                    'lastSDaysEarn' => $lastsDayEarn,
                    'todayOrders' => $this ->Api_model ->count_4wcopt('booking', 'provider_id', $para2, 'status !=', 'cancelled', 'date >=', $start, 'date <=', $end),
                    'totalOrders' => $this->Api_model ->count_2wcopt('booking', 'provider_id', $para2, 'status !=', 'cancelled'),
                    'todayEarn' =>  $this->Api_model->sumof_sammaryReportdatewiseprovider('booking', 'provider_id', $para2, 'date >=', $start, 'date <=', $end, 'settlement_value'),
                    'totalEarn' => $this->Api_model->sumof_sammaryReportProvider('booking', 'provider_id', $para2, 'settlement_value'),
					'cashInHand' => $this->Api_model->singleselectbox('provider','provider_id',$para2,'cin'),
					'thisMonthOrders' => $this->Api_model->count_monthreportProvider($month ,'booking','provider_id', $para2, 'count','1'),
                    'rating' => $this->Api_model->singleselectbox('provider','provider_id', $para2, 'rating_total'),
                );

                $responce = array(
                    'success' => true,
                    'data' => $data,
                    'message' => 'topbar retrieved successfully',
                );
            }
        
     

        echo json_encode($responce);

    }
	
	function statusUpdate($para1='',$para2=''){
		if($para1=='update'){
			
			
		  $content_data      = file_get_contents("php://input");
          $get_data          = json_decode($content_data);
		  $prestatus  = json_decode($this->Home_model->singleselectbox('booking','bookid',$get_data->bookId,'statusmanage'),true);
		  
		
		 array_push($prestatus, $get_data);
		  $data['statusmanage'] = json_encode($prestatus);
		  $data['status']       = $get_data->status;
		  $this->db->where('bookid',$get_data->bookId);
		  $this->db->update('booking',$data); 
		   $responce = array(
	                     'success' => true,
						 'data' =>  count($prestatus),
						 'message' => 'booked  successfully',
						);
		}
		 echo json_encode($responce);	
	}
	
	
	function serviceImage_upload($para1='', $para2=''){
   
		if($para1=='before'){
		    $path = $_FILES['image']['name'];
            $ext = pathinfo($path, PATHINFO_EXTENSION);
        
            $this->crud_model->file_up("image", "beforeservice",$para2, '', 'no', '.'.$ext);
          
		}else{
			$path = $_FILES['image']['name'];
            $ext = pathinfo($path, PATHINFO_EXTENSION);
            $this->crud_model->file_up("image", "afterservice", $para2, '', 'no', '.'.$ext);
		}
        
         $responce = array(
	                     'success' => true,
						 'data' =>   $ext,
						 'message' => 'booked  successfully',
						);
		
		 echo json_encode($responce);	
	}
    
     /** settings **/
    function settings()
    {
        $data = ["success" => true, 
                 "data" => [
            "app_name" => $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '3', 'value') , 
            "enable_stripe" => "1", "phone" => $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '88', 'value') , 
            "default_currency" => $this->Api_model->get_currency() , 
                     "enable_paypal" => "1", 
            "address" => $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '89', 'value') ,
            "google_maps_key" => $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '67', 'value') , 
            "mobile_language" =>$this
            ->Api_model
            ->get_type_name_by_id('general_settings', '110', 'value'),
            "app_version" => "2.0.1",
            "enable_version" => "1", 
            "commission" => $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '114', 'value'),
            "default_tax" => $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '113', 'value'),
            "currency_right" => $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '83', 'value')==1?true:false ,
            "default_currency_decimal_digits" => "2", 
            "enable_razorpay" => $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '84', 'value') ], "message" => "Settings retrieved successfully"];
        echo json_encode($data);

    }



    function services($para1='', $para2='', $para3='', $para4=''){
	   if($para1=='list'){	
		   $loop = $this->db->get_where('provider_databook',array('userid' => $para2))->result_array();
		   foreach($loop as $row){
		        $data[] = array(
				
				    'id' => $row['provider_databook_id'],
				    'categoryName' => $row['categoryName'],
				    'categoryId' => $row['categoryId'],
				    'subcategoryName' => $row['subcategoryName'],
				    'subcategoryId' => $row['subcategoryId'],
				    'experience' => intval($row['experience']), 
					'chargePreHrs' => intval($row['chargePreHrs']), 
					'quickPitch' => intval($row['quickPitch']), 
				     );
		   } 
	   }else if($para1=='delete'){
		 
		    $multipleWhere = array('categoryId' => $para2, 'subcategoryId' => $para3, 'userid' => $para4 );
		    $this->db->where($multipleWhere);
			$this->db->delete('provider_databook');
			$data = 'success';
			
	   }else if($para1 == 'do_add'){
		     $content_data = file_get_contents("php://input");
             $get_data     = json_decode($content_data);
		      $data['categoryName'] = $get_data->categoryName;
			  $data['categoryId'] = $get_data->categoryId;
			  $data['subcategoryName'] = $get_data->subcategoryName;
			  $data['subcategoryId'] = $get_data->subcategoryId;
			  $data['experience'] = $get_data->experience;
			  $data['chargePreHrs'] = $get_data->chargePreHrs;
			  $data['quickPitch'] = $get_data->quickPitch;
			  $data['userid'] = $para2;
			  $this->db->insert('provider_databook',$data);
			  $data = 'success';
	   }
	   
	    $responce = array(
	                     'success' => true,
						 'data' => $data,
						 'message' => 'services state successfully',
						);
		   
		    echo json_encode($responce);
	}
    

	
	function bookingstatus($para1='', $para2=''){
	      $content_data = file_get_contents("php://input");
          $get_data     = json_decode($content_data);
		  $general[] = $get_data;
		  $data['payment']           = json_encode($general);
		  $data['commission_amount'] = $get_data->commissionAmount;
		  $data['commission_status'] = 'due';
          $data['settlement_value'] =$get_data->grandTotal -  $get_data->commissionAmount;
		  $data['totalamount'] = $get_data->grandTotal;
		  $this->db->where('bookid',$get_data->bookingId);
		  $this->db->update('booking',$data);
			  $responce = array(
	                     'success' => true,
						 'data' => $data,
						 'message' => 'update date successfully',
						);
		   
		    echo json_encode($responce);
		  
	}
	
	
   function categories($para1='', $para2=''){    
    
	$this->db->order_by('category_name','asc');
    $loop = $this->db->get('h_category')->result_array();
	foreach($loop as $row){
	   $data[] = array(
	            'name' => $row['category_name'],
				'id' => $row['h_category_id'], 
	            );
	}
	
	 $responce = array(
	                     'success' => true,
						 'data' => $data,
						 'message' => 'Categories retrieved successfully',
						);
		   
		    echo json_encode($responce);
   }
   
    
	function subcategories($para1='', $para2=''){

  
	$this->db->order_by('h_sub_category_id','asc');
    $loop = $this->db->get_where('h_sub_category',array('h_category_id'=>$para1))->result_array();
	foreach($loop as $row){
	   $data[] = array(
	            'name' => $row['sub_category_name'],
				'id' => $row['h_sub_category_id'], 
	            );
	}
	
	 $responce = array(
	                     'success' => true,
						 'data' => $data,
						 'message' => 'Categories retrieved successfully',
						);
		   
		    echo json_encode($responce);
	}
    
	
	function rating($para1='', $para2=''){
	  if($para1=='do_add'){	
		   $content_data = file_get_contents("php://input");
           $get_data     = json_decode($content_data);
		   
		   $data['bookId'] = $get_data->bookId;
		   $data['rate'] = $get_data->rate;
		   $data['userId'] = $get_data->userId;
		   $data['providerId'] = $get_data->providerId;
		   $data['type'] = $get_data->type;
		   $data['review'] = $get_data->review;
		   $this->db->insert('comments',$data);
	  }
	}


	function profile($para1='', $para2='',$para3=''){

    if($para1=='status'){
    
	 $data['livestatus'] = $para3;
	 $this->db->where('provider_id',$para2);  
	 $this->db->update('provider',$data);  
	 $responce = array(
	                     'success' => true,
						 'data' => $data,
						 'message' => 'Categories retrieved successfully',
						);
	}
		   
		    echo json_encode($responce);
	}
    


	

/**recharge */
	function recharge(){
		
		$content_data = file_get_contents("php://input");
		$get_data     = json_decode($content_data);
	  
	   $balance = $this->Api_model->singleselectbox('secondary_wallet','vendor_id',$get_data->user_id,'balance');
	   $amount = $balance - $get_data->amount;
	   $multiClause = array('vendor_id' => $get_data->user_id, 'type' => 'provider');
		$data['balance']       = $amount;
		$data['last_update']    = time();
		$data['last_amount']     = $get_data->amount;
		$this->db->where($multiClause);
		$this->db->update('secondary_wallet',$data);
		$data1['vendor_id']      =  $get_data->user_id;
		$data1['amount']         =  $get_data->amount;
		//$data1['balance']        =   500;
		$data1['status']         =  'requested';
		$data1['requested_date'] =  time();
		$data1['type']           =  'provider';
		$this->db->insert('wallet_vendor_transactions',$data1);
		
		
		  $responce = array(
					   'success' => true,
					   'data' => 'success',
					   'message' => 'register retrieved successfully',
					  );
	 echo json_encode($responce);	
  }

   /** wallet **/
   function wallet($para1='', $para2='', $para3=''){
	if($para1=='balance'){
		$loop = $this->db->get_where('secondary_wallet',array('vendor_id'=>$para2,'type'=>$para3))->result_array();
		  if(count($loop)>0){
		foreach($loop as $row){
		  
	   $data = array(
				   'user_id' =>$row['vendor_id'] ,
				   'balance' => $row['balance'],
				   );   
		}  }else{
			 $data[] = array(
				   'user_id' => '0',
				   'balance' => '0',
				   );   
		}
		
		 $responce = array(
					 'success' => true,
					 'data' => $data,
					 'message' => 'wallet retrive successfully',
					);
	}else if($para1=='list'){
			if($para3=='recent'){
			   $this->db->limit(6);
			}
			$this->db->order_by('wallet_vendor_transactions_id','desc');
			$loop = $this->db->get_where('wallet_vendor_transactions',array('vendor_id'=>$para2,'type' => 'provider'))->result_array();
			foreach($loop as $row){
			 $data[] = array(
		               'vendor_id' => $para2,
					   'transactions_id' => $row['wallet_vendor_transactions_id'],
					   'type' => $row['type'],
					   'amount' => $row['amount'],
					   //'balance' => $row['balance'],
					   'status' => $row['status'],
					   'date' => $row['requested_date'],
					   //'access_vendor' => $row['access_vendor'],
					   //'product_id' => $row['product_id']
					   );   			
			}
		 $responce = array(
					 'success' => true,
					 'data' => $data,
					 'message' => 'wallet transaction retrive successfully',
					);
	}
	
	 echo json_encode($responce);
	
}



	

 
 function login($para1='',$para2=''){
	    $content_data = file_get_contents("php://input");
        $get_data     = json_decode($content_data);

		 $loop = $this->db->get_where('provider',array('email'=>$get_data->email,'password'=>sha1($get_data->password),'status'=>'success'))->result_array();
		 if($loop>0){
		 foreach($loop as $row){
             $data =  array(
			        'id' => $row['provider_id'],
					'name' => $row['username'],
					'email' => $row['email'],
					'api_token' => $row['token'],
					'device_token' => $row['device_id'],
					'phone' => $row['mobile'],
					'status'  => $row['status'],
					'about'  => $row['aboutyou'],	
					'auth'       => true,
					'address'   => '1',
                    'zoneId' =>$row['zone_id'],
					'liveStatus'   => $row['livestatus']? true: false,
					'image'      => base_url().'uploads/provider_image/'.$row['image'],
			 );
		 }
		 }else{
			 
		 }
		 
		   $responce = array(
	                     'success' => true,
						 'data' => $data,
						 'message' => 'profile retrieved successfully',
						);
	   echo json_encode($responce);	
		 
 }
  
 
 
  
  /** email password **/
        function updatePassword($para1='', $para2=''){
        
     
                
                  $content_data = file_get_contents("php://input");
                  $get_data = json_decode($content_data);
                
               
                    $data['password'] = sha1($get_data->password);
                    $this->db->where('email', $get_data->email);
                    $this->db->update('provider', $data);
                    $responce = array(
                        'data' => true,
                    );

        echo json_encode($responce);
    }
  
    /**Zone List**/
    function getZoneList($para1='', $para2=''){
        if($para1=='list'){
         $this ->db->order_by('title', 'desc');
        $loop = $this ->db ->get_where('zone')->result_array();
      foreach($loop as $row){
        $data[] = array(
            'zoneId' => $row['zone_id'],
            'title' => $row['title'],
            'position' => json_decode($row['positions'],true)
         );
      }
          $responce = array(
            'success' => true,
            'data' => $data,
            'message' => 'zone retrieved successfully',
        );
     
        }
        
           echo json_encode($responce);
    }
  



  

  

}
/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */