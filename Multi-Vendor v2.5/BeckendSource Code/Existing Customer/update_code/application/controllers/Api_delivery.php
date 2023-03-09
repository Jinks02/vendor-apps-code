<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');
class Api_delivery extends CI_Controller
{

    function __construct()
    {
        parent::__construct();
        /*cache control*/
         $this
            ->output
            ->set_header('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');
        $this
            ->output
            ->set_header('Pragma: no-cache');
        header("Access-Control-Allow-Origin: *");
        header("Access-Control-Allow-Methods: GET,HEAD,OPTIONS,POST,PUT");
        header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, Authorization");
        header("Cache-Control: no-cache, must-revalidate");
        header('Content-Type: application/json');
        $this
            ->load
            ->helper('url');
        $this
            ->load
            ->model("Api_model");
    }

    /* index of the admin. Default: Dashboard; On No Login Session: Back to login page. */
    public function index()
    {

    }

    function profile_image($para1 = '', $para2 = '')
    {
        $image = $_FILES['image']['name'];
        $imagePath = 'uploads/profile_image/' . $image;
        $tmp_name = $_FILES['image']['tmp_name'];
        move_uploaded_file($tmp_name, $imagePath);
        $row = json_decode($_POST['name'], true);
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
        $data['status'] = 'success';
        $data['token'] = '1';
        $data['device_id'] = '1';
        $data['livestatus'] = 'true';
        $this
            ->db
            ->insert('provider', $data);
        $id = $this
            ->db
            ->insert_id();

        $path = $_FILES['image']['name'];
        $ext = pathinfo($path, PATHINFO_EXTENSION);
        $data_banner['image'] = 'provider_' . $id . '.' . $ext;
        $this
            ->crud_model
            ->file_up("image", "provider", $id, '', 'no', '.' . $ext);
        $this
            ->db
            ->where('provider_id', $id);
        $this
            ->db
            ->update('provider', $data_banner);
        foreach ($row['category'] as $row1)
        {
            $data1['categoryName'] = $row1['categoryName'];
            $data1['categoryId'] = $row1['categoryId'];
            $data1['subcategoryName'] = $row1['subcategoryName'];
            $data1['subcategoryId'] = $row1['subcategoryId'];
            $data1['experience'] = $row1['experience'];
            $data1['chargePreHrs'] = $row1['chargePreHrs'];
            $data1['quickPitch'] = $row1['quickPitch'];
            $data1['userid'] = $id;
            $this
                ->db
                ->insert('provider_databook', $data1);
        }

    }
    
    
    
    
    /** email password **/
        function updatePassword($para1='', $para2=''){
        
     
                
                  $content_data = file_get_contents("php://input");
                  $get_data = json_decode($content_data);
                
               
                    $data['password'] = sha1($get_data->password);
                    $this->db->where('email', $get_data->email);
                    $this->db->update('driver', $data);
                    $responce = array(
                        'data' => true,
                    );

        echo json_encode($responce);
    }
    
    /** withdraw**/
    
    
    /** settings **/
    function settings()
    {
        $data = ["success" => true, "data" => [
            "app_name" => $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '3', 'value') , 
             "enable_stripe" => "1", "phone" => $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '88', 'value') , 
            "default_currency" => $this
            ->Api_model
            ->get_currency() , "enable_paypal" => "1",
            "address" => $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '89', 'value') ,
            "google_maps_key" => $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '67', 'value') , 
              "mobile_language" =>  $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '110', 'value'),
            "app_version" => "2.0.0", "enable_version" => "1", 
            "currency_right" => $this ->Api_model->get_type_name_by_id('general_settings', '83', 'value')==1?true:false ,
             "default_currency_decimal_digits" => "2", "enable_razorpay" => $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '84', 'value')
            ], "message" => "Settings retrieved successfully"];
        echo json_encode($data);

    }
    /** orders **/
    function order($para1 = '', $para2 = '', $para3 = '')
    {

        if ($para1 == 'list')
        {

            if ($this
                ->Api_model
                ->singleselectbox('driver', 'driver_id', $para2, 'token') == $this
                ->input
                ->get('api_token', true))
            {

                $this
                    ->db
                    ->order_by('sale_id', 'desc');
                $loop = $this
                    ->db
                    ->get_where('sale', array(
                    'delivery_assigned' => $para2
                ))->result_array();
                // count($loop);
                foreach ($loop as $row2)
                {
                    $shippingaddress[] = json_decode($row2['shipping_address'], true);
                    $data[] = array(
                        'userid' => $row2['buyer'],
                        'sale_code' => $row2['sale_code'],
                        'product_details' => json_decode($row2['product_details'], true) ,
                        'address' => $shippingaddress,
                        'shipping' => $row2['shipping'],
                        'payment_type' => $row2['payment_type'],
                        'payment_status' => $row2['payment_status'],
                        'payment_timestamp' => $row2['payment_timestamp'],
                        'grand_total' => $row2['grand_total'],
                        'sale_datetime' => $row2['sale_datetime'],
                        'delivary_datetime' => $row2['delivary_datetime'],
                        'deliver_assignedtime' => $row2['deliver_assignedtime'],
                        'delivery_state' => $row2['delivery_state'],
                    );
                }

                $responce = array(
                    'success' => true,
                    'data' => $data,
                    'message' => 'order retrieved successfully',
                );
            }
            else
            {
                $responce = $this
                    ->Api_model
                    ->tokenfailed();
            }
        }
        else if ($para1 == 'orderhistory')
        {

            if ($this
                ->Api_model
                ->singleselectbox('driver', 'driver_id', $para2, 'token') == $this
                ->input
                ->get('api_token', true))
            {

                $this
                    ->db
                    ->order_by('sale_id', 'desc');
                $loop = $this
                    ->db
                    ->get_where('sale', array(
                    'delivery_assigned' => $para2
                ))->result_array();

                foreach ($loop as $row2)
                {
                   
                    $data[] = array(
                        'id' => $row2['sale_code'],
                        'status' => $row2['status'],
                        'shopName' =>  $this->Api_model->singleselectbox('vendor', 'vendor_id', $row2['vendor'], 'display_name') ,
                        'shopAddress' => $this->Api_model->singleselectbox('vendor', 'vendor_id', $row2['vendor'], 'address1'),
                        'vendorId' => $row2['vendor'],
                        'amount' => $row2['grand_total'],
                        'date' => $row2['delivary_datetime'],
                    );
                }

                $responce = array(
                    'success' => true,
                    'data' => $data,
                    'message' => 'order retrieved successfully',
                );
            }
            else
            {
                $responce = $this
                    ->Api_model
                    ->tokenfailed();
            }

        }
        else if ($para1 == 'orderDetails')
        {

            if ($this
                ->Api_model
                ->singleselectbox('driver', 'driver_id', $para2, 'token') == $this
                ->input
                ->get('api_token', true))
            {

                $this
                    ->db
                    ->order_by('sale_id', 'desc');
                $loop = $this
                    ->db
                    ->get_where('sale', array(
                    'delivery_assigned' => $para2,
                    'sale_code' => $para3
                ))->result_array();

                foreach ($loop as $row2)
                {
                    $shippingaddress = json_decode($row2['shipping_address'], true);
                    $this
                        ->db
                        ->select('address1, display_name, phone, latitude, longitude');
                    $loop1 = $this
                        ->db
                        ->get_where('vendor', array(
                        'vendor_id' => $row2['vendor']
                    ))->result_array();
                    foreach ($loop1 as $row1)
                    {
                        $shipped = array(
                            'addressSelect' => $row1['address1'],
                            'username' => $row1['display_name'],
                            'phone' => $row1['phone'],
                            'userId' => $row2['vendor'],
                            'latitude' => floatval($row1['latitude']) ,
                            'longitude' => floatval($row1['longitude']) ,
                            'isDefault' => 'true',
                            'id' => ''
                        );
                    }
                    $data = array(
                        'userid' => $row2['buyer'],
                        'sale_code' => $row2['sale_code'],
                        'status' => $row2['status'],
                        'product_details' => json_decode($row2['product_details'], true) ,
                        'paymentDetails' => json_decode($row2['payment_details'],true),
                        'address' => $shippingaddress,
                        'shop' => $shipped,
                        'payment_type' => $row2['payment_type'],
                        'payment_status' => $row2['payment_status'],
                        'payment_timestamp' => $row2['payment_timestamp'],
                        'grand_total' => $row2['grand_total'],
                        'sale_datetime' => $row2['sale_datetime'],
                        'delivary_datetime' => $row2['delivary_datetime'],
                        'deliver_assignedtime' => $row2['deliver_assignedtime'],
                        'delivery_state' => $row2['delivery_state'],
                        'shopTypeId' => $this
                        ->Api_model
                        ->singleselectbox('shop_focus', 'shop_focus_id', $row['focus_id'], 'shop_type')
                    );
                }

                $responce = array(
                    'success' => true,
                    'data' => $data,
                    'message' => 'orderdetails retrieved successfully',
                );
            }
            else
            {
                $responce = $this
                    ->Api_model
                    ->tokenfailed();
            }

        }
        echo json_encode($responce);
    }
    
    
    
    
   function getGlobalObject($table ='', $col='', $para='', $select=''){
      $loop =  $this->db->get_where($table, array($col=>$para))->result_array();
         $selectValue = '';
      foreach($loop as $row){
          $selectValue = $row[$select];
      }
         $responce = array(
                    'success' => true,
                    'data' =>  $selectValue,
                );
       echo json_encode($responce);
    }
    
    
    
    /** deliverStatus **/
    function deliverStatus($para1 = '', $para2 = '', $para3 = '', $para4 = '', $driver_id='')
    {
        if ($para1 == 'update')
        {
            if ($para2 != 'Delivered')
            {

                $data['delivery_state'] = $para2;
                $this->db->where('sale_code', $para3);
                $this->db->update('sale', $data);
                $responce = array(
                    'success' => true,
                    'data' => true,
                    'message' => 'order retrieved successfully',
                );
            }
            else
            {
                
                 $otp = $this->db->get_where('sale', array('sale_code' =>$para3))->row()->otp;
                 $delivery_status = json_decode($this ->db->get_where('sale', array( 'sale_code' => $para3))->row()->delivery_status, true);
                    $delivery_status['deliverstatus'] = true;
                    $delivery_status['delivered'] = time();
                    $data['delivery_state'] = $para2;
                    $data['payment_status']   = 'Paid';
                    $data['delivery_status'] = json_encode($delivery_status);
                    $data['status'] = 'Delivered';
                
                    $this->db->where('sale_code', $para3);
                    $this->db ->update('sale', $data);
                
                 /* invoice update **/
                
                    $data2['status']        = 'Paid';
                    $data2['grand_status']  = 'Completed'; 
                    $data2['deliverycompleted_time']  =  $delivery_status['delivered']; 
                    $this->db->where('invoice_id', $para3);
                    $this->db ->update('vendor_invoice', $data2);

                  /* update cash in hand **/
                      $payment_type = $this->db->get_where('sale', array('sale_code' =>$para3))->row()->payment_type;
                   
                    if($payment_type=='cash on delivery'){
                       
                        $cash_in_hand_arr_current = json_decode($this->db->get_where('sale', array('sale_code' =>$para3))->row()->payment_details,true);
                        $cash_in_hand_old  = $this->db->get_where('driver', array('	driver_id' =>$driver_id))->row()->cin;
                        $new_cash_in_hand =  $cash_in_hand_arr_current['grand_total'] + $cash_in_hand_old;
                        $data1['cin']   =  $new_cash_in_hand;
                        $this->db->where('driver_id', $driver_id);
                        $this->db->update('driver', $data1);
                  
                    }
                
                 /* update driver wallet **/
                     $wallet =  $this->Api_model->secondary_wallet('driver',$driver_id);
                 if($wallet=='0'){
                     $driver_settlement_amount = $this->db->get_where('vendor_invoice', array('invoice_id' =>$para3))->row()->driver_settlement_value;
                     $data3['vendor_id'] = $driver_id;
                     $data3['balance'] =  $driver_settlement_amount;
                     $data3['last_update'] = time();
                     $data3['type'] = 'driver';
                     $data3['last_amount'] =  $driver_settlement_amount;
                     $this->db->insert('secondary_wallet',$data3);
                 } else {
                      $driver_settlement_amount = $this->db->get_where('vendor_invoice', array('invoice_id' =>$para3))->row()->driver_settlement_value;
                      $data3['balance'] = $wallet +  $driver_settlement_amount;
                      $data3['last_update'] = time();
                      $data3['last_amount'] =  $driver_settlement_amount;
                     $this->db->where('vendor_id',$driver_id);
                     $this->db->update('secondary_wallet',$data3);
                 }
                
                /** update vendor wallet history**/
                 $vendor_id =  $this->db->get_where('vendor_invoice', array('invoice_id' =>$para3))->row()->vendor_id;
                 $settlement_amount = $this->db->get_where('vendor_invoice', array('invoice_id' =>$para3))->row()->settlement_value;
                 
                if($payment_type = 'cash on delivery'){
                   
                    $wallet =  $this->Api_model->vendorWalletAmount($vendor_id,1);
                 if($wallet=='no'){
                     $data4['vendor_id'] = $vendor_id;
                     $data4['balance'] =  $settlement_amount;
                     $data4['last_update'] = time();
                     $data4['totalamount'] = $settlement_amount;
                     $this->db->insert('vendor_wallet',$data4);
                 } else {
                   
                     $data4['vendor_id']   = $vendor_id;
                     $data4['balance']     = $wallet + $settlement_amount;
                     $data4['last_update'] = time();
                     $data4['totalamount'] = $settlement_amount;
                     $this->db->where('vendor_id',$vendor_id);
                     $this->db->update('vendor_wallet',$data4);
                 }
                    
                }
                
                
                
                   
                  $responce = array(
                        'success' => true,
                        'data' => true,
                        'message' => 'order retrieved successfully',
                    );
                    

            }
            echo json_encode($responce);
        }
    }
    /** login **/
    function login($para1 = '', $para2 = '')
    {
        $content_data = file_get_contents("php://input");
        $get_data = json_decode($content_data);

        $loop = $this
            ->db
            ->get_where('driver', array(
            'email' => $get_data->email,
            'password' => sha1($get_data->password) ,
            'block' => 'false'
        ))
            ->result_array();
        if ($loop > 0)
        {
            foreach ($loop as $row)
            {
                $data1['token'] = sha1($row['driver_id']);
                $data = array(
                    'id' => $row['driver_id'],
                    'name' => $row['name'],
                    'email' => $row['email'],
                    'api_token' => $data1['token'],
                    'password' => 'hidden',
                    'device_token' => $row['device_id'],
                    'gender' => $row['gender'],
                    'phone' => $row['phone'],
                    'status' => $row['status'],
                    'auth' => true,
                    'liveStatus' => $row['livestatus'] == 'true' ? true : false,
                    'approveState' => $row['status'] == 'success' ? true : false,
                    'address' => '1',
                    'image' => base_url() . 'uploads/driver_image/' . $row['image'],
                    'walletAmount' => $this->Api_model->secondary_wallet('driver',$row['driver_id']),
                );
            }

            $this
                ->db
                ->where('driver_id', $row['driver_id']);
            $this
                ->db
                ->update('driver', $data1);
        }
        else
        {

        }

        $responce = array(
            'success' => true,
            'data' => $data,
            'message' => 'profile retrieved successfully',
        );
        echo json_encode($responce);

    }
    /** statusUpdate **/
    function statusUpdate($para1 = '', $para2 = '', $para3 = '')
    {

        if ($this
            ->Api_model
            ->singleselectbox('driver', 'driver_id', $para2, 'token') == $this
            ->input
            ->get('api_token', true))
        {

            $data['livestatus'] = $para1;
            $this
                ->db
                ->where('driver_id', $para2);
            $this
                ->db
                ->update('driver', $data);
            $responce = array(
                'success' => true,
            );

        }
        else
        {
            $responce = $this
                ->Api_model
                ->tokenfailed();
        }
        echo json_encode($responce);
    }

    /** latlongUpdate **/
    function latlongUpdate($para1 = '', $para2 = '', $para3 = '')
    {
        if ($this
            ->Api_model
            ->singleselectbox('driver', 'driver_id', $para3, 'token') == $this
            ->input
            ->get('api_token', true))
        {

            $data['latitude'] = $para1;
            $data['longitude'] = $para2;
            $this
                ->db
                ->where('driver_id', $para3);
            $this
                ->db
                ->update('driver', $data);
            $responce = array(
                'success' => true,
            );

        }
        else
        {
            $responce = $this
                ->Api_model
                ->tokenfailed();
        }
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
		               'user_id' => $para2,
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
			$loop = $this->db->get_where('wallet_vendor_transactions',array('vendor_id'=>$para2,'type' => 'driver'))->result_array();
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
	
	

    /** dashboard **/
    function dashboard($para1 = '', $para2 = '', $para3 = '')
    {
        if ($this
            ->Api_model
            ->singleselectbox('driver', 'driver_id', $para2, 'token') == $this
            ->input
            ->get('api_token', true))
        {
            if ($para1 == 'topbar')
            {
                $today = date("Y-m-d");
               
                $start = $this->Api_model->date_timestamp($today, 'start');
                $sevenStart =  strtotime('-7 day', strtotime($today));
                $end = $this ->Api_model->date_timestamp($today, 'end');
                $todayEarn = 0;
                $thismonthEarn = 0;
                $totalEarn = 0;
                $lastsDayEarn = 0;
                
               
                /** today earn **/
                  $todayEarn =   $this ->Api_model->sumof_sammaryReportdatewise('vendor_invoice', 'driver_id', $para2, 'deliverycompleted_time >=', $start, 'deliverycompleted_time <=', $end, 'driver_settlement_value') ;
                
                /** thismonth **/
                  $month = date('m');
                  $thismonthEarn =  $this ->Api_model->sum_totalsalesreport($month, 'vendor_invoice', 'deliverycompleted_time', 'driver_settlement_value') ;
                
                /** totalEarn **/
                  $totalEarn = $this->Api_model->sumof_sammaryReport('vendor_invoice', 'driver_id', $para2, 'driver_settlement_value');
                
                 /** last seven earn **/
                  $lastsDayEarn = $this ->Api_model->sumof_sammaryReportdatewise('vendor_invoice', 'driver_id', $para2, 'deliverycompleted_time >=',  $sevenStart, 'deliverycompleted_time <=', $end, 'driver_settlement_value');
                
             
                
                $data = array(
                    'todayEarn' =>  $todayEarn ,
                    'thisMonthEarn' => $thismonthEarn,
                    'lastSDaysEarn' => $lastsDayEarn,
                    'totalEarn' =>  $totalEarn,
                    'cashInHand'  => floatval($this->Api_model->singleselectbox('driver','driver_id', $para2, 'cin')),                  
                    'todayOrders' => $this ->Api_model ->count_4wcopt('vendor_invoice', 'driver_id', $para2, 'method !=', 'cancelled', 'deliver_assignedtime >=', $start, 'deliver_assignedtime <=', $end) ,
                    'thisMonthOrders' => $this->Api_model->count_monthreport( $month ,'vendor_invoice' , 'driver_id', $para2, 'count','1'),
                    'totalOrders' => $this->Api_model ->count_2wcopt('vendor_invoice', 'driver_id', $para2, 'method !=', 'cancelled') ,
                    'rating' => $this->Api_model->singleselectbox('driver','driver_id', $para2, 'rating_total'),
                 
                   
                   
              
                );

                $responce = array(
                    'success' => true,
                    'data' => $data,
                    'message' => 'topbar retrieved successfully',
                );
            }
        }
        else
        {
            $responce = $this
                ->Api_model
                ->tokenfailed();

        }

        echo json_encode($responce);

    }
    
    
    

    /** register **/
    function register($para1 = '', $para2 = '', $para3 = '')
    {

        $row = json_decode($this->input->post('name'), true);
        $data['name'] = $row['firstname'];
        $data['last_name'] = $row['lastname'];
        $data['date'] = time();
        $data['status'] = 'waiting';
        $data['age'] = $row['dob'];
        $data['gender'] = $row['gender'];
        $data['email'] = $row['email'];
        $data['password'] = sha1($row['password']);
        $data['phone'] = $row['mobile'];
        $data['address'] = $row['address1'] . ',' . $row['address2'] . ',' . $row['city'] . ',' . $row['state'] . ',' . $row['zipcode'] . '.';
        $data['latitude'] = $row['latitude'];
        $data['longitude'] = $row['longtitude'];
        $data['store_id'] = $row['storeId'];
        $data['drivingMode'] = $row['drivingMode'];
        $data['token'] = '1';
        $data['device_id'] = '1';
        $data['livestatus'] = 'false';
        $data['block'] = 'false';
        $data['vehicle_type'] = $row['vehicleType'];
        if($data['vehicle_type']=='Bike'){
             $data['licence'] = $row['licenseno'];
        }
        $data['vehicle_model'] = $row['model'];
        $data['vehicle_color'] = $row['color'];
        $data['zone_id'] = $row['zoneId'];
        
        
        
        $this ->db->insert('driver', $data);
        $id = $this ->db ->insert_id();
        
        
        $path1 = $_FILES['proofImage']['name'];
        $ext1 = pathinfo($path1, PATHINFO_EXTENSION);
        $driver_proof = 'driver_proof' . $id . '.' . $ext1;
        
          $this
            ->crud_model
            ->file_up("proofImage", "driver_proof", $id, '', 'no', '.' . $ext1);
        
        
        $kyc_details = array(
                           'proof_type' => $row['proofType'],
                           'account_holder' => $row['accountName'],
                           'account_no' => $row['accountNo'],
                           'bank_name' => $row['bankName'],
                           'bank_code' => $row['bankCode'],
                           'proof' => $driver_proof
                         ); 
        
        $data_banner['kyc_details'] =  json_encode( $kyc_details);
        
      
        
        
        $path = $_FILES['image']['name'];
        $ext = pathinfo($path, PATHINFO_EXTENSION);
        $ext = 'png';
        $data_banner['image'] = 'driver_' . $id . '.' . $ext;
        $this
            ->crud_model
            ->file_up("image", "driver", $id, '', 'no', '.' . $ext);
        
        $this
            ->db
            ->where('driver_id', $id);
        $this
            ->db
            ->update('driver', $data_banner);
        $data = ["success" => true, ];

        echo json_encode($responce);

    }
    
    function recharge(){
		
		$content_data = file_get_contents("php://input");
		$get_data     = json_decode($content_data);
	  
	   $balance = $this->Api_model->singleselectbox('secondary_wallet','vendor_id',$get_data->user_id,'balance');
	   $amount = $balance - $get_data->amount;
       $multiClause = array('vendor_id' => $get_data->user_id, 'type' => 'driver');
		$data['vendor_id']       = $get_data->user_id;
		$data['balance']       = $amount;
		$data['last_update']    = time();
		$data['last_amount']     = $get_data->amount;
		$data['type'] = 'driver';
		$this->db->where($multiClause);
		$this->db->update('secondary_wallet',$data);
		$data1['vendor_id']      =  $get_data->user_id;
		$data1['amount']         =  $get_data->amount;
		//$data1['balance']        =   500;
		$data1['status']         =  'requested';
		$data1['requested_date'] =  time();
		$data1['type']           =  'driver';
		$this->db->insert('wallet_vendor_transactions',$data1);
		
		
		  $responce = array(
					   'success' => true,
					   'data' => 'success',
					   'message' => 'register retrieved successfully',
					  );
	 echo json_encode($responce);	
  }
    /*Zone List*/
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

