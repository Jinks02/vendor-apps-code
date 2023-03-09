<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');
class Api_vendor extends CI_Controller
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

    header('Content-Type: application/json');
    $this
        ->load
        ->helper('url');
    $this
        ->load
        ->model("Api_model");

    }

   
   /* setting */
    function setting()
    {

        $data = ["success" => true, "data" => ["app_name" => $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '3', 'value') , "default_delivery_fees" => $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '86', 'value') , "min_purchase_df" => $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '92', 'value') , "default_currency" => $this
            ->Api_model
            ->get_currency() , "enable_paypal" => "1", "google_maps_key" => $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '67', 'value') , 
              "mobile_language" =>$this
            ->Api_model
            ->get_type_name_by_id('general_settings', '110', 'value'),
             "app_version" => "1.0.0", "enable_version" => "1", 
                                                "currency_right" => $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '83', 'value')==1?true:false , 
              "default_currency_decimal_digits" => $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '111', 'value') ,
              "razorpay_key" => $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '84', 'value') , 
            "language" => 'English',
            "autoassing" => $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '91', 'value') ? true : false,
            "rayzorPay" => $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '102', 'value')? true : false,
              "upi" => $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '103', 'value')? true : false,
            "paypal" => $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '104', 'value')? true : false,
            "stripe" => $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '107', 'value')? true : false,
             "flutterWave" => $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '106', 'value')? true : false,

        ], "message" => "Settings retrieved successfully"];
        echo json_encode($data);

    }
    
    
    
    
    /**Wallet**/
function VendorWallet($para1='',$para2=''){
if($para1=='add'){
  
            $id=$para2;
             $data['vendor_id'] = $id;
             $data['amount'] = $this->input->post('amount');
             $data['status'] = 'request';
             $data['requested_date '] = time();
             $data['type'] = 'vendor';
             $this ->db->insert('wallet_vendor_transactions', $data);
    
          $balance =  $this->db->get_where('vendor_wallet',array('vendor_id' =>$id))->row()->balance;
    
               $data1['balance'] =   $balance - $this->input->post('amount');
               $data1['last_update'] = time();
               $data1['totalamount'] =  $this->input->post('amount');
                $this->db->where('vendor_id',$para2);
                $this->db->update('vendor_wallet',$data1);
                
    
               
    
                $responce = array(
                    'success' => true,
                );
            
        }
	
	if($para1=='list'){
		$this->db->order_by('wallet_vendor_transactions_id', 'desc');
              $loop = $this ->db->get_where('wallet_vendor_transactions',array('vendor_id'=>$para2,'type'=>'vendor'))->result_array();
                foreach ($loop as $row)
                {
                     
                    if($row['process_date']!=''){
                   $processDate = date("Y-m-d",$row['process_date']);
                    } else{
                       $processDate = ''; 
                    }
                    $data[] = array(
                        'id' => $row['wallet_vendor_transactions_id'],
                        'vendorId' => $row['vendor_id'],
                        'amount' => $row['amount'],
                        'status' => $row['status'],
                        'notes' => $row['notes'],
						'reqDate'=>date("Y-m-d",$row['requested_date']),
						'processDate'=> $processDate,
                    );

                }
				$responce = array(
                    'data' => $data,
                    'message' => 'H_category retrieved successfully',
                    'success' => true
                );
	}
	echo json_encode($responce);
}

 
     /* export action */
    function export_action($para1 = '', $para2 = '', $para3 = '')
    {
      
       
        if ($this
            ->Api_model
            ->singleselectbox('vendor', 'vendor_id', $para2, 'token') == $this
            ->input
            ->get('api_token', true))
        {
            $para3;
            $this
                ->load
                ->model("Ieport_model");
            $date = date("Y-m-d");

            if ($para1 == 'sales')
            {

                $filename = $date . '_sales.csv';
                header("Content-Description: File Transfer");
                header("Content-Disposition: attachment; filename=$filename");
                header("Content-Type: application/csv; ");
                $usersData = $this
                    ->Ieport_model
                    ->fetch_data('sales', $para2);

            }
            else if ($para1 == 'orders')
            {
               

                $filename = $date . '_orders.csv';
                header("Content-Description: File Transfer");
                header("Content-Disposition: attachment; filename=$filename");
                header("Content-Type: application/csv; ");
                $usersData = $this->Ieport_model->fetch_data('orders', $para2);

            }
            else if ($para1 == 'my_foodproductlist')
            {

                $filename = $date . '_my_foodproductlist.csv';
                header("Content-Description: File Transfer");
                header("Content-Disposition: attachment; filename=$filename");
                header("Content-Type: application/csv; ");
                $usersData = $this
                    ->Ieport_model
                    ->myfoodproduct('export', $para2);
            }
            else if ($para1 == 'my_productlist' && $para3 != 2)
            {

                $filename = $date . '_my_productlist.csv';
                header("Content-Description: File Transfer");
                header("Content-Disposition: attachment; filename=$filename");
                header("Content-Type: application/csv; ");
                $usersData = $this
                    ->Ieport_model
                    ->myproduct('export', $para2);
            }
            else if ($para1 == 'my_productlist' && $para3 == 2)
            {

                $filename = $date . '_my_productlist.csv';
                header("Content-Description: File Transfer");
                header("Content-Disposition: attachment; filename=$filename");
                header("Content-Type: application/csv; ");
                $usersData = $this
                    ->Ieport_model
                    ->myre_product('export', $para2);
            }
            else if ($para1 == 'my_foodvariantlist')
            {

                $filename = $date . '_my_foodvariantlist.csv';
                header("Content-Description: File Transfer");
                header("Content-Disposition: attachment; filename=$filename");
                header("Content-Type: application/csv; ");
                $usersData = $this
                    ->Ieport_model
                    ->myfoodvariant('export', $para2);
            }
            else if ($para1 == 'my_variantlist' && $para3 != 2)
            {

                $filename = $date . '_my_variantlist.csv';
                header("Content-Description: File Transfer");
                header("Content-Disposition: attachment; filename=$filename");
                header("Content-Type: application/csv; ");
                $usersData = $this
                    ->Ieport_model
                    ->myvariant('export', $para2);
            }
            else if ($para1 == 'my_variantlist' && $para3 == 2)
            {

                $filename = $date . '_my_variantlist.csv';
                header("Content-Description: File Transfer");
                header("Content-Disposition: attachment; filename=$filename");
                header("Content-Type: application/csv; ");
                $usersData = $this
                    ->Ieport_model
                    ->myre_variant('export', $para2);
            }
            else if ($para1 == 'my_addons' && $para3 == 2)
            {

                $filename = $date . '_my_addions.csv';
                header("Content-Description: File Transfer");
                header("Content-Disposition: attachment; filename=$filename");
                header("Content-Type: application/csv; ");
                $usersData = $this
                    ->Ieport_model
                    ->myaddons('export', $para2);
            }

            $file = fopen('php://output', 'w');

            $header = array(
                "",
                "",
                ""
            );
            fputcsv($file, $header);
            foreach ($usersData as $key => $line)
            {
                fputcsv($file, $line);
            }

            fputcsv($file, '1');
            fclose($file);
            exit;

        }
        else
        {
            $responce = $this
                ->Api_model
                ->tokenfailed();
        }
    }

    
    
    /** takeaway orders **/
    
    
        function takeawayOrder($para1 = '', $para2 = '', $para3 = '', $para4 = '')
    {

        if ($this
            ->Api_model
            ->singleselectbox('vendor', 'vendor_id', $para4, 'token') == $this
            ->input
            ->get('api_token', true))
        {
            if ($para1 == 'list')
            {
               
               if($para2=='all'){
                    $loop = $this  ->db  ->get_where('sale', array('vendor' => $para4,'order_type' => '3' ))->result_array();
                } else if($para2!='Cancelled' && $para2!='all' ){
                
                $this
                    ->db
                    ->order_by('sale_id', 'desc');
                $loop = $this  ->db  ->get_where('sale', array('vendor' => $para4,  'status' => $para2,'status !=' => 'cancelled',
                                                              'order_type ' => '3' ))->result_array();
               } else{
                    
                   $this
                    ->db
                    ->order_by('sale_id', 'desc');
                $loop = $this  ->db  ->get_where('sale', array('vendor' => $para4,  'status' => 'cancelled', 'order_type' => '3' ))->result_array(); 
                }
                
                
                foreach ($loop as $row)
                {
                    $loop1 = json_decode($row['product_details'], true);
                    
                  
                    $i = 1;
                    foreach ($loop1 as $row1)
                    {
                        if ($i == 1)
                        {
                            $image = $row1['image'];
                            $name = $row1['product_name'];
                        }
                        $i++;
                    }
                      $this->Api_model->timeZone();
                    $date = date('M, d Y, h:i A', $row['sale_datetime']);
                    $data[] = array(
                        'orderId' => $row['sale_code'],
                        'status' => $row['status'],
                        'price' => $row['grand_total'],
                        'contact' => $this
                            ->db
                            ->get_where('user', array(
                            'user_id' => $row['buyer']
                        ))->row()->phone,
                        'username' => $this
                            ->db
                            ->get_where('user', array(
                            'user_id' => $row['buyer']
                        ))->row()->username,
                        'userId' => $row['buyer'],
                        'paymentType' => $row['payment_type'],
                        'details' => '1',
                        'itemImage' => $image,
                        'date' => $date,
                        'itemTotal' => count($loop1) ,
                        'orderType' => $row['order_type'],
                        'deliverSlot' => $row['delivery_slot'],
                        'shopTypeId' => $this
                            ->db
                            ->get_where('shop_focus', array(
                            'shop_focus_id' => $row['focus_id']
                        ))->row()->shop_type,
                        'pImage' => $row['p_image'] ? base_url() . 'uploads/sales_image/' . $row['p_image'] : 'no_image',
                    );
                }
                $responce = array(
                    'success' => true,
                    'data' => $data,
                    'message' => 'coupons retrieved successfully',
                );

            }
        }
              echo json_encode($responce);

        }


    /**  Order */

    function Order($para1 = '', $para2 = '', $para3 = '', $para4 = '')
    {

        if ($this
            ->Api_model
            ->singleselectbox('vendor', 'vendor_id', $para4, 'token') == $this
            ->input
            ->get('api_token', true))
        {
            if ($para1 == 'list')
            {

                $this
                    ->db
                    ->select('sale_code, status, grand_total, buyer, payment_type, product_details, sale_datetime,order_type,delivery_slot,focus_id,p_image ');
                if($para2!='Cancelled' && $para2!='all' ){
                $this
                    ->db
                    ->order_by('sale_id', 'desc');
                $loop = $this  ->db  ->get_where('sale', array('vendor' => $para4,  'status' => $para2,'status !=' => 'cancelled','order_type !=' => '3' ))->result_array();
                }
                else if($para2=='all'){
                    $loop = $this  ->db  ->get_where('sale', array('vendor' => $para4,'order_type !=' => '3' ))->result_array();
                }
                else{
                    
                   $this
                    ->db
                    ->order_by('sale_id', 'desc');
                $loop = $this  ->db  ->get_where('sale', array('vendor' => $para4,  'status' => 'cancelled', 'order_type !=' => '3' ))->result_array(); 
                }
                $image = '';
                foreach ($loop as $row)
                {
                    $loop1 = json_decode($row['product_details'], true);
                    $i = 1;
                    foreach ($loop1 as $row1)
                    {
                        if ($i == 1)
                        {
                            $image = $row1['image'];
                            $name = $row1['product_name'];
                        }
                        $i++;
                    }
                    $this->Api_model->timeZone();
                    $date = date('M, d Y, h:i A', $row['sale_datetime']);
                    $data[] = array(
                        'orderId' => $row['sale_code'],
                        'status' => $row['status'],
                        'price' => $row['grand_total'],
                        'contact' => $this
                            ->db
                            ->get_where('user', array(
                            'user_id' => $row['buyer']
                        ))->row()->phone,
                        'username' => $this
                            ->db
                            ->get_where('user', array(
                            'user_id' => $row['buyer']
                        ))->row()->username,
                        'userId' => $row['buyer'],
                        'paymentType' => $row['payment_type'],
                        'details' => '1',
                        'itemImage' => $image,
                        'date' => $date,
                        'itemTotal' => count($loop1) ,
                        'orderType' => $row['order_type'],
                        'deliverSlot' => $row['delivery_slot'],
                        'shopTypeId' => $this
                            ->db
                            ->get_where('shop_focus', array(
                            'shop_focus_id' => $row['focus_id']
                        ))->row()->shop_type,
                        'pImage' => $row['p_image'] ? base_url() . 'uploads/sales_image/' . $row['p_image'] : 'no_image',
                    );
                }
                $responce = array(
                    'success' => true,
                    'data' => $data,
                    'message' => 'coupons retrieved successfully',
                );

            }
            else if ($para1 == 'invoicefull')
            {

                $loop = $this
                    ->db
                    ->get_where('sale', array(
                    'sale_code' => $para2
                ))->result_array();
                foreach ($loop as $row)
                {

                    $vendor_detail = array(
                        'username' => $this
                            ->db
                            ->get_where('user', array(
                            'user_id' => $row['buyer']
                        ))->row()->username,
                        'phone' => $this
                            ->db
                            ->get_where('user', array(
                            'user_id' => $row['buyer']
                        ))->row()->phone,
                        'addressSelect' => $this
                            ->db
                            ->get_where('user', array(
                            'user_id' => $row['buyer']
                        ))->row()->address1,

                    );

                    $data = array(
                        'orderId' => $row['sale_code'],
                        'cart' => json_decode($row['product_details'], true) ,
                        'userDetails' => json_decode($row['shipping_address'], true) ,
                        'grand_total' => $row['grand_total'],
                        'username' => $this
                            ->db
                            ->get_where('user', array(
                            'user_id' => $row['buyer']
                        ))->row()->username,
                        'userId' => $row['buyer'],
                        'paymentType' => $row['payment_type'],
                        'paymentType' => $row['payment_type'],
                        'vendorDetails' => $vendor_detail,
                        'date' => date('M, d Y, h:i A', $row['sale_datetime']) ,
                        'orderType' => $row['order_type']
                    );
                }
                $responce = array(
                    'success' => true,
                    'data' => $data,
                    'message' => 'invoice retrieved successfully',
                );

            }
            else if ($para1 == 'summaryReport')
            {

                $data = array(
                    'totalRevenue' => $this
                        ->Api_model
                        ->sumof_sammaryReport('vendor_invoice', 'vendor_id', $para4, 'settlement_value') ,
                    'thisMonthRevenue' => $this
                        ->Api_model
                        ->count_monthreport(date('m') , 'vendor_invoice', 'vendor_id', $para4, 'sum', 'settlement_value') ,
                    'totalPaid' => $this
                        ->Api_model
                        ->sumof_sammaryReportwithc('vendor_invoice', 'vendor_id', $para4, 'status', 'paid', 'settlement_value') ,
                    'totalDue' => $this
                        ->Api_model
                        ->sumof_sammaryReportwithc('vendor_invoice', 'vendor_id', $para4, 'status', 'due', 'settlement_value') ,
                    'totalOrders' => $this
                        ->Api_model
                        ->count_2wcopt('vendor_invoice', 'vendor_id', $para4, 'method !=', 'cancelled') ,
                    'thisMonthOrders' => $this
                        ->Api_model
                        ->count_monthreport(date('m') , 'vendor_invoice', 'vendor_id', $para4, 'count', '') ,
                    'totalPaidOrders' => $this
                        ->Api_model
                        ->count_3wcopt('vendor_invoice', 'vendor_id', $para4, 'method !=', 'cancelled', 'status', 'paid') ,
                    'totalDueOrders' => $this
                        ->Api_model
                        ->count_3wcopt('vendor_invoice', 'vendor_id', $para4, 'method !=', 'cancelled', 'status', 'due') ,
                );

                $responce = array(
                    'success' => true,
                    'data' => $data,
                    'message' => 'summary report retrieved successfully',
                );

            }
            else if ($para1 == 'invoiceList')
            {
                $this
                    ->db
                    ->order_by('vendor_invoice_id', 'desc');
                $loop = $this
                    ->db
                    ->get_where('vendor_invoice', array(
                    'vendor_id' => $para4
                ))->result_array();
                $i = 0;
                foreach ($loop as $row)
                {

                    $i++;
                    $data[] = array(
                        'id' => $i,
                        'invoiceID' => '#' . $row['invoice_id'],
                        'itemAmount' => $row['order_amount'],
                        'settlementAmount' => $row['settlement_value'],
                        'commission' => $row['commission'],
                        'paymentMethod' => $row['method'],
                        'status' => $row['status'],
                        'date' => date("F j, Y", $row['order_date']) ,
                        'transactionID' => $row['transaction_id'] == '' ? 'waiting' : $row['transaction_id'],
                    );

                }

                $responce = array(
                    'success' => true,
                    'data' => $data,
                    'message' => 'payment details retrieved successfully',
                );

            }
            else if ($para1 == 'invoiceView')
            {
                $loop = $this
                    ->db
                    ->get_where('sale', array(
                    'sale_code' => $para2
                ))->result_array();
                //'payment' => json_decode($row['payment_details']),
                //'orderDate' =>  date("F j, Y",$row['sale_datetime']),
                //'userId' =>   '12',
                //		'status' =>  $row['status'],
                //	'saleCode' => $row['sale_code'],
                //	'instanceDelivery' => false,
                foreach ($loop as $row)
                {
                    $addressShop = array(
                        'addressSelect' => $this
                            ->Api_model
                            ->singleselectbox('vendor', 'vendor_id', $row['vendor'], 'address1') ,
                        'username' => $this
                            ->Api_model
                            ->singleselectbox('vendor', 'vendor_id', $row['vendor'], 'display_name') ,
                        'phone' => $this
                            ->Api_model
                            ->singleselectbox('vendor', 'vendor_id', $row['vendor'], 'phone') ,
                    );

                    $data = array(
                        'id' => $row['sale_id'],
                        'productDetails' => json_decode($row['product_details']) ,
                        'addressUser' => json_decode($row['shipping_address']) ,
                        'addressShop' => $addressShop,
                        'payment' => json_decode($row['payment_details']) ,
                        'couponData' => json_decode($row['coupon_details']),
                        'orderDate' => date("F j, Y", $row['sale_datetime']) ,
                        'status' => $row['status'],
                        'userId' => '12',
                        'saleCode' => $row['sale_code'],
                        'instanceDelivery' => false,
                        'shopType' => $this->db->get_where('vendor', array('focus_id' => $row['focus_id']))->row()->type,
                    );

                }
                $responce = array(
                    'success' => true,
                    'data' => $data,
                    'message' => 'invoice details retrieved successfully',
                );
            }
            else if ($para1 == 'statusUpdate')
            {

                $data['status'] = $para3;

                $this
                    ->db
                    ->where('sale_code', $para2);
                $this
                    ->db
                    ->update('sale', $data);

                $responce = array(
                    'success' => true,
                );
            }
            else if ($para1 == 'search')
            {

                $this
                    ->db
                    ->like('sale_code', $para3);
                $this
                    ->db
                    ->select('sale_code, status, grand_total, buyer, payment_type, product_details, sale_datetime,order_type,delivery_slot');
                $this
                    ->db
                    ->order_by('sale_id', 'desc');
                $loop = $this
                    ->db
                    ->get_where('sale', array(
                    'vendor' => $para4
                ))->result_array();
                foreach ($loop as $row)
                {
                    $loop1 = json_decode($row['product_details'], true);
                    $i = 1;
                    foreach ($loop1 as $row1)
                    {
                        if ($i == 1)
                        {
                            $image = $row1['image'];
                            $name = $row1['product_name'];
                        }
                        $i++;
                    }
                    $date = date('M, d Y, h:i A', $row['sale_datetime']);
                    $data[] = array(
                        'orderId' => $row['sale_code'],
                        'status' => $row['status'],
                        'price' => $row['grand_total'],
                        'contact' => $this
                            ->db
                            ->get_where('user', array(
                            'user_id' => $row['buyer']
                        ))->row()->phone,
                        'username' => $this
                            ->db
                            ->get_where('user', array(
                            'user_id' => $row['buyer']
                        ))->row()->username,
                        'userId' => $row['buyer'],
                        'paymentType' => $row['payment_type'],
                        'details' => '1',
                        'itemImage' => $image,
                        'date' => $date,
                        'itemTotal' => count($loop1) ,
                        'orderType' => $row['order_type'],
                        'deliverSlot' => $row['delivery_slot']
                    );
                }
                $responce = array(
                    'success' => true,
                    'data' => $data,
                    'message' => 'coupons retrieved successfully',
                );
            }
            else if ($para1 == 'amountUpdate')
            {

                $data['grand_total'] = $para2;
                $this
                    ->db
                    ->where('sale_code', $para3);
                $this
                    ->db
                    ->update('sale', $data);
                $responce = array(
                    'success' => true,
                    'data' => $data,
                    'message' => 'coupons retrieved successfully',
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

    /** dashboard **/
    function dashboard($para1 = '', $para2 = '', $para3 = '')
    {
        if ($this
            ->Api_model
            ->singleselectbox('vendor', 'vendor_id', $para2, 'token') == $this
            ->input
            ->get('api_token', true))
        {
            if ($para1 == 'topbar')
            {

                $neworders = $this
                    ->Api_model
                    ->count_2wcopt('sale', 'vendor', $para2, 'status', 'Placed');
                $processing = $this
                    ->Api_model
                    ->count_2wcopt('sale', 'vendor', $para2, 'status', 'Accepted');
                $outForDelivery = $this
                    ->Api_model
                    ->count_2wcopt('sale', 'vendor', $para2, 'status', 'Shipped');
                $completed = $this
                    ->Api_model
                    ->count_2wcopt('sale', 'vendor', $para2, 'status', 'Delivered');

                $totalorders = $neworders + $processing + $outForDelivery + $completed;

                $newOrdersPercent = intval(($neworders * 100) / $totalorders);
                $processingPercent = intval(($processing * 100) / $totalorders);
                $outForDeliveryPercent = intval(($outForDelivery * 100) / $totalorders);
                $completePercent = intval(($completed * 100) / $totalorders);

                $codearn = $this
                    ->Api_model
                    ->sumof_sammaryReportwithc('vendor_invoice', 'vendor_id', $para2, 'method', 'cash on delivery', 'settlement_value');
                $onlineearn = $this
                    ->Api_model
                    ->sumof_sammaryReportwithc('vendor_invoice', 'vendor_id', $para2, 'method', 'online', 'settlement_value');

                $type = $this
                    ->Api_model
                    ->singleselectbox('vendor', 'vendor_id', $para2, 'type');

                if ($type == 2)
                {
                    $totalproducts = $this
                        ->Api_model
                        ->count_wcopt('restaurantproduct', 'added_by', json_encode(array(
                        'type' => 'vendor',
                        'id' => $para2
                    )));
                }
                else
                {
                    $totalproducts = $this
                        ->Api_model
                        ->count_wcopt('product', 'added_by', json_encode(array(
                        'type' => 'vendor',
                        'id' => $para2
                    )));
                }

                $data = array(
                    'newOrders' => $neworders,
                    'processing' => $processing,
                    'outForDelivery' => $outForDelivery,
                    'completed' => $completed,
                    'newOrdersPercent' => $newOrdersPercent,
                    'processingPercent' => $processingPercent,
                    'outForDeliveryPercent' => $outForDeliveryPercent,
                    'completePercent' => $completePercent,
                    'totalEarnCod' => $codearn,
                    'totalEarnOnline' => $onlineearn,
                    'totalEarn' => $codearn + $onlineearn,
                    'totalProducts' => $totalproducts,
                    'totalCategory' => $this
                        ->Api_model
                        ->count_wcopt('category', 'data_vendors', $para2) ,
                    'totalSales' => $this
                        ->Api_model
                        ->count_wcopt('sale', 'vendor', $para2) ,
                    'thisMonthSales' => $this
                        ->Api_model
                        ->count_monthreport(date('m') , 'vendor_invoice', 'vendor_id', $para2, 'sum', 'settlement_value')
                );
                $responce = array(
                    'success' => true,
                    'data' => $data,
                    'message' => 'dashboard retrieved successfully',
                );
            }
            else if ($para1 == 'bargraph')
            {

                for ($i = 1;$i <= 12;$i++)
                {
                    $data[] = array(
                        'month' => $i,
                        'instance' => $this
                            ->Api_model
                            ->count_monthreport($i, 'sale', 'vendor', $para2, 'instance', '') ,
                        'schedule' => $this
                            ->Api_model
                            ->count_monthreport($i, 'sale', 'vendor', $para2, 'schedule', '') ,
                    );

                }

                $responce = array(
                    'success' => true,
                    'data' => $data,
                    'message' => 'dashboard retrieved successfully',
                );
            }
            else if ($para1 == 'liveordertrack')
            {
                $this
                    ->db
                    ->select('order_amount, buyer_id, invoice_id');
                $this
                    ->db
                    ->order_by('vendor_invoice_id', 'desc');
                $this
                    ->db
                    ->limit(1);
                $loop = $this
                    ->db
                    ->get_where('vendor_invoice', array(
                    'vendor_id' => $para2
                ))->result_array();
                if (count($loop) > 0)
                {
                    foreach ($loop as $row)
                    {
                        $data = array(
                            'count' => $this
                                ->Api_model
                                ->count_2wcopt('sale', 'vendor', $para2, 'status', 'Placed') ,
                            'orderID' => $row['invoice_id'],
                            'name' => $this
                                ->Api_model
                                ->singleselectbox('user', 'user_id', $row['buyer_id'], 'username') ,
                            'amount' => $row['order_amount'],
                        );
                    }
                }
                else
                {
                    $data = array(
                        'count' => 0,
                        'orderID' => '',
                        'name' => '',
                        'amount' => '',
                    );
                }

                $responce = array(
                    'success' => true,
                    'data' => $data,
                    'message' => 'order count successfully',
                );
            }
            else if ($para1 == 'initialOrderCount')
            {

                $responce = array(
                    'success' => true,
                    'data' => $this
                        ->Api_model
                        ->count_2wcopt('sale', 'vendor', $para2, 'status', 'Placed') ,
                    'message' => 'order count successfully',
                );
            }
            else if ($para1 == 'live_status')
            {

                $data['livestatus'] = $para3;
                $this
                    ->db
                    ->where('vendor_id', $para2);
                $this
                    ->db
                    ->update('vendor', $data);
                $responce = array(
                    'success' => true,
                    'data' => 'success',
                    'message' => 'user update successfully',
                );

            }
            else if ($para1 == 'topproducts')
            {
            
                    if($para3=='2'){
                    $this->db->order_by('sales_count', 'desc');
                    $this->db->limit(10);
                    $this->db ->select('title, restaurantproduct_id,sales_count');
                    $loop = $this ->db
                    ->get_where('restaurantproduct', array(
                        'added_by'=> json_encode( array('type' => 'vendor','id' => $para2
                        ))))->result_array();
                    }
                    else{
                    $this
                    ->db
                    ->order_by('sales_count', 'desc');
                    $this
                    ->db
                    ->limit(10);
                    $this
                    ->db
                    ->select('title,product_id,sales_count');
                    $loop = $this
                    ->db
                    ->get_where('product',array(
                        'added_by'=> json_encode( array('type' => 'vendor','id' => $para2
                        ))))->result_array();

                    }
                if (count($loop) > 0)
                {
                    foreach ($loop as $row)
                    {
                        if($para3=='2'){
                            $this->db  ->limit(1);
                        $variant = $this->db->get_where('variant', array(
                            'product_id' => $row['restaurantproduct_id']
                        ))->result_array();
                        } else{
                            $this ->db->limit(1);
                        $variant = $this
                            ->db
                            ->get_where('variant_2', array(
                            'product_id' => $row['product_id']
                        ))->result_array();
                        }
                        foreach ($variant as $row2)
                            {
                                if ($row2['image'] != '')
                                {
                                 if($row2['image_type']=='internal'){
                                     if($para3=='2'){
                                     $image = base_url() . 'uploads/restaurantproduct_image/' . $row2['image'];
                                     } else {
                                      $image = base_url() . 'uploads/product_image/' . $row2['image'];
                                     }
                                  }else{
                                     $image = $row2['image'];
                                 }
                                }
                                else
                             {
                            $image = 'no_image';
                           }
                            }

                        $data[] = array(
                            'name' => $row['title'],
                            'image' => $image,
                            'count' => $row['sales_count'],
                            'id' => $row['product_id'],
                        );

                    }
                    $responce = array(
                        'success' => true,
                        'data' => $data,
                    );
                }

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

    


   

    function setdefault($para1 = '', $para2 = '')
    {

        $data['isDefault'] = false;
        $this
            ->db
            ->where('userid', $para1);
        $this
            ->db
            ->update('address', $data);

        $data['isDefault'] = 'true';
        $this
            ->db
            ->where('address_id', $para2);
        $this
            ->db
            ->update('address', $data);
        $data = ["success" => true, "data" => [], "message" => "setdefault address successfully"];

        echo json_encode($data);
    }
   /* shoptheoffer */
    function shoptheoffer($para1 = '', $para2='')
    {
        $loop = $this
            ->db
            ->get_where('shop_the_offer')
            ->result_array();
        foreach ($loop as $row2)
        {
            $data[] = array(
                'offer' => $row2['offer'],
                'image' => base_url() . 'uploads/shop_the_offer_image/' . $row2['image'],
            );
        }

        $responce = array(
            'success' => true,
            'data' => $data,
            'message' => 'shop offer  successfully',
        );
        echo json_encode($responce);
    }

    
    
    function profileUpdateSteps($para1 = '', $para2 = '', $para3 = ''){
      
        if ($para1 == 'basic'){
             $general_info = json_decode($this->input->post('title'));
       
             $data['company'] = $general_info->companyLegalName;
             $data['display_name'] = $general_info->storeName;
             $data['subtitle'] = $general_info->subtitle;
             $data['general_detail'] = $this->input->post('title');
             $data['latitude']   =    $general_info->latitude;
             $data['longitude']   = $general_info->longitude;
             $data['address1']   = $general_info->pickupAddress;
             $data['phone']   = $general_info->mobile;
             $data['name']   = $general_info->ownerName;
             $data['zone_id']   = $general_info->zoneId;
             $data['handover_time']   = $general_info->handOverTime;
            
             $data['livestatus'] = 'false';
             $data['profile_complete'] = '2';

            
            $path = $_FILES['image']['name'];
            $ext = pathinfo($path, PATHINFO_EXTENSION);
            $data['logo'] = 'vendor_' . $para3 . '.' . 'png';
            
            $this->db->where('vendor_id', $para3);
            $this->db->update('vendor', $data);
            $this ->crud_model ->file_up("image", "vendor", $para3, '', 'no', '.png');
        } else if($para1 =='kyc'){
                
             $path = $_FILES['image']['name'];
       
            
             $this ->crud_model ->file_up("image", "vendor_proof", $para3, '', 'no', '.png');
            
             $general_info = json_decode($this->input->post('title'));
             $data['kyc_seller'] = $this->input->post('title'); 
             $data['profile_complete'] = '3';
             $this->db->where('vendor_id', $para3);
             $this->db->update('vendor', $data);
        
         
        } else if($para1 =='setting'){

             $data['profile_complete'] = '4';
             $data['instant']          = '1';
             $data['takeaway']         = '1';
             $data['schedule']         = '1';
             $data['driver_assign']    = '1';
             $data['auto_assign']      = '1';
             $this->db->where('vendor_id', $para3);
             $this->db->update('vendor', $data);
        }
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
    


    /** profile update**/
    function profileUpdate($para1 = '', $para2 = '', $para3 = '')
    {
        if ($this
            ->Api_model
            ->singleselectbox('vendor', 'vendor_id', $para2, 'token') == $this
            ->input
            ->get('api_token', true))
        {
            $content_data = file_get_contents("php://input");
            $get_data = json_decode($content_data);
            if ($para1 == 'general')
            {
                
                
                 $general_info = json_decode($this->input->post('title'));
                
                //$address = $this->Api_model->get_lat_long($get_data->address);
                //$latlong = explode("_",$address );
                $data['company'] = $get_data->companyLegalName;
                $data['address1'] = $get_data->pickupAddress;
                $data['display_name'] = $get_data->storeName;
                $data['phone'] = $get_data->mobile;
                $data['latitude'] = $get_data->latitude;
                $data['longitude'] = $get_data->longitude;
                $data['general_detail'] = json_encode($get_data);
                $data['subtitle'] = $get_data->subtitle;

                $this->db->where('vendor_id', $para2);
                $this->db->update('vendor', $data);
                $responce = array(
                    'success' => true,
                    'data' => 'success'
                );

            }
            else if ($para1 == 'bank_detail')
            {

                $data['kyc_seller'] = json_encode($get_data);
                $this ->db  ->where('vendor_id', $para2);
                $this ->db ->update('vendor', $data);
                $responce = array(
                    'success' => true,
                );
            }
            else if ($para1 == 'deliverySetting')
            {

                $data['auto_assign'] = $get_data->autoAssign;
                $data['driver_assign'] = $get_data->allowAllDeliveryBoys;
                $data['instant'] = $get_data->instantDelivery;
                $data['takeaway'] = $get_data->takeaway;
                $data['schedule'] = $get_data->scheduleDelivery;
                $this ->db  ->where('vendor_id', $para2);
                $this ->db ->update('vendor', $data);
                $responce = array(
                    'success' => true,
                );
            }
            else if ($para1 == 'social_setting')
            {

                $data['social_setting'] = json_encode($get_data);
                $this ->db  ->where('vendor_id', $para2);
                $this ->db ->update('vendor', $data);
                $responce = array(
                    'success' => true,
                );
            }
            else if ($para1 == 'profilelist')
            {
                $this->db->select('general_detail, kyc_seller, rating_num,rating_total, 	instant,takeaway,schedule,social_setting,auto_assign,driver_assign');
                $loop = $this->db ->get_where('vendor', array( 'vendor_id' => $para2))->result_array();
                
                foreach ($loop as $row)
                {
                    $deliverysetting = array(
                                   'autoAssign' => $row['auto_assign']==1?true:false,
                                   'allowAllDeliveryBoys' => $row['driver_assign']==1?true:false,
                                   'instantDelivery' => $row['instant']==1?true:false,
                                   'takeaway' => $row['takeaway']==1?true:false,
                                   'scheduleDelivery' => $row['schedule']==1?true:false,
                                 );
                    
                    
                    $data = array(
                        'general' => json_decode($row['general_detail'], true) ,
                        'bankDetails' => json_decode($row['kyc_seller'], true) ,
                        'deliverySettings' =>  $deliverysetting ,
                        'socialMedialLink' => json_decode($row['social_setting'], true) ,
                        'ratingNum' => $row['rating_num'] ,
                        'ratingTotal' => $row['rating_total'] ,
                        'totalOrders' => $this ->Api_model  ->count_2wcopt('vendor_invoice', 'vendor_id', $para2, 'method !=', 'cancelled') ,
                        'totalProducts' => $this ->Api_model ->count_wcopt('product', 'added_by', json_encode(array(  'type' => 'vendor', 'id' =>$para2
                        ))) ,
                        'instant' => $row['instant']?true:false,
                        'takeaway' => $row['takeaway']?true:false,
                        'schedule' => $row['schedule']?true:false,
                    );
                    $responce = array(
                        'success' => true,
                        'data' => $data,
                        'message' => 'profile retrieved successfully',
                    );
                }

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

    /* register */
    function register()
    {

        $content_data = file_get_contents("php://input");
        $get_data = json_decode($content_data);
        $loop = $this
            ->db
            ->get_where('vendor', array(
            'email' => $get_data->emailId
        ))
            ->result_array();
        if (count($loop) == 0)
        {
            $general_detail = array(
                'email' => $get_data->emailId,
                'name' => '',
                'shopName' => '',
                'subTitle' => '',
                'alternativeMobile' => '',
                'openTime' => '',
                'closeTime' => '',
                'description' => '',
                'startedYear' => '',
                'address' => '',
                'latitude' => 0.1,
                'longitude' => 0.1,
                'autoAssign' => true,
                'driverAssign' => true,
            );
            $bank_detail = array(
                'bankName' => '',
                'accountNo' => '',
                'swiftCode' => '',
            );

            $data['display_name'] = $get_data->name;
            $data['email'] = $get_data->emailId;
            $data['phone'] = $get_data->phone;
            $data['type'] = $this ->Api_model ->singleselectbox('shop_focus', 'shop_focus_id', $get_data->shopTypeId, 'shop_type');
            $data['focus_id'] = $get_data->shopTypeId;
            $data['driver_assign'] = true;
            $data['auto_assign'] = true;
            $data['password'] = sha1($get_data->password);
            $data['general_detail'] = json_encode($general_detail);
            $data['bank_details'] = json_encode($bank_detail);
            $data['create_timestamp'] = time();
            $data['status'] = 'waiting';
            $data['profile_complete'] = 1;
            $data['rating_num'] = 0;
            $data['rating_total'] = 0;
            $this
                ->db
                ->insert('vendor', $data);
            $id = $this
                ->db
                ->insert_id();
            $data = 'success';
        }
        else
        {

            $data = 'fail';
        }

        $data1['fromTime'] = '9:00 AM';
        $data1['toTime'] = '9:00 PM';
        $data1['time_id'] = 21;
        $data1['status'] = 'success';
        $data1['date'] = time();
        $data1['vendor'] = $id;
        $this
            ->db
            ->insert('deliverytimeslot', $data1);
        $responce = array(
            'success' => true,
            'data' => $data,
            'message' => 'register retrieved successfully',
        );
        echo json_encode($responce);
    }
  
  
  /** deliveryTimeSlot **/
    function deliveryTimeSlot($para1 = '', $para2 = '', $para3 = '')
    {

        if ($this
            ->Api_model
            ->singleselectbox('vendor', 'vendor_id', $para3, 'token') == $this
            ->input
            ->get('api_token', true))
        {
            $content_data = file_get_contents("php://input");
            $get_data = json_decode($content_data);
            if ($para1 == 'do_add')
            {

                $data['fromTime'] = $get_data->fromTime;
                $data['toTime'] = $get_data->toTime;
                $data['time_id'] = $get_data->timeId;
                $data['status'] = 'ok';
                $data['date'] = time();
                $data['vendor'] = $para3;
                $this
                    ->db
                    ->insert('deliverytimeslot', $data);
                $responce = array(
                    'success' => true,
                );
            }
            else if ($para1 == 'list')
            {

                $loop = $this
                    ->db
                    ->get_where('deliverytimeslot', array(
                    'vendor' => $para3
                ))->result_array();
                foreach ($loop as $row)
                {
                    $data[] = array(
                        'fromTime' => $row['fromTime'],
                        'toTime' => $row['toTime'],
                        'timeId' => intval($row['time_id']) ,
                        'id' => intval($row['deliverytimeslot_id'])
                    );
                }
                $responce = array(
                    'success' => true,
                    'data' => $data,
                    'message' => 'delivery timeslot retrieved successfully',
                );
            }
            else if ($para1 == 'delete')
            {

                $this
                    ->db
                    ->where('deliverytimeslot_id', $para2);
                $this
                    ->db
                    ->delete('deliverytimeslot');
                $responce = array(
                    'success' => true,
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
    
    
    
    
    /** check email **/
    
    
        function checkUser($para1 = '', $para2 = '')
    {

        $content_data = file_get_contents("php://input");
        $get_data = json_decode($content_data);

        /*$data['device_id'] = $get_data->deviceToken;
        $this->db->where('email',$get_data->email);
        $this->db->update('user',$data);*/

        $loop = $this->db->get_where('vendor', array( 'email' => $get_data->email )) ->result_array();
        if (count($loop) > 0)
        {
          
         $data = array(
                'auth' => false,
            );
        }
       

        $responce = array(
            'success' => true,
            'data' => $data,
            'message' => 'profile retrieved successfully',
        );
        echo json_encode($responce);

    }

    /* login */
    function login($para1 = '', $para2 = '')
    {

        $content_data = file_get_contents("php://input");
        $get_data = json_decode($content_data);

        /*$data['device_id'] = $get_data->deviceToken;
        $this->db->where('email',$get_data->email);
        $this->db->update('user',$data);*/

        $loop = $this
            ->db
            ->get_where('vendor', array(
            'email' => $get_data->email,
            'password' => sha1($get_data->password) ,
        ))
            ->result_array();
        if (count($loop) > 0)
        {
            foreach ($loop as $row)
            {
                if ($row['logo'] != '')
                {
                    $img = base_url() . 'uploads/vendor_image/' . $row['logo'];
                }
                else
                {
                    $img = 'no_image';
                }

                if ($row['cover_image'] != '')
                {
                    $coverImage = base_url() . 'uploads/cover_image/' . $row['cover_image'];
                }
                else
                {
                    $coverImage = 'no_image';
                }

                $data1['token'] = sha1($row['vendor_id']);
                

                $data = array(
                    'id' => $row['vendor_id'],
                    'name' => $row['name'],
                    'shopName' => $row['display_name'],
                    'email' => $row['email'],
                    'api_token' => $data1['token'],
                    'device_token' => '',
                    'phone' => $row['phone'],
                    'status' => $row['status'],
                    'auth' => true,
                    'image' => $img,
                    'coverImage' => $coverImage,
                    'shopTypeId' => intval($row['type']) ,
                    'focusID' => intval($row['focus_id']) ,
                    'focusName' => $this
                        ->Api_model
                        ->singleselectbox('shop_focus', 'shop_focus_id', $row['focus_id'], 'title') ,
                    'colorCode' => $this
                        ->Api_model
                        ->singleselectbox('shop_focus', 'shop_focus_id', $row['focus_id'], 'color_code') ,
                    'registerDate' => date('d M-Y', $row['create_timestamp']) ,
                    'liveStatus' => $row['livestatus'] ? true : false,
                    'autoAssign' => $row['auto_assign'] ? true : false,
                    'driverAllAccess' => $row['driver_assign'] ? true : false,
                    'profileStatus' => $row['status']=='waiting'?false:true,
                    'profileComplete' => $row['profile_complete'], 
                    'planName' => $this->Api_model->singleselectbox('vendor_membership', 'vendor_membership_id', $row['plan'], 'plan_name'),
                    'expiredTime' => $row['member_expire_timestamp'],
                    'productLimit' =>  $this->Api_model->singleselectbox('vendor_membership', 'vendor_membership_id', $row['plan'], 'product_upload_limit'),
                    'address' => $row['address1'],
                    'zoneId'=>$row['zone_id'],
                    'zoneName' =>$this->Api_model ->singleselectbox('zone', 'zone_id', $row['zone_id'], 'title'),
                );

            }
            $this
                ->db
                ->where('vendor_id', $row['vendor_id']);
            $this
                ->db
                ->update('vendor', $data1);

        }
        else
        {
            $data = array(
                'auth' => false,
            );
        }

        $responce = array(
            'success' => true,
            'data' => $data,
            'message' => 'profile retrieved successfully',
        );
        echo json_encode($responce);

    }
    
    
    /** memebership plan **/
    
    function membership_plan($para1='', $para2='', $para3=''){
        if($para1=='list'){
            $loop = $this->db->get_where('vendor_membership', array('focus_id'=>$para2))->result_array();
            if(count($loop)>0){
            foreach($loop as $row){
             $data[] = array(
                        'id' => $row['vendor_membership_id'],
                        'planname' => $row['plan_name'],
                        'price' => $row['price'],
                        'commission' => $row['commission'],
                        'productlimit' => $row['product_upload_limit'],
                        'validity' => $row['validity'],
                        'focus_id' => $row['focus_id'],
                        'uploadImage' => $row['image'] ? base_url() . 'uploads/vendor_membership_image/' . $row['image'] : 'no_image',
                 
                    );
            } } else{
                $data[] = array(
                        'id' => 'not_found',
                    );
            }
            
             $responce = array(
            'success' => true,
            'data' => $data,
            'message' => 'membership retrieved successfully',
        );
        
        } else if($para1=='plan_update'){
            
        $content_data = file_get_contents("php://input");
        $get_data = json_decode($content_data);
              $planamount = $this->db->get_where('vendor_membership', array('vendor_membership_id' => $get_data->planId))->row()->price;
              $data['plan'] = $get_data->planId;
              $data['payment_type'] = $get_data->paymentType;
              $data['payment_status'] =  $get_data->paymentStatus;
              $data['profile_complete'] =  '5';
              if($get_data->passingType=='upgrade' || $planamount=='0' || $get_data->paymentType=='offline'){
                      $days = $this->Api_model->singleselectbox('vendor_membership', 'vendor_membership_id', $get_data->planId, 'validity');
                      $new_expire = time() + ($days * 24 * 60 * 60);
                      $data['member_expire_timestamp'] = $new_expire;
              }
              $this->db->where('vendor_id',  $get_data->vendorId);
              $this->db->update('vendor', $data);
            
            
            
            
            
               $data1['plan_id'] = $get_data->planId;
               $data1['vendor_id'] = $get_data->vendorId;
               $data1['plan_amount'] =  $planamount;
               $data1['created_date'] = time();
              $data1['gateway'] =   $get_data->paymentGateway;
             if($get_data->passingType=='upgrade' || $planamount=='0' || $get_data->paymentType=='offline'){
                      $data1['expire_date'] = $data['member_expire_timestamp'];
              }
               $this->db->insert('vendor_membership_history', $data1);
             $responce = array(
            'success' => true,
            'message' => 'membership retrieved successfully',
        );
        }
        
        
        
        
         echo json_encode($responce);
    }
    
    

    /** order assign */

    function orderAssign($para1 = '', $para2 = '', $para3 = '', $para4 = '')
    {
        if ($this
            ->Api_model
            ->singleselectbox('vendor', 'vendor_id', $para4, 'token') == $this
            ->input
            ->get('api_token', true))
        {
            if ($para1 == 'autoAssign' && $para2 == 1)
            {
                $shoplatitude = $this
                    ->Api_model
                    ->singleselectbox('vendor', 'vendor_id', $para4, 'latitude');
                $shoplongitude = $this
                    ->Api_model
                    ->singleselectbox('vendor', 'vendor_id', $para4, 'longitude');
                  $zone_id = $this
                    ->Api_model
                    ->singleselectbox('vendor', 'vendor_id', $para4, 'zone_id');
                $result = $this
                    ->Api_model
                    ->nearestDriver($shoplatitude, $shoplongitude, $zone_id);
                foreach ($result as $row)
                {

                    $data['delivery_assigned'] = $row['driver_id'];
                    $data['deliver_assignedtime'] = time();
                    $data['status'] = 'Shipped';
                    $this
                        ->db
                        ->where('sale_code', $para3);
                    $this
                        ->db
                        ->update('sale', $data);
                    
                    $data1['driver_id'] =   $row['driver_id'];
                    $data1['deliver_assignedtime'] = $data['deliver_assignedtime'];
                    $this->db->where('invoice_id', $para3);
                    $this->db->update('vendor_invoice', $data1);
                    
                    
                    
                    $data1 = array(
                        'driverId' => $row['driver_id'],
                        'driverName' => $row['name'],
                        'phone' => $row['phone'],
                        'latitude' => $row['latitude'],
                        'longitude' => $row['longitude']
                    );
                }

            }
            else if ($para1 == 'autoAssign' && $para2 == 0)
            {

                $shoplatitude = $this
                    ->Api_model
                    ->singleselectbox('vendor', 'vendor_id', $para4, 'latitude');
                $shoplongitude = $this
                    ->Api_model
                    ->singleselectbox('vendor', 'vendor_id', $para4, 'longitude');
                $result = $this
                    ->Api_model
                    ->nearestDriverwithVendor($shoplatitude, $shoplongitude, $para4);
                foreach ($result as $row)
                {

                    $data['delivery_assigned'] = $row['driver_id'];
                    $data['deliver_assignedtime'] = time();
                    $data['status'] = 'Shipped';
                    $this
                        ->db
                        ->where('sale_code', $para3);
                    $this
                        ->db
                        ->update('sale', $data);
                    
                      
                    $data1['driver_id'] =   $row['driver_id'];
                    $data1['deliver_assignedtime'] = $data['deliver_assignedtime'];
                    $this->db->where('invoice_id', $para3);
                    $this->db->update('vendor_invoice', $data1);
                    
                    
                    $data1 = array(
                        'driverId' => $row['driver_id'],
                        'driverName' => $row['name'],
                        'phone' => $row['phone'],
                        'latitude' => $row['latitude'],
                        'longitude' => $row['longitude']
                    );
                }

            }
            else if ($para1 == 'manual' && $para2 == 1)
            {
                 
                $shoplatitude = $this
                    ->Api_model
                    ->singleselectbox('vendor', 'vendor_id', $para4, 'latitude');
                
                $shoplongitude = $this
                    ->Api_model
                    ->singleselectbox('vendor', 'vendor_id', $para4, 'longitude');
                 $zone_id = $this
                    ->Api_model
                    ->singleselectbox('vendor', 'vendor_id', $para4, 'zone_id');
                $result = $this
                    ->Api_model
                    ->nearestDrivermanual($shoplatitude, $shoplongitude,$zone_id);
              
                foreach ($result as $row)
                {
                    $data1[] = array(
                        'id' => $row['driver_id'],
                        'name' => $row['name'],
                    );
                }

            }
            else if ($para1 == 'manual' && $para2 == 0)
            {

                $shoplatitude = $this
                    ->Api_model
                    ->singleselectbox('vendor', 'vendor_id', $para4, 'latitude');
                $shoplongitude = $this
                    ->Api_model
                    ->singleselectbox('vendor', 'vendor_id', $para4, 'longitude');

                $result = $this
                    ->Api_model
                    ->nearestDriverwithVendormanual($shoplatitude, $shoplongitude, $para4);

                foreach ($result as $row)
                {
                    $data1[] = array(
                        'id' => $row['driver_id'],
                        'name' => $row['name'],
                    );
                }

            }
            else if ($para1 == 'update')
            {

                $data['delivery_assigned'] = $para2;
                $data['deliver_assignedtime'] = time();
                $data['status'] = 'Shipped';
                $this
                    ->db
                    ->where('sale_code', $para3);
                $this
                    ->db
                    ->update('sale', $data);
                
                  
                    $data1['driver_id'] =    $para2;
                    $data1['deliver_assignedtime'] = $data['deliver_assignedtime'];
                    $this->db->where('invoice_id', $para3);
                    $this->db->update('vendor_invoice', $data1);
                
                
                $data1 = array(
                    'driverId' => $para2,
                    'driverName' => $this
                        ->Api_model
                        ->singleselectbox('driver', 'driver_id', $para2, 'name') ,
                    'phone' => $this
                        ->Api_model
                        ->singleselectbox('driver', 'driver_id', $para2, 'phone') ,
                    'latitude' => $this
                        ->Api_model
                        ->singleselectbox('driver', 'driver_id', $para2, 'latitude') ,
                    'longitude' => $this
                        ->Api_model
                        ->singleselectbox('driver', 'driver_id', $para2, 'longitude') ,
                );

            }

            $responce = array(
                'success' => true,
                'data' => $data1,
                'message' => 'profile retrieved successfully',
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
    
    
        
    /** driver details */
    
    function driverDetails($para1='', $para2='', $para3=''){
     
        if ($this
            ->Api_model
            ->singleselectbox('vendor', 'vendor_id', $para3, 'token') == $this
            ->input
            ->get('api_token', true))
        {
          if ($para1 == 'do_add')
            {
              
               $this->db->select('deliver_assignedtime,status,delivery_assigned');
               $loop = $this->db->get_where('sale',array('sale_code'=>$para2))->result_array();
            foreach ($loop as $row) {
               
              $data = array(
                            'driverName' =>$this->Api_model ->singleselectbox('driver', 'driver_id', $row['delivery_assigned'], 'name'),
                            'phone' => $this->Api_model ->singleselectbox('driver', 'driver_id', $row['delivery_assigned'], 'phone'),
                            'status' => $row['status'],
                            'orderDate' => date('d  M,Y h:i A', $row['deliver_assignedtime']),
                            'id' => $row['delivery_assigned'],
                        );
            }
              
              
              
               $responce = array(
                'success' => true,
                'data' => $data,
                'message' => 'driver details retrieved successfully',
            ); 
              
          }
        }  else
        {
            $responce = $this
                ->Api_model
                ->tokenfailed();

        }
        echo json_encode($responce);
    }
    
    
    

    
    
   /* banner */
 function banner($para1 = '', $para2 = '', $para3 = '')
    {
       
            if ($para1 == 'add')
            {
                $data['title'] = $this ->input ->post('title');
                $data['para'] = $this ->input->post('para');
                $data['type'] = '1';
                $data['category_id'] = $this ->input->post('categoryId');
                $data['redirect_type'] =$this->input->post('redirect_type');
                $data['vendor'] = $para2;
                $data['date'] = time();
                $this
                    ->db
                    ->insert('banner', $data);
                $id = $this
                    ->db
                    ->insert_id();
                $path = $_FILES['image']['name'];
                $ext = pathinfo($path, PATHINFO_EXTENSION);
                $databanner['image'] = 'banner_' . $id . '.' . $ext;
                $this
                    ->crud_model
                    ->file_up("image", "banner", $id, '', 'no', '.' . $ext);
                $this
                    ->db
                    ->where('banner_id', $id);
                $this
                    ->db
                    ->update('banner', $databanner);
                $responce = array(
                    'success' => true,
                );

            }
            else if ($para1 == 'list')
            {
                $loop = $this
                    ->db
                    ->get_where('banner', array(
                    'type' => $para2,
                    'vendor' => $para3
                ))->result_array();
                if (count($loop) > 0)
                {
                    foreach ($loop as $row)
                    {
                        $data[] = array(
                            'type' => $row['type'],
                            'uploadImage' => base_url() . 'uploads/banner_image/' . $row['image'],
                            'title' => $row['title'],
                            'categoryId' => $row['category_id'],
                            'para' => $row['para'],
                            'id' => $row['banner_id'],
                        );

                    }
                    $responce = array(
                        'success' => true,
                        'data' => $data,
                    );
                }

            }
            else if ($para1 == 'delete')
            {

                $this
                    ->db
                    ->where('banner_id', $para2);
                $this
                    ->db
                    ->delete('banner');
                $responce = array(
                    'success' => true,
                );
            }else if($para1 == 'edit')
            {
                
                $id = $para3;
                $data['title'] = $this ->input ->post('title');
                $data['para'] = $this ->input->post('para');
                $data['category_id'] = $this ->input ->post('categoryId');
                $path = $_FILES['image']['name'];
                $ext = pathinfo($path, PATHINFO_EXTENSION);
                
             if ($ext != NULL)
             {
                 $time =time();
                $data['image'] = 'banner_' .$time .$id . '.' . $ext;
                 $this
                    ->crud_model
                    ->file_up("image", "banner", $time.$id, '', 'no', '.' . $ext);
             }
                $this
                    ->db
                    ->where('banner_id', $id);
                $this
                    ->db
                    ->update('banner', $data);
              
                $responce = array(
                    'success' => true,
                );

            }
        echo json_encode($responce);
    }
    /** global dropdown */

    function globaldropdown($para1 = '', $para2 = '')
    {
        $this
            ->db
            ->order_by($para1 . '_id', 'asc');
        $loop = $this
            ->db
            ->get_where($para1)->result_array();
        if (count($loop) > 0)
        {
            foreach ($loop as $row)
            {
                $data[] = array(
                    'id' => $row[$para1 . '_id'],
                    'name' => $row[$para2],
                );

            }
            $responce = array(
                'success' => true,
                'data' => $data,
            );
        }
        echo json_encode($responce);
    }

    /** global dropdown with single condition*/

    function globaldropdownsc($para1 = '', $para2 = '', $para3 = '', $para4 = '', $para5 = '')
    {
        if ($this
            ->Api_model
            ->singleselectbox('vendor', 'vendor_id', $para5, 'token') == $this
            ->input
            ->get('api_token', true))
        {

            $this
                ->db
                ->order_by($para1 . '_id', 'asc');

            $loop = $this
                ->db
                ->get_where($para1, array(
                $para3 => $para4
            ))->result_array();
            if (count($loop) > 0)
            {
                foreach ($loop as $row)
                {
                    $data[] = array(
                        'id' => $row[$para1 . '_id'],
                        'name' => $row[$para2],
                    );

                }
                $responce = array(
                    'success' => true,
                    'data' => $data,
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

    /** subcategory */

    function subcategory($para1 = '', $para2 = '', $para3 = '')
    {
        if ($this
            ->Api_model
            ->singleselectbox('vendor', 'vendor_id', $para3, 'token') == $this
            ->input
            ->get('api_token', true))
        {
            if ($para1 == 'add')
            {

                $data['sub_category_name'] = $this
                    ->input
                    ->post('sub_category_name');
                $data['category'] = $this
                    ->input
                    ->post('category');
                $data['data_vendor'] = $this
                    ->input
                    ->post('vendor');
                $this
                    ->db
                    ->insert('sub_category', $data);
                $id = $this
                    ->db
                    ->insert_id();

                $path = $_FILES['image']['name'];
                $ext = pathinfo($path, PATHINFO_EXTENSION);
                $data_banner['banner'] = 'sub_category_' . $id . '.' . $ext;
                $this
                    ->crud_model
                    ->file_up("image", "sub_category", $id, '', 'no', '.' . $ext);
                $this
                    ->db
                    ->where('sub_category_id', $id);
                $this
                    ->db
                    ->update('sub_category', $data_banner);
                $responce = array(
                    'success' => true,
                );

            }
            else if ($para1 == 'list')
            {
                $loop = $this
                    ->db
                    ->get_where('sub_category', array(
                    'data_vendor' => $para3
                ))->result_array();
                if (count($loop) > 0)
                {
                    foreach ($loop as $row)
                    {
                        $data[] = array(
                            'categoryId' => $row['category'],
                            'subcategoryName' => $row['sub_category_name'],
                            'image' => base_url() . 'uploads/sub_category_image/' . $row['banner'],
                            'userId' => '1',
                            'id' => $row['sub_category_id'],
                        );

                    }
                    $responce = array(
                        'success' => true,
                        'data' => $data,
                    );
                }

            }
            else if ($para1 == 'delete')
            {

                unlink("uploads/sub_category_image/" . $this
                    ->crud_model
                    ->get_type_name_by_id('sub_category', $para2, 'banner'));
                $this
                    ->db
                    ->where('sub_category_id', $para2);
                $this
                    ->db
                    ->delete('sub_category');
                $responce = array(
                    'success' => true,
                );
            }
            else if ($para1 == 'edit')
            {

                $data['sub_category_name'] = $this
                    ->input
                    ->post('sub_category_name');
                $data['category'] = $this
                    ->input
                    ->post('category');
                $this
                    ->db
                    ->where('sub_category_id', $para2);
                $this
                    ->db
                    ->update('sub_category', $data);
                $id = $para2;
                $path = $_FILES['image']['name'];
                $ext = pathinfo($path, PATHINFO_EXTENSION);
                if ($ext != NULL)
                {
                     $time = time();
                    $databanner['banner'] = 'sub_category_'. $time.$id . '.' . $ext;
                    $this
                        ->crud_model
                        ->file_up("image", "sub_category",  $time.$id, '', 'no', '.' . $ext);
                    $this
                        ->db
                        ->where('sub_category_id', $id);
                    $this
                        ->db
                        ->update('sub_category', $databanner);
                }
                $responce = array(
                    'success' => true,
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

    /** category **/

     function category($para1 = '', $para2 = '', $para3 = '')
    {

        if ($this
            ->Api_model
            ->singleselectbox('vendor', 'vendor_id', $para3, 'token') == $this
            ->input
            ->get('api_token', true))
        {
            if ($para1 == 'add')
            {

                $data['category_name'] = $this
                    ->input
                    ->post('categoryName');
                $data['data_vendors'] = $this
                    ->input
                    ->post('vendor');
                $this
                    ->db
                    ->insert('category', $data);
                $id = $this
                    ->db
                    ->insert_id();
                $path = $_FILES['image']['name'];
                $ext = pathinfo($path, PATHINFO_EXTENSION);
                $databanner['banner'] = 'category_' . $id . '.png';
                $this
                    ->crud_model
                    ->file_up("image", "category", $id, '', 'no', '.png');
                $this
                    ->db
                    ->where('category_id', $id);
                $this
                    ->db
                    ->update('category', $databanner);
                $responce = array(
                    'success' => true,
                );

            }
            else if ($para1 == 'list')
            {
                $this
                    ->db
                    ->order_by('category_id', 'desc');
                $loop = $this
                    ->db
                    ->get_where('category', array(
                    'data_vendors' => $para3
                ))->result_array();
                if (count($loop) > 0)
                {
                    foreach ($loop as $row)
                    {
                        $data[] = array(
                            'categoryName' => $row['category_name'],
                            'image' => base_url() . 'uploads/category_image/' . $row['banner'],
                            'userId' => '1',
                            'id' => $row['category_id'],
                        );

                    }
                    $responce = array(
                        'success' => true,
                        'data' => $data,
                    );
                }

            }
            else if ($para1 == 'delete')
            {
                unlink("uploads/category_image/" . $this
                    ->crud_model
                    ->get_type_name_by_id('category', $para3, 'banner'));
                $this
                    ->db
                    ->where('category_id', $para2);
                $this
                    ->db
                    ->delete('category');
                $responce = array(
                    'success' => true,
                );
            }
            else if ($para1 == 'edit')
            {

                $data['category_name'] = $this
                    ->input
                    ->post('categoryName');
                $data['data_vendors'] = $this
                    ->input
                    ->post('vendor');
                $this
                    ->db
                    ->where('category_id', $para2);
                $this
                    ->db
                    ->update('category', $data);
                $id = $para2;
                $path = $_FILES['image']['name'];
                $time =time();
                $ext = pathinfo($path, PATHINFO_EXTENSION);
                if ($ext != NULL)
                {
                    $databanner['banner'] = 'category_' . $time. $id . '.png';
                    $this
                        ->crud_model
                        ->file_up("image", "category",  $time.$id, '', 'no', '.png');
                    $this
                        ->db
                        ->where('category_id', $id);
                    $this
                        ->db
                        ->update('category', $databanner);
                }
                $responce = array(
                    'success' => true,
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
    
  
    

    function csvimport($para1 = '', $para2 = '', $para3 = '', $para4 = '')
    {
       
        if ($this
            ->Api_model
            ->singleselectbox('vendor', 'vendor_id', $para2, 'token') == $this
            ->input
            ->get('api_token', true))
        {
            $this
                ->load
                ->model("Ieport_model");

            $filename = $_FILES["file"]["tmp_name"];
            if ($_FILES["file"]["size"] > 0)
            {

                $file = fopen($filename, "r");
                while (($importdata = fgetcsv($file, 10000, ",")) !== false)
                {
                   

                    if ($para1 == 'product_add')
                    {

                        if ($this
                            ->Api_model
                            ->count_2wcopt('category', 'data_vendors', $para2, 'category_id', $importdata[0]) == 1 && $this
                            ->Api_model
                            ->count_2wcopt('sub_category', 'data_vendor', $para2, 'sub_category_id', $importdata[1]) == 1)
                        {
                        
                            $data = array(
                                'title' => $importdata[2],
                                'category' => $importdata[0],
                                'sub_category' => $importdata[1],
                                'rating_total' => 0,
                                'rating_num' => 0,
                                'add_timestamp' => time() ,
                                'status' => 'true',
                                'added_by' => json_encode(array(
                                    'type' => 'vendor',
                                    'id' => $para2
                                )) ,
                                'product_type' => $para3,
                            );

                            print_r($data);

                            $this
                                ->Ieport_model
                                ->productaddcsv($data);

                        }

                    }
                    else if ($para1 == 'foodproduct_add')
                    {
                      

                        if ($this
                            ->Api_model
                            ->count_2wcopt('category', 'data_vendors', $para2, 'category_id', $importdata[0]) == 1)
                        {

                            $data = array(
                                'title' => $importdata[1],
                                'category' => $importdata[0],
                                'from_avaliable_time'=>$importdata[2],
                                'to_avaliable_time'=>$importdata[3],
                                'rating_total' => 0,
                                'rating_num' => 0,
                                 'rating_user' => '[]',
                                'add_timestamp' => time() ,
                                'status' => 'true',
                                'added_by' => json_encode(array(
                                    'type' => 'vendor',
                                    'id' => $para2
                                )) ,
                                'vendor' => $para2,
                                'product_type' => $para3,
                            );

                        

                            $this
                                ->Ieport_model
                                ->foodproductaddcsv($data);

                        }

                    }
                    else if ($para1 == 'foodproduct_update')
                    {

                        if ($this
                            ->Api_model
                            ->count_2wcopt('category', 'data_vendors', $para2, 'category_id', $importdata[1]) == 1)
                        {
                            echo 1;
                            $data = array(
                                'restaurantproduct_id' => $importdata[0],
                                'title' => $importdata[2],
                                'category' => $importdata[1],
                                'rating_total' => 0,
                                'rating_num' => 0,
                                'add_timestamp' => time() ,
                                'status' => 'true',
                                'added_by' => json_encode(array(
                                    'type' => 'vendor',
                                    'id' => $para2
                                )) ,
                                'product_type' => $para3,
                                'vendor_id' => $para2,
                            );
                            print_r($data);

                            $this
                                ->Ieport_model
                                ->updatefoodproductcsv($data, $importdata[0]);
                        }

                    }
                    else if ($para1 == 'product_update')
                    {

                        if ($this
                            ->Api_model
                            ->count_2wcopt('category', 'data_vendors', $para2, 'category_id', $importdata[1]) == 1 && $this
                            ->Api_model
                            ->count_2wcopt('sub_category', 'data_vendor', $para2, 'sub_category_id', $importdata[2]) == 1)
                        {
                            echo 1;
                            $data = array(
                                'product_id' => $importdata[0],
                                'title' => $importdata[3],
                                'category' => $importdata[1],
                                'sub_category' => $importdata[2],
                                'rating_total' => 0,
                                'rating_num' => 0,
                                'add_timestamp' => time() ,
                                'status' => 'true',
                                'added_by' => json_encode(array(
                                    'type' => 'vendor',
                                    'id' => $para2
                                )) ,
                                'product_type' => $para3,
                            );
                            print_r($data);

                            $this
                                ->Ieport_model
                                ->updateproductcsv($data, $importdata[0]);
                        }

                    }
                    else if ($para1 == 'variant_2_add')
                    {

                        if ($this
                            ->Api_model
                            ->count_2wcopt('product', 'added_by', json_encode(array(
                            'type' => 'vendor',
                            'id' => $para2
                        )) , 'product_id', $importdata[0]) == 1 && $this
                        ->Api_model
                        ->count_wcopt('tax', 'tax', $importdata[5])>=1)
                        {
                            if($importdata[6]==''){
                                $imagetype='no_image';
                            }
                            else{
                                $imagetype='external';
                            }
                            $salesprice= $importdata[3]-($importdata[3]*($importdata[4]/100));
                            $tax  = $importdata[3]-($importdata[3]*($importdata[5]/100));
                            $data = array(
                                'product_id' => $importdata[0],
                                'quantity' => $importdata[1],
                                'unit' => $importdata[2],
                                'strike_price' => $importdata[3],
                                'sale_price'=> $salesprice,
                                'discount' => $importdata[4],
                                'tax'=>$importdata[3]-$tax,
                                'tax_percent' => $importdata[5],
                                'image'=> $importdata[6],
                                'image_type' =>$imagetype,
                                'vendor_id' => $para2,
                                'type' => $para3,
                            );
                            print_r($data);

                            $this
                                ->Ieport_model
                                ->variantaddcsv($data);

                        }

                    }
                    else if($para1 == 'foodvariant_add')
                    {
                        if ($this
                            ->Api_model
                            ->count_2wcopt('restaurantproduct', 'added_by', json_encode(array(
                            'type' => 'vendor',
                            'id' => $para2
                        )) , 'restaurantproduct_id', $importdata[0]) == 1 && $this
                        ->Api_model
                        ->count_wcopt('tax', 'tax', $importdata[6])>=1)
                        {
                            echo 'true';
                            if($importdata[7]==''){
                                $imagetype='no_image';
                            }
                            else{
                                $imagetype='external';
                            }
                            $salesprice= $importdata[4]-($importdata[4]*($importdata[5]/100));
                            $tax  = $importdata[4]-($importdata[4]*($importdata[6]/100));
                            $data = array(
                                'product_id' => $importdata[0],
                                'quantity' => $importdata[1],
                                'unit' => $importdata[2],
                                'food_type' =>$importdata[3],
                                'strike_price' => $importdata[4],
                                'sale_price'=> $salesprice,
                                'discount' => $importdata[5],
                                'tax'=>$importdata[4]-$tax,
                                'tax_percent' => $importdata[6],
                                'image'=> $importdata[7],
                                'image_type' =>$imagetype,
                                'vendor_id' => $para2,
                                'type' => $para3,
                            );
                            print_r($data);

                            $this
                                ->Ieport_model
                                ->foodvariantaddcsv($data);

                        }
                        echo 'true';

                    }
                    else if($para1 == 'foodvariant_update')
                    {
                        if ($this
                        ->Api_model
                        ->count_2wcopt('variant', 'vendor_id', $para2, 'variant_id', $importdata[0]) == 1 && $this
                        ->Api_model
                        ->count_wcopt('tax', 'tax', $importdata[7])>=1)
                        {
                            
                            $salesprice= $importdata[5]-($importdata[5]*($importdata[6]/100));
                            $tax  = $importdata[5]-($importdata[5]*($importdata[7]/100));
                            $data = array(
                                'product_id' => $importdata[1],
                                'quantity' => $importdata[2],
                                'unit' => $importdata[3],
                                'food_type' =>$importdata[4],
                                'strike_price' => $importdata[5],
                                'sale_price'=> $salesprice,
                                'discount' => $importdata[6],
                                'tax'=>$importdata[5]-$tax,
                                'tax_percent' => $importdata[7],
                                'from_avaliable_time' => $importdata[8],
                                'to_avaliable_time' => $importdata[9],
                            );
                            print_r($data);

                            $this
                                ->Ieport_model
                                ->updatefoodvariantcsv($data, $importdata[0]);

                        }

                    }
                    else if ($para1 == 'variant_2_update')
                    {
                        
                        if ($this
                            ->Api_model
                            ->count_2wcopt('product', 'added_by', json_encode(array(
                            'type' => 'vendor',
                            'id' => $para2
                        )) , 'product_id', $importdata[1]) && $this
                            ->Api_model
                            ->count_2wcopt('variant_2', 'vendor_id', $para2, 'variant_2_id', $importdata[0]) == 1 && $this
                            ->Api_model
                            ->count_wcopt('tax', 'tax', $importdata[6])>=1)
                        {
                            $salesprice= $importdata[4]-($importdata[4]*($importdata[5]/100));
                            $tax  = $importdata[4]-($importdata[4]*($importdata[6]/100));
                            $data = array(
                                'product_id' => $importdata[1],
                                'quantity' => $importdata[2],
                                'unit' => $importdata[3],
                                'strike_price' => $importdata[4],
                                'sale_price'=> $salesprice,
                                'discount' => $importdata[5],
                                'tax'=>$importdata[4]-$tax,
                                'tax_percent' => $importdata[6],
                                'vendor_id' => $para2,
                                'type' => $para3,
                            );

                            $this
                                ->Ieport_model
                                ->updatevariantcsv($data, $importdata[0]);
                        }

                    }
                    else if ($para1 == 'variant_add')
                    {

                        if ($this
                            ->Api_model
                            ->count_2wcopt('restaurantproduct', 'added_by', json_encode(array(
                            'type' => 'vendor',
                            'id' => $para2
                        )) , 'product_id', $importdata[1]) == 1)
                        {

                            $data = array(
                                'product_id' => $importdata[1],
                                'quantity' => $importdata[2],
                                'unit' => $importdata[3],
                                'sale_price' => $importdata[4],
                                'strike_price' => $importdata[5],
                                'discount' => $importdata[6],
                                'tax' => $importdata[7],
                                'vendor_id' => $para2,
                                'type' => $para3,
                            );
                            print_r($data);

                            $this
                                ->Ieport_model
                                ->variantreaddcsv($data);

                        }

                    }

                }
                fclose($file);
            }
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

    /* product */

  function product($para1 = '', $para2 = '', $para3 = '', $para4 = '')
    {
        if ($this
            ->Api_model
            ->singleselectbox('vendor', 'vendor_id', $para4, 'token') == $this
            ->input
            ->get('api_token', true))
        {
            if ($para1 == 'add')
            {
                 $decimalList = $this->Api_model->get_type_name_by_id('general_settings', '111', 'value');

                $data['category'] = $this
                    ->input
                    ->post('category');
                $data['sub_category'] = $this
                    ->input
                    ->post('subCategory');
                $data['title'] = $this
                    ->input
                    ->post('productTitle');
                $data['status'] = 'true';
                $data['product_type'] = $para2;
                $data['rating_num'] = 0;
                $data['rating_total'] = 0.0;
                $data['rating_user'] = '[]';
                $data['add_timestamp'] = time();
                $data['variant_status'] = true;
                
              
                $data['added_by'] = json_encode(array(
                    'type' => 'vendor',
                    'id' => $this
                        ->input
                        ->post('vendor')
                ));
                $data['vendor'] = $this->input->post('vendor');
                $this->db->insert('product', $data);
                $id = $this->db->insert_id();
                
                $data1['product_id'] = $id;
                $data1['quantity'] = $this->input->post('quantity');
                $data1['discount'] = $this->input->post('discount');
               
                $data1['name'] = '';
                $data1['unit'] = $this->input->post('unit');
                $data1['sale_price'] = $this->input->post('salePrice');
                $data1['strike_price'] = $this ->input->post('strikePrice');
                
                /** calculate tax amount **/
                 $tax = $this->input->post('tax');
                 
                 $tax_amount = round(($data1['sale_price'] * $tax)/100,  $decimalList);
                 $data1['tax'] =   $tax_amount;
                 $data1['tax_percent'] =   $tax ;
            
                $data1['type'] = $para2;
                $data1['vendor_id'] = $this
                    ->input
                    ->post('vendor');
                $this
                    ->db
                    ->insert('variant_2', $data1);

                $id1 = $this
                    ->db
                    ->insert_id();
                $path = $_FILES['image']['name'];
                $ext = pathinfo($path, PATHINFO_EXTENSION);
                $data_image['image_type'] ='internal';
                $data_image['image'] = 'product_' . $id1 . '.' . $ext;
                $this
                    ->db
                    ->where('variant_2_id', $id1);
                $this
                    ->db
                    ->update('variant_2', $data_image);
                $this
                    ->crud_model
                    ->file_up("image", "product", $id1, '', 'no', '.' . $ext);

                $responce = array(
                    'success' => true,
                );

            }
            else if ($para1 == 'list')
            {

                $this
                    ->db
                    ->select('category_id, category_name');
                $loop = $this
                    ->db
                    ->get_where('category', array(
                    'data_vendors' => $para4
                ))->result_array();

                foreach ($loop as $row)
                {
                    $this
                        ->db
                        ->select('product_id, title , product_type,status,today_deals');
                    $data1 = [];
                    $this
                        ->db
                        ->order_by('product_id', 'desc');
                    $loop1 = $this
                        ->db
                        ->get_where('product', array(
                        'category' => $row['category_id']
                    ))->result_array();
                     $i = 0;
                    foreach ($loop1 as $row1)
                    {

                        $this
                            ->db
                            ->limit(1);
                        $variant = $this
                            ->db
                            ->get_where('variant_2', array(
                            'product_id' => $row1['product_id']
                        ))->result_array();

                        $variants = [];
                        if (count($variant) != 0)
                        {
                            foreach ($variant as $row2)
                            {
                                 if($row2['image_type']=='internal'){
                                     $image = base_url() . 'uploads/product_image/' . $row2['image'];
                                  }else{
                                     $image = $row2['image'];
                                 }
                                $i++;
                                $variants = array(
                                    'variant_id' => $row2['variant_2_id'],
                                    'product_id' => $row2['product_id'],
                                    'quantity' => $row2['quantity'],
                                    'name' => $row2['name'],
                                    'unit' => $row2['unit'],
                                    'sale_price' => $row2['sale_price'],
                                    'strike_price' => $row2['strike_price'],
                                    'type' => $row2['type'],
                                    'selected' => false,
                                    'uploadImage' => $image,

                                );
                            }
                        }
                        else
                        {

                            $variants = array(
                                'variant_id' => '',
                                'product_id' => '',
                                'quantity' => '',
                                'name' => '',
                                'unit' => '',
                                'sale_price' => '',
                                'strike_price' => '',
                                'type' => '',
                                'selected' => false,
                                'uploadImage' => 'no_image',

                            );
                        }

                        if ($row1['status'] == 'true')
                        {
                            $row1['status'] = true;
                        }
                        else
                        {
                            $row1['status'] = false;
                        }

                        if ($row1['today_deals'] == 0)
                        {
                            $row1['today_deals'] = true;
                        }
                        else
                        {
                            $row1['today_deals'] = false;
                        }
                        $data1[] = array(

                            'id' => $row1['product_id'],
                            'product_name' => $row1['title'],
                            'variant' => $variants,
                            'productType' => $row1['product_type'],
                            'status' => $row1['status'],
                            'todayDeals' => $row1['today_deals'],
                        );

                    }
                    $data[] = array(
                        'id' => $row['category_id'],
                        'categoryName' => $row['category_name'],
                        'productdetails' => $data1,
                    );

                }

                $responce = array(
                    'success' => true,
                    'data' => $data,
                    'message' => 'product retrieved successfully',
                );

            }
            else if ($para1 == 'delete')
            {

                $this
                    ->db
                    ->where('product_id', $para2);
                $this
                    ->db
                    ->delete('product');
                $this
                    ->db
                    ->where('product_id', $para2);
                $this
                    ->db
                    ->delete('variant_2');
                $responce = array(
                    'success' => true,
                );
            }
            else if ($para1 == 'edit')
            {

                $data['category_name'] = $this
                    ->input
                    ->post('categoryName');
                $data['data_vendors'] = $this
                    ->input
                    ->post('vendor');
                $this
                    ->db
                    ->where('category_id', $para2);
                $this
                    ->db
                    ->update('category', $data);
                $id = $para2;
                $path = $_FILES['image']['name'];
                $ext = pathinfo($path, PATHINFO_EXTENSION);
                if ($ext != NULL)
                {
                    $databanner['banner'] = 'category_' .time().$id . '.' . $ext;
                    $this
                        ->crud_model
                        ->file_up("image", "category", time().$id, '', 'no', '.' . $ext);
                    $this
                        ->db
                        ->where('category_id', $id);
                    $this
                        ->db
                        ->update('category', $databanner);
                }
                $responce = array(
                    'success' => true,
                );
            }
            else if ($para1 == 'variantlist')
            {
                $variant = $this
                    ->db
                    ->get_where('variant_2', array(
                    'product_id' => $para2
                ))->result_array();
                $data = [];
                foreach ($variant as $row2)
                {
                    
                     if($row2['image_type']=='internal'){
                       $image = base_url() . 'uploads/product_image/' . $row2['image'];
                    }else{
                       $image = $row2['image'];
                    }

                    $data[] = array(
                        'variant_id' => $row2['variant_2_id'],
                        'product_id' => $row2['product_id'],
                        'quantity' => $row2['quantity'],
                        'name' => $row2['name'],
                        'unit' => $row2['unit'],
                        'sale_price' => $row2['sale_price'],
                        'strike_price' => $row2['strike_price'],
                        'tax' => $row2['tax_percent'],
                        'discount' => doubleval(['discount']),
                        'type' => $row2['type'],
                        'selected' => false,
                        'uploadImage' => $image,

                    );
                }
                $responce = array(
                    'success' => true,
                    'data' => $data,
                    'message' => 'product retrieved successfully',
                );

            }
            else if ($para1 == 'variant_add')
            {

                $data1['product_id'] = $para2;
                $data1['quantity'] = $this ->input ->post('quantity');
                $data1['name'] = '';
                $data1['unit'] = $this ->input ->post('unit');
                $data1['sale_price'] = $this->input->post('salePrice');
                $data1['strike_price'] = $this ->input ->post('strikePrice');
                $data1['type'] = $para3;
                $data1['vendor_id'] = $this  ->input ->post('vendor');
                 $data1['discount'] = $this ->input->post('discount');
                 $tax = $this->input->post('tax');
                 $decimalList = $this->Api_model->get_type_name_by_id('general_settings', '111', 'value');
                 $tax_amount = round(($data1['sale_price'] * $tax)/100,  $decimalList);
                 $data1['tax'] =   $tax_amount;
                 $data1['tax_percent'] =   $tax ;
                $this ->db ->insert('variant_2', $data1);
                $id1 = $this
                    ->db
                    ->insert_id();
                $path = $_FILES['image']['name'];
                $ext = pathinfo($path, PATHINFO_EXTENSION);
                $data_image['image_type'] ='internal';
                $data_image['image'] = 'product_' . $id1 . '.' . $ext;
                $this
                    ->db
                    ->where('variant_2_id', $id1);
                $this
                    ->db
                    ->update('variant_2', $data_image);
                $this
                    ->crud_model
                    ->file_up("image", "product", $id1, '', 'no', '.' . $ext);

                $responce = array(
                    'success' => true,
                    'data' => 'success',
                    'message' => 'variant added successfully',
                );
            }
            else if ($para1 == 'variant_edit')
            {

                $data1['quantity'] = $this
                    ->input
                    ->post('quantity');
                $data1['name'] = '';
                $data1['unit'] = $this ->input ->post('unit');
                $data1['sale_price'] = $this->input ->post('salePrice');
                $data1['strike_price'] = $this ->input ->post('strikePrice');
                $data1['type'] = $para3;
                $data1['discount'] = $this ->input->post('discount');
                 $tax = $this->input->post('tax');
                  $decimalList = $this->Api_model->get_type_name_by_id('general_settings', '111', 'value');
                 $tax_amount = round(($data1['sale_price'] * $tax)/100,  $decimalList );
                 $data1['tax'] =   $tax_amount;
                 $data1['tax_percent'] =   $tax ;
                $id1 = $this->input->post('variant_id');
                $path = $_FILES['image']['name'];
                $dateTime = time();

                $ext = pathinfo($path, PATHINFO_EXTENSION);
                if ($ext != NULL)
                {

                    $this ->crud_model ->file_up("image", "product", $dateTime.$id1, '', 'no', '.' . $ext);
                     $data1['image'] =  'product_' . $dateTime.$id1 . '.' . $ext;
                }
               
                $this->db ->where('variant_2_id', $id1);
                $this ->db ->update('variant_2', $data1);

                $responce = array(
                    'success' => true,
                    'data' => 'success',
                    'message' => 'variant added successfully',
                );
            }
            else if ($para1 == 'product_status')
            {

                $data['status'] = $para3;
                $this
                    ->db
                    ->where('product_id', $para2);
                $this
                    ->db
                    ->update('product', $data);
                $responce = array(
                    'success' => true,
                    'data' => 'success',
                    'message' => 'product successfully',
                );

            }else if($para1=='todaydeals'){
                
				 if($para3=='true'){
                    $bool=0;
                }
                else{
                    $bool=1;
                }

				$data['today_deals'] = $bool;
                $this
                    ->db
                    ->where('product_id', $para2);
                $this
                    ->db
                    ->update('product', $data);
                $responce = array(
                    'success' => true,
                    'data' => 'success',
                    'message' => 'product successfully',
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

    function variant_2($para1 = '', $para2 = '')
    {

        if ($para1 == 'delete')
        {

            $this
                ->db
                ->where('variant_2_id', $para2);
            $this
                ->db
                ->delete('variant_2');
        }
        $responce = array(
            'success' => true,
        );
        echo json_encode($responce);
    }

    function variant($para1 = '', $para2 = '')
    {

        if ($para1 == 'delete')
        {

            $this
                ->db
                ->where('variant_id', $para2);
            $this
                ->db
                ->delete('variant');
        }
        $responce = array(
            'success' => true,
        );
        echo json_encode($responce);
    }

    /* Item Product */

    function Itemproduct($para1 = '', $para2 = '', $para3 = '', $para4 = '')
    {
        if ($this
            ->Api_model
            ->singleselectbox('vendor', 'vendor_id', $para4, 'token') == $this
            ->input
            ->get('api_token', true))
        {
            if ($para1 == 'add')
            {

                $data['category'] = $this
                    ->input
                    ->post('category');
                $data['title'] = $this
                    ->input
                    ->post('productTitle');
                $data['status'] = 'true';
                $data['product_type'] = $para2;
                $data['rating_num'] = 0;
                $data['rating_total'] = 0.0;
                $data['rating_user'] = '[]';
                $data['from_avaliable_time'] = $this->input->post('fromTime');
                $data['to_avaliable_time'] = $this->input->post('toTime');
                $data['add_timestamp'] = time();
                $data['variant_status'] = true;
                $data['added_by'] = json_encode(array(
                    'type' => 'vendor',
                    'id' => $this
                        ->input
                        ->post('vendor')
                ));
                $data['vendor'] =  $this
                        ->input
                        ->post('vendor');
                $this
                    ->db
                    ->insert('restaurantproduct', $data);
                $id = $this->db  ->insert_id();
                $data1['product_id'] = $id;
                $data1['quantity'] = $this->input->post('quantity');
                $data1['name'] = '';
                $data1['unit'] = $this ->input->post('unit');
                $data1['sale_price'] = $this ->input ->post('salePrice');
                $data1['strike_price'] = $this ->input->post('strikePrice');
                $data1['type'] = '2';
                $data1['vendor_id'] = $this ->input->post('vendor');
                $data1['food_type'] = $this->input ->post('foodType');
                $data1['packing_charges'] = $this->input ->post('packingCharge');
                  $tax = $this->input->post('tax');
                  $decimalList = $this->Api_model->get_type_name_by_id('general_settings', '111', 'value');
                 $tax_amount = round(($data1['sale_price'] * $tax)/100, $decimalList);
                 $data1['tax'] =   $tax_amount;
                 $data1['tax_percent'] =   $tax ;
                $data1['discount'] = $this ->input->post('discount');
                
                $this ->db->insert('variant', $data1);

                $id1 = $this->db->insert_id();
                $path = $_FILES['image']['name'];
                $ext = pathinfo($path, PATHINFO_EXTENSION);
                $data_image['image'] = 'restaurantproduct_' . $id1 . '.' . $ext;
                $data_image['image_type'] = 'internal';
                $this
                    ->db
                    ->where('variant_id', $id1);
                $this
                    ->db
                    ->update('variant', $data_image);
                $this
                    ->crud_model
                    ->file_up("image", "restaurantproduct", $id1, '', 'no', '.' . $ext);

                $responce = array(
                    'success' => true,
                );

            }
            else if ($para1 == 'list')
            {

                $this
                    ->db
                    ->select('category_id, category_name');
                $loop = $this
                    ->db
                    ->get_where('category', array(
                    'data_vendors' => $para4
                ))->result_array();

                foreach ($loop as $row)
                {
                    $this
                        ->db
                        ->select('restaurantproduct_id, title, product_type,status,from_avaliable_time,to_avaliable_time');
                    $data1 = [];
                    $this
                        ->db
                        ->order_by('restaurantproduct_id', 'desc');
                    $loop1 = $this
                        ->db
                        ->get_where('restaurantproduct', array(
                        'category' => $row['category_id']
                    ))->result_array();

                    foreach ($loop1 as $row1)
                    {

                        $this ->db->limit(1);
                        $variant = $this
                            ->db
                            ->get_where('variant', array(
                            'product_id' => $row1['restaurantproduct_id']
                        ))->result_array();

                        $variants = new stdClass();
                         $i = 0;
                        foreach ($variant as $row2)
                        {
                            
                             if($row2['image_type']=='internal'){
                                   $image = base_url() . 'uploads/restaurantproduct_image/' . $row2['image'];
                              }else{
                                   $image = $row2['image'];
                              }
                            $i++;
                            $variants = array(
                                'variant_id' => $row2['variant_id'],
                                'product_id' => $row2['product_id'],
                                'quantity' => $row2['quantity'],
                                'name' => $row2['name'],
                                'unit' => $row2['unit'],
                                'sale_price' => $row2['sale_price'],
                                'strike_price' => $row2['strike_price'],
                                'tax' => $row2['tax_percent'],
                                'discount' => doubleval(['discount']),
                                'type' => $row2['type'],
                                'itemType' => $row2['food_type'],
                                'selected' => false,
                                'uploadImage' =>$image,
                                

                            );
                        }

                        if ($row1['status'] == 'true')
                        {
                            $row1['status'] = true;
                        }
                        else
                        {
                            $row1['status'] = false;
                        }

                        $data1[] = array(
                            'id' => $row1['restaurantproduct_id'],
                            'product_name' => $row1['title'],
                            'variant' => $variants,
                            'productType' => $row1['product_type'],
                            'status' => $row1['status'],
                            'fromTime' =>$row1['from_avaliable_time'],
                            'toTime' =>$row1['to_avaliable_time']
                        );

                    }
                    $data[] = array(
                        'id' => $row['category_id'],
                        'categoryName' => $row['category_name'],
                        'productdetails' => $data1,
                    );

                }

                $responce = array(
                    'success' => true,
                    'data' => $data,
                    'message' => 'product retrieved successfully',
                );

            }
            else if($para1 == 'editAT'){
                $data['from_avaliable_time'] = $this->input->post('fromTime');
                $data['to_avaliable_time'] = $this->input->post('toTime');
                $data['title'] = $this->input->post('title');
                $this
                    ->db
                    ->where('restaurantproduct_id', $para2);
                $this
                    ->db
                    ->update('restaurantproduct', $data);
                    $responce = array(
                        'success' => true,
                    );
            }
            else if ($para1 == 'delete')
            {

                $this
                    ->db
                    ->where('restaurantproduct_id', $para2);
                $this
                    ->db
                    ->delete('restaurantproduct');
                $this
                    ->db
                    ->where('product_id', $para2);
                $this
                    ->db
                    ->delete('variant');
                $this
                    ->db
                    ->where('product_id', $para2);
                $this
                    ->db
                    ->delete('addon');
                $responce = array(
                    'success' => true,
                );
            }
            else if ($para1 == 'edit')
            {

                $data['category_name'] = $this
                    ->input
                    ->post('categoryName');
                $data['data_vendors'] = $this
                    ->input
                    ->post('vendor');
                $this
                    ->db
                    ->where('category_id', $para2);
                $this
                    ->db
                    ->update('category', $data);
                $id = $para2;
                $path = $_FILES['image']['name'];
                $ext = pathinfo($path, PATHINFO_EXTENSION);
                if ($ext != NULL)
                {
                    $databanner['banner'] = 'category_' .time().$id . '.' . $ext;
                    $this
                        ->crud_model
                        ->file_up("image", "category", time().$id, '', 'no', '.' . $ext);
                    $this
                        ->db
                        ->where('category_id', $id);
                    $this
                        ->db
                        ->update('category', $databanner);
                }
                $responce = array(
                    'success' => true,
                );
            }
            else if ($para1 == 'variantlist')
            {

                $variant = $this
                    ->db
                    ->get_where('variant', array(
                    'product_id' => $para2
                ))->result_array();
                $data = [];
                foreach ($variant as $row2)
                {
                    
                     if($row2['image_type']=='internal'){
                       $image = base_url() . 'uploads/restaurantproduct_image/' . $row2['image'];
                    }else{
                       $image = $row2['image'];
                    }

                    $data[] = array(
                        'variant_id' => $row2['variant_id'],
                        'product_id' => $row2['product_id'],
                        'quantity' => $row2['quantity'],
                        'name' => $row2['name'],
                        'unit' => $row2['unit'],
                        'sale_price' => $row2['sale_price'],
                        'strike_price' => $row2['strike_price'],
                        'tax' => $row2['tax_percent'],
                        'discount' => doubleval($row2['discount']) ,
                        'type' => $row2['type'],
                        'foodType' => $row2['food_type'],
                        'packingCharge' => $row2['packing_charges'],
                        'selected' => false,
                        'uploadImage' => $image,

                    );
                }
                $responce = array(
                    'success' => true,
                    'data' => $data,
                    'message' => 'product retrieved successfully',
                );

            }
            else if ($para1 == 'variant_add')
            {

                $data1['product_id'] = $para2;
                $data1['quantity'] = $this
                    ->input
                    ->post('quantity');
                $data1['name'] = '';
                $data1['unit'] = $this
                    ->input
                    ->post('unit');
                $data1['sale_price'] = $this
                    ->input
                    ->post('salePrice');
                $data1['strike_price'] = $this
                    ->input
                    ->post('strikePrice');
                $data1['type'] = $para3;
                $data1['food_type'] = $this
                    ->input
                    ->post('foodType');
                $data1['vendor_id'] = $this
                    ->input
                    ->post('vendor');
                $data1['packing_charges'] = $this
                    ->input
                    ->post('packingCharge');
              
                 $data1['discount'] = $this->input->post('discount');
                  $tax = $this->input->post('tax');
                  $decimalList = $this->Api_model->get_type_name_by_id('general_settings', '111', 'value');
                 $tax_amount = round(($data1['sale_price'] * $tax)/100, $decimalList);
                 $data1['tax'] =   $tax_amount;
                 $data1['tax_percent'] =   $tax;
                
                $this
                    ->db
                    ->insert('variant', $data1);
                $id1 = $this
                    ->db
                    ->insert_id();
                $path = $_FILES['image']['name'];
                $ext = pathinfo($path, PATHINFO_EXTENSION);
                $data_image['image'] = 'restaurantproduct_' . $id1 . '.' . $ext;
                $data_image['image_type'] = 'internal';
                $this
                    ->db
                    ->where('variant_id', $id1);
                $this
                    ->db
                    ->update('variant', $data_image);
                $this
                    ->crud_model
                    ->file_up("image", "restaurantproduct", $id1, '', 'no', '.' . $ext);

                $responce = array(
                    'success' => true,
                    'data' => 'success',
                    'message' => 'variant added successfully',
                );
            }
            else if ($para1 == 'variant_edit')
            {

            
                $data1['quantity'] = $this->input ->post('quantity');
                $data1['name'] = '';
                $data1['unit'] = $this ->input->post('unit');
                $data1['sale_price'] = $this  ->input ->post('salePrice');
                $data1['strike_price'] = $this->input  ->post('strikePrice');
                $data1['type'] = $para3;
                $data1['food_type'] = $this->input->post('foodType');
                $data1['discount'] = $this->input->post('discount');
                $data1['packing_charges'] = $this ->input->post('packingCharge');
               $tax = $this->input->post('tax');
                  $decimalList = $this->Api_model->get_type_name_by_id('general_settings', '111', 'value');
                 $tax_amount = round(($data1['sale_price'] * $tax)/100, $decimalList);
                 $data1['tax'] =   $tax_amount;
                   $data1['tax_percent'] =   $tax;
                $id1 = $this ->input->post('variant_id');
                $path = $_FILES['image']['name'];
                   $dateTime = time();
                $ext = pathinfo($path, PATHINFO_EXTENSION);
                if ($ext != NULL)
                {

                    $this
                        ->crud_model
                        ->file_up("image", "restaurantproduct",  $dateTime.$id1, '', 'no', '.' . $ext);
                     $data1['image'] =  'restaurantproduct_' . $dateTime.$id1 . '.' . $ext;
                }
                 
                $this
                    ->db
                    ->where('variant_id', $id1);
                $this
                    ->db
                    ->update('variant', $data1);

                $responce = array(
                    'success' => true,
                    'data' => 'success',
                    'message' => 'variant added successfully',
                );
            }
            else if ($para1 == 'product_status')
            {

                $data['status'] = $para3;
                $this
                    ->db
                    ->where('restaurantproduct_id', $para2);
                $this
                    ->db
                    ->update('restaurantproduct', $data);
                $responce = array(
                    'success' => true,
                    'data' => 'success',
                    'message' => 'product successfully',
                );

            }
            else if ($para1 == 'addon_list')
            {

                $loop = $this
                    ->db
                    ->get_where('addon', array(
                    'product_id' => $para2
                ))->result_array();
                $data = [];
                foreach ($loop as $row2)
                {

                    $data[] = array(
                        'id' => $row2['addon_id'],
                        'productId' => $row2['product_id'],
                        'name' => $row2['name'],
                        'salesPrice' =>$row2['sales_price'] ,
                        'type' => $row2['type'],
                        'foodType' => $row2['food_type'],
                    );
                }
                $responce = array(
                    'success' => true,
                    'data' => $data,
                    'message' => 'addon retrieved successfully',
                );

            }
            else if ($para1 == 'addon_add')
            {
                $content_data = file_get_contents("php://input");
                $get_data = json_decode($content_data);
                $data['product_id'] = $get_data->productId;
                $data['name'] = $get_data->name;
                $data['sales_price'] = $get_data->salesPrice; 
                $data['type'] = 2;
                $data['food_type'] = $get_data->foodType;
             
            
                $data['vendor_id'] = $para4;
                $this
                    ->db
                    ->insert('addon', $data);

                $responce = array(
                    'success' => true,
                );
            }
            else if ($para1 == 'addon_update')
            {

                $content_data = file_get_contents("php://input");
                $get_data = json_decode($content_data);
                $data['sales_price'] = $get_data->salesPrice;
                $data['food_type'] = $get_data->foodType;
                $data['name'] = $get_data->name;
                $this
                    ->db
                    ->where('addon_id', $para2);
                $this
                    ->db
                    ->update('addon', $data);

                $responce = array(
                    'success' => true,
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

    function profileimage($para1 = '', $para2 = '')
    {
        if ($this
            ->Api_model
            ->singleselectbox('vendor', 'vendor_id', $para1, 'token') == $this
            ->input
            ->get('api_token', true))
        {
            $id = $para1;
            $path = $_FILES['image']['name'];
            $ext = pathinfo($path, PATHINFO_EXTENSION);
            $data_banner['logo'] = 'vendor_' . $id . '.' . $ext;
            $this
                ->crud_model
                ->file_up("image", "vendor", $id, '', 'no', '.png');
            $this
                ->db
                ->where('vendor_id', $id);
            $this
                ->db
                ->update('vendor', $data_banner);
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
    function walletSystem($para1='', $para2=''){
        if($para1=='banner'){
             
            
           
         
           
            $bankdetail = $this->Api_model->singleselectbox('vendor', 'vendor_id', $para2, 'kyc_seller');
            $bank_detail =json_decode($bankdetail,true);
           $data = array(
                      'totalEarn' => '1',
                      'totalWalletBalance' =>  doubleval($this->db->get_where('vendor_wallet',array('vendor_id' => $para2))->row()->balance),
                      'requestedAmount' => doubleval( $this->Api_model->sumof_w2c('wallet_vendor_transactions','vendor_id',$para2,'status','request','amount')),
                      'requestedCount' =>  $this->Api_model->count_2wcopt('wallet_vendor_transactions','vendor_id',$para2,'status','request'),
                      'cashCollectAmount' =>  doubleval('12'),
                      'cashCollectCount' => 1,
                      'totalWithdraw' => $this->Api_model->count_2wcopt('wallet_vendor_transactions','vendor_id',$para2,'status','success'),
                      'totalWithdrawAmount' => doubleval(  $this->Api_model->sumof_w2c('wallet_vendor_transactions','vendor_id',$para2,'status','success','amount')),
                      'totalOrderCount' =>  $this->Api_model->count_wcopt('vendor_invoice','vendor_id',$para2),
                      'totalOrderAmount' => doubleval( 1),
                      'bankAccountNumber' => $bank_detail['accountNumber'],
                      'bankName' => $bank_detail['bankName'],
                     );
        }
        $responce = array(
                        'success' => false,
                         'data' =>$data
                    );
        
         echo json_encode($responce);
    }
    

    function coverimage($para1 = '', $para2 = '')
    {
        if ($this
            ->Api_model
            ->singleselectbox('vendor', 'vendor_id', $para1, 'token') == $this
            ->input
            ->get('api_token', true))
        {
            $id = $para1;
            $path = $_FILES['image']['name'];
            $ext = pathinfo($path, PATHINFO_EXTENSION);
            $data_banner['cover_image'] = 'cover_' . $id . '.jpg';
            $this
                ->crud_model
                ->file_up("image", "cover", $id, '', 'no', '.jpg');
            $this
                ->db
                ->where('vendor_id', $id);
            $this
                ->db
                ->update('vendor', $data_banner);
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

    function passwordManagement($para1 = '', $para2 = '')
    {
        if ($this
            ->Api_model
            ->singleselectbox('vendor', 'vendor_id', $para2, 'token') == $this
            ->input
            ->get('api_token', true))
        {
            if ($para1 == 'update')
            {
                
                  $content_data = file_get_contents("php://input");
                  $get_data = json_decode($content_data);
                
                if ($this
                    ->Api_model
                    ->singleselectbox('vendor', 'vendor_id', $para2, 'password') == sha1( $get_data->oldPassword))
                {
                    $data['password'] = sha1($get_data->newPassword);
                    $this
                        ->db
                        ->where('vendor_id', $para2);
                    $this
                        ->db
                        ->update('vendor', $data);
                    $responce = array(
                        'data' => true,
                    );
                }
                else
                {
                    $responce = array(
                        'data' => false,
                    );
                }
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
    
    
    
    function updatePassword($para1='', $para2=''){
        
     
                
                  $content_data = file_get_contents("php://input");
                  $get_data = json_decode($content_data);
                
               
                    $data['password'] = sha1($get_data->password);
                    $this->db->where('email', $get_data->email);
                    $this->db->update('vendor', $data);
                    $responce = array(
                        'data' => true,
                    );

        echo json_encode($responce);
    }
    




   

    /** offers upto **/
    function offersupto($para1 = '', $para2 = '')
    {

        $this
            ->db
            ->limit(5);

        $loop = $this
            ->db
            ->get_where('categories_wise_offer')
            ->result_array();

        foreach ($loop as $row)
        {

            $data1 = [];
            $this
                ->db
                ->order_by('rand()');
            $this
                ->db
                ->limit(10);
            $loop1 = $this
                ->db
                ->get_where('sub_category', array(
                'category' => $row['categoryid']
            ))->result_array();
            foreach ($loop1 as $row1)
            {

                $data1[] = array(
                    'id' => $row1['sub_category_id'],
                    'name' => $row1['sub_category_name'],
                    'category' => $row1['category'],
                    'image' => base_url() . 'uploads/sub_category_image/' . $row1['banner'],
                );
            }

            $data[] = array(
                'id' => $row['categories_wise_offer_id'],
                'category' => $this
                    ->Api_model
                    ->singleselectbox('category', 'category_id', $row['categoryid'], 'category_name') ,
                'offer' => $row['offer'],
                'title' => $row['title'],
                'short_description' => $row['short_description'],
                'image' => base_url() . 'uploads/categories_wise_offer_image/' . $row['image'],
                'subcategory' => $data1,
            );
        }

        $responce = array(
            'success' => true,
            'data' => $data,
            'message' => 'subcategories retrieved successfully',
        );
        echo json_encode($responce);
    }

    function categories($para1 = '', $para2 = '')
    {
        $this
            ->db
            ->order_by('category_id', 'asc');
        $loop = $this
            ->db
            ->get_where('category')
            ->result_array();
        foreach ($loop as $row)
        {
            $data[] = array(
                'id' => $row['category_id'],
                'name' => $row['category_name'],
                'image' => base_url() . 'uploads/category_image/' . $row['banner'],
            );
        }
        $responce = array(
            'success' => true,
            'data' => $data,
            'message' => 'Categories retrieved successfully',
        );
        echo json_encode($responce);
    }

    function slider($para1 = '', $para2 = '')
    {

        $this
            ->db
            ->order_by('slider_id', 'asc');
        $loop = $this
            ->db
            ->get_where('slider')
            ->result_array();
        foreach ($loop as $row)
        {
            $data[] = array(
                'id' => $row['slider_id'],
                'slider_text' => $row['slider_text'],
                'button_text' => $row['button_text'],
                'button_color' => 'red',
                'image' => base_url() . 'uploads/slider_image/' . $row['image'],
            );
        }

        $responce = array(
            'success' => true,
            'data' => $data,
            'message' => 'slider retrieved successfully',
        );
        echo json_encode($responce);
    }

    function trends($para1 = '', $para2 = '')
    {

        $this
            ->db
            ->order_by('trends_id', 'asc');
        $loop = $this
            ->db
            ->get_where('trends')
            ->result_array();
        foreach ($loop as $row)
        {
            $data[] = array(
                'id' => $row['trends_id'],
                'name' => $row['title'],
                'image' => base_url() . 'uploads/trends_image/' . $row['image'],
            );
        }
        $responce = array(
            'success' => true,
            'data' => $data,
            'message' => 'trends retrieved successfully',
        );
        echo json_encode($responce);
    }

    function category_ads($para1 = '', $para2 = '')
    {

        $this
            ->db
            ->order_by('categoryads_id', 'asc');
        $loop = $this
            ->db
            ->get_where('categoryads', array(
            'category' => $para1
        ))->result_array();
        foreach ($loop as $row)
        {
            $data[] = array(
                'id' => $row['categoryads_id'],
                'image' => base_url() . 'uploads/categoryads_image/' . $row['image'],
            );
        }
        $responce = array(
            'success' => true,
            'data' => $data,
            'message' => 'category_ads retrieved successfully',
        );
        echo json_encode($responce);
    }
    
    function getZoneList($para1='', $para2=''){
        if($para1=='list'){
          
         $this ->db->order_by('title', 'asc');
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

