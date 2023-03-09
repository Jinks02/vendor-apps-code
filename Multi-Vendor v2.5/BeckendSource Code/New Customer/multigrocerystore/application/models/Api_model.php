<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');
class Api_model extends CI_Model
{

    function __construct()
    {
        parent::__construct();
    }

    function settings($where, $id, $value)
    {
        $data['value'] = $value;
        $this
            ->db
            ->where($where, $id);
        $this
            ->db
            ->update('settings', $data);
    }

    function contactaddress($id, $select)
    {
        $loop = $this
            ->db
            ->get_where('settings', array(
            'settings_id' => $id
        ))->result_array();
        foreach ($loop as $row)
        {
            return $row[$select];
        }
    }

    function time_elapsed_string($datetime, $full = false)
    {
        $now = new DateTime;
        $ago = new DateTime($datetime);
        $diff = $now->diff($ago);

        $diff->w = floor($diff->d / 7);
        $diff->d -= $diff->w * 7;

        $string = array(
            'y' => 'year',
            'm' => 'month',
            'w' => 'week',
            'd' => 'day',
            'h' => 'hour',
            'i' => 'minute',
            's' => 'second',
        );
        foreach ($string as $k => & $v)
        {
            if ($diff->$k)
            {
                $v = $diff->$k . ' ' . $v . ($diff->$k > 1 ? 's' : '');
            }
            else
            {
                unset($string[$k]);
            }
        }

        if (!$full) $string = array_slice($string, 0, 1);
        return $string ? implode(', ', $string) . ' ago' : 'just now';
    }

    function count_wc($table, $coloum1, $para1)
    {
        $this
            ->db
            ->select($table . 'id');
        $loop = $this
            ->db
            ->get_where($table, array(
            $coloum1 => $para1
        ))->result_array();
        return count($loop);
    }
    
  
    
    function vendorWalletAmount($vendor_id='', $para2=''){
           $this->db->select('balance');
           $loop = $this->db->get_where('vendor_wallet', array('vendor_id' =>$vendor_id)) ->result_array();
          if(count($loop)>0){
             foreach($loop as $row){
                return $row['balance'];
             }
          }else{
               return 'no';
          }
    }
    
     function secondary_wallet($type, $id=''){
           $this->db->select('balance');
           $loop = $this->db->get_where('secondary_wallet', array('vendor_id' =>$id,'type'=>$type)) ->result_array();
          if(count($loop)>0){
             foreach($loop as $row){
                return $row['balance'];
             }
          }else{
               return '0';
          }
    }
    
    
    function walletAmount($userId){
           $this->db->select('balance');
           $loop = $this ->db->get_where('wallet', array('user_id' => $userId)) ->result_array();
          if(count($loop)>0){
             foreach($loop as $row){
                return $row['balance'];
             }
          }else{
               return '0';
          }
        
        
    }
    
    
    function smartuseremail($logKey, $type){
        if($type=='GMail' || $type=='Fb'){
          $loop = $this ->db->get_where('user', array('email' => $logKey, 'status' => 'success')) ->result_array();
        }else if($type=='Phone'){
              $loop = $this->db->get_where('user', array('phone'=> $logKey, 'status' => 'success')) ->result_array();      
        } 
        
        foreach($loop as $row){
         $data = array(
                    'id' => $row['user_id'],
                    'name' => $row['username'],
                    'email' => $row['email'],
                    'api_token' =>  $row['token'],
                    'device_token' => '',
                    'phone' => $row['phone'],
                    'status' => $row['status'],
                    'latitude' => floatval($row['latitude']) ,
                    'longitude' => floatval($row['longitude']) ,
                    'auth' => true,
                    'loginVia' => $type,
                    'address' => json_decode($row['address'], true) ,
                    'selected_address' => $row['selected_address'],
                    'favoriteShop' => json_decode($row['favorite_store'], true),	
                    'image' => $row['image'],
                    'description' => $row['description'], 
                    'walletAmount' =>  $this->walletAmount($row['user_id']),
                );
        }
        
        return $data;
    }

    function counter($table)
    {
        $this
            ->db
            ->select($table . 'id');
        $loop = $this
            ->db
            ->get_where($table)->result_array();
        return count($loop);
    }

    function check_spelling($input)
    {
        ini_set('include_path', ini_get('include_path') . PATH_SEPARATOR . APPPATH . 'libraries/');
        require "phpspellcheck/include.php";

        if ((trim($input)) == "")
        {
            return "";
        }

        $spellcheckObject = new PHPSpellCheck();
        $spellcheckObject->LicenceKey = "TRIAL";
        $spellcheckObject->DictionaryPath = ("application/libraries/phpspellcheck/dictionaries/");
        $spellcheckObject->LoadDictionary("English (International)"); //OPTIONAL//
        $spellcheckObject->LoadCustomDictionary("custom.txt");
        return $suggestionText = $spellcheckObject->didYouMean($input);

    }

    function getcommission_amount($grandtotal,  $vendor_id)
    {
        
     $plan_id = $this->db->get_where('vendor',array('vendor_id' => $vendor_id))->row()->plan;
      

        $loop = $this->db->get_where('vendor_membership', array('vendor_membership_id' =>  $plan_id  ))->result_array();
       
        foreach ($loop as $row)
        {
          
            $commission_amount = ($grandtotal * $row['commision'])/100;
        }
        return  round($commission_amount, 2);
    }

    function getcommission_deliveryamount($driverfees)
    {

        $loop = $this
            ->db
            ->get_where('general_settings', array(
            'general_settings_id' => 95
        ))
            ->result_array();
        foreach ($loop as $row)
        {
            $commission_amount = $driverfees * $row['value'] / 100;
        }
        return round($commission_amount, 2);
    }

    function count_wcopt($table, $coloum1, $para1)
    {
        $this ->db ->select($table . '_id');
        $loop = $this ->db  ->get_where($table, array( $coloum1 => $para1 ))->result_array();
        return count($loop);
    }

    function count_wcoptjs($table, $coloum1, $para1, $select)
    {
        $this
            ->db
            ->select($table . 'id');
        $loop = $this
            ->db
            ->get_where($table, array(
            $coloum1 => $para1
        ))->result_array();
        foreach ($loop as $row)
        {
            return $lenght = count(json_decode($row[$select], true));
        }

    }

    function count_2wcopt($table, $coloum1, $para1, $coloum2, $para2)
    {
        $this
            ->db
            ->select($table . '_id');
        $loop = $this
            ->db
            ->get_where($table, array(
            $coloum1 => $para1,
            $coloum2 => $para2
        ))->result_array();
        return count($loop);
    }

    function count_3wcopt($table, $coloum1, $para1, $coloum2, $para2, $coloum3, $para3)
    {
        $this
            ->db
            ->select($table . '_id');
        $loop = $this
            ->db
            ->get_where($table, array(
            $coloum1 => $para1,
            $coloum2 => $para2,
            $coloum3 => $para3
        ))->result_array();
        return count($loop);
    }

    
    function twowloop($table, $coloum1, $para1, $coloum2, $para2)
    {
    
        return $this
            ->db
            ->get_where($table, array(
            $coloum1 => $para1,
            $coloum2 => $para2
        ))->result_array();
    }

    function count_4wcopt($table, $coloum1, $para1, $coloum2, $para2, $coloum3, $para3, $coloum4, $para4)
    {
        $this
            ->db
            ->select($table . '_id');
        $loop = $this
            ->db
            ->get_where($table, array(
            $coloum1 => $para1,
            $coloum2 => $para2,
            $coloum3 => $para3,
            $coloum4 => $para4
        ))->result_array();
        return count($loop);
    }

    function sumof_sammaryReport($table, $coloum1, $para1, $select)
    {

        $sum = 0;
        $this->db->select($select);
        $loop = $this
            ->db
            ->get_where($table, array(
            $coloum1 => $para1,'grand_status'=>'Completed',
            'method !=' => 'cancelled'
        ))->result_array();

        foreach ($loop as $row)
        {
            $sum += $row[$select];
        }

        return $sum;
    }

    function sumof_sammaryReportdatewise($table, $coloum1, $para1, $coloum2, $para2, $coloum3, $para3, $select)
    {

        $sum = 0;
        $this
            ->db
            ->select($select);
        $loop = $this
            ->db
            ->get_where($table, array(
            $coloum1 => $para1,
            $coloum2 => $para2,
            $coloum3 => $para3,
            'method !=' => 'cancelled'
        ))->result_array();

        foreach ($loop as $row)
        {
            $sum += $row[$select];
        }

        return $sum;
    }
    
    
    function sum_totalsalesreportprovider($mon, $table,$col, $select, $provider)
    {
        $year = date('Y');
        if ($mon == '1')
        {
            $start = strtotime('01-1-' . $year);
            $end = strtotime('31-1-' . $year);
        }
        else if ($mon == '2')
        {
            $start = strtotime('01-2-' . $year);
            $end = strtotime('29-2-' . $year);
        }
        else if ($mon == '3')
        {
            $start = strtotime('01-3-' . $year);
            $end = strtotime('31-3-' . $year);
        }
        else if ($mon == '4')
        {
            $start = strtotime('01-4-' . $year);
            $end = strtotime('30-4-' . $year);
        }
        else if ($mon == '5')
        {
            $start = strtotime('01-5-' . $year);
            $end = strtotime('31-5-' . $year);
        }
        else if ($mon == '6')
        {
            $start = strtotime('01-6-' . $year);
            $end = strtotime('30-6-' . $year);
        }
        else if ($mon == '7')
        {
            $start = strtotime('01-7-' . $year);
            $end = strtotime('31-7-' . $year);
        }
        else if ($mon == '8')
        {
            $start = strtotime('01-8-' . $year);
            $end = strtotime('31-8-' . $year);
        }
        else if ($mon == '9')
        {
            $start = strtotime('01-9-' . $year);
            $end = strtotime('30-9-' . $year);
        }
        else if ($mon == '10')
        {

            $start = strtotime('01-10-' . $year);
            $end = strtotime('31-10-' . $year);
        }
        else if ($mon == '11')
        {
            $start = strtotime('01-11-' . $year);
            $end = strtotime('30-11-' . $year);
        }
        else if ($mon == '12')
        {
            $start = strtotime('01-12-' . $year);
            $end = strtotime('31-12-' . $year);
        }

        $sum = 0;
        $this
            ->db
            ->select($select);
        $loop = $this
            ->db
            ->get_where($table, array(
            $col.'>=' => $start,
            $col.'<=' => $end,
            'provider_id' => $provider,
            'status !=' => 'cancelled'
        ))->result_array();
        foreach ($loop as $row)
        {
            $sum += $row[$select];
        }
        return $sum;

    }
    
    
    function sumof_sammaryReportdatewiseprovider($table, $coloum1, $para1, $coloum2, $para2, $coloum3, $para3, $select)
    {

        $sum = 0;
        $this
            ->db
            ->select($select);
        $loop = $this
            ->db
            ->get_where($table, array(
            $coloum1 => $para1,
            $coloum2 => $para2,
            $coloum3 => $para3,
            'status !=' => 'cancelled'
        ))->result_array();

        foreach ($loop as $row)
        {
            $sum += $row[$select];
        }

        return $sum;
    }
    
    
    
    function sumof_sammaryReportProvider($table, $coloum1, $para1, $select)
    {

        $sum = 0;
        $this
            ->db
            ->select($select);
        $loop = $this
            ->db
            ->get_where($table, array(
            $coloum1 => $para1,
            'status !=' => 'cancelled'
        ))->result_array();

        foreach ($loop as $row)
        {
            $sum += $row[$select];
        }

        return $sum;
    }

    function sumof_sammaryReportadmin($table, $select)
    {

        $sum = 0;
        $this
            ->db
            ->select($select);
        $loop = $this
            ->db
            ->get_where($table, array(
            'method !=' => 'cancelled'
        ))->result_array();

        foreach ($loop as $row)
        {
            $sum += $row[$select];
        }

        return round($sum, 2);
    }

    function sumof_w2c($table, $coloum1, $para1, $coloum2, $para2, $select)
    {

        $sum = 0;
        $this
            ->db
            ->select($select);
        $loop = $this
            ->db
            ->get_where($table, array(
            $coloum1 => $para1,
            $coloum2 => $para2
        ))->result_array();

        foreach ($loop as $row)
        {
            $sum += $row[$select];
        }

        return round($sum, 2);
    }

    function sumof_wc($table, $coloum1, $para1, $select)
    {

        $sum = 0;
        $this
            ->db
            ->select($select);
        $loop = $this
            ->db
            ->get_where($table, array(
            $coloum1 => $para1
        ))->result_array();

        foreach ($loop as $row)
        {
            $sum += $row[$select];
        }

        return $sum;
    }

    function sumof_sammaryReportwithc($table, $coloum1, $para1, $coloum2, $para2, $select)
    {

        $sum = 0;
        $this
            ->db
            ->select($select);
        $loop = $this
            ->db
            ->get_where($table, array(
            $coloum1 => $para1,
            $coloum2 => $para2,
            'method !=' => 'cancelled'
        ))->result_array();

        foreach ($loop as $row)
        {
            $sum += $row[$select];
        }

        return $sum;
    }

    function sumof_sammaryReporthwithc($table, $coloum1, $para1, $coloum2, $para2, $coloum3, $para3, $select)
    {

        $sum = 0;
        $this
            ->db
            ->select($select);
        $loop = $this
            ->db
            ->get_where($table, array(
            $coloum1 => $para1,
            $coloum2 => $para2,
            $coloum3 => $para3,
            'method !=' => 'cancelled'
        ))->result_array();

        foreach ($loop as $row)
        {
            $sum += $row['settlement_value'];
        }

        return $sum;
    }

    function count_monthreport($mon, $table, $coloum1, $para1, $type, $select)
    {
        $year = date('Y');
        if ($mon == '1')
        {
            $start = strtotime('01-1-' . $year);
            $end = strtotime('31-1-' . $year);
        }
        else if ($mon == '2')
        {
            $start = strtotime('01-2-' . $year);
            $end = strtotime('29-2-' . $year);
        }
        else if ($mon == '3')
        {
            $start = strtotime('01-3-' . $year);
            $end = strtotime('31-3-' . $year);
        }
        else if ($mon == '4')
        {
            $start = strtotime('01-4-' . $year);
            $end = strtotime('30-4-' . $year);
        }
        else if ($mon == '5')
        {
            $start = strtotime('01-5-' . $year);
            $end = strtotime('31-5-' . $year);
        }
        else if ($mon == '6')
        {
            $start = strtotime('01-6-' . $year);
            $end = strtotime('30-6-' . $year);
        }
        else if ($mon == '7')
        {
            $start = strtotime('01-7-' . $year);
            $end = strtotime('31-7-' . $year);
        }
        else if ($mon == '8')
        {
            $start = strtotime('01-8-' . $year);
            $end = strtotime('31-8-' . $year);
        }
        else if ($mon == '9')
        {
            $start = strtotime('01-9-' . $year);
            $end = strtotime('30-9-' . $year);
        }
        else if ($mon == '10')
        {

            $start = strtotime('01-10-' . $year);
            $end = strtotime('31-10-' . $year);
        }
        else if ($mon == '11')
        {
            $start = strtotime('01-11-' . $year);
            $end = strtotime('30-11-' . $year);
        }
        else if ($mon == '12')
        {
            $start = strtotime('01-12-' . $year);
            $end = strtotime('31-12-' . $year);
        }
        if ($type == 'count')
        {
            $this
                ->db
                ->select($table . '_id');
            $loop = $this
                ->db
                ->get_where($table, array(
                'order_date >=' => $start,
                'order_date <=' => $end,
                $coloum1 => $para1,
                'method !=' => 'cancelled'
            ))->result_array();
            return count($loop);
        }
        else if ($type == 'instance')
        {

            $this
                ->db
                ->select($table . '_id');
            $loop = $this
                ->db
                ->get_where($table, array(
                'sale_datetime >=' => $start,
                'sale_datetime <=' => $end,
                $coloum1 => $para1,
                'status !=' => 'cancelled',
                'order_type' => 1
            ))->result_array();
            return count($loop);
        }
        else if ($type == 'schedule')
        {
            $this
                ->db
                ->select($table . '_id');
            $loop = $this
                ->db
                ->get_where($table, array(
                'sale_datetime >=' => $start,
                'sale_datetime <=' => $end,
                $coloum1 => $para1,
                'status !=' => 'cancelled',
                'order_type' => 2
            ))->result_array();
            return count($loop);
        }
        else
        {
            $sum = 0;
            $this
                ->db
                ->select($select);
            $loop = $this
                ->db
                ->get_where($table, array(
                'order_date >=' => $start,
                'order_date <=' => $end,
                $coloum1 => $para1,
                'method !=' => 'cancelled'
            ))->result_array();
            foreach ($loop as $row)
            {
                $sum += $row[$select];
            }
            return $sum;
        }
    }

    function count_monthreportadmin($mon, $table, $type, $select)
    {
        $year = date('Y');
        if ($mon == '1')
        {
            $start = strtotime('01-1-' . $year);
            $end = strtotime('31-1-' . $year);
        }
        else if ($mon == '2')
        {
            $start = strtotime('01-2-' . $year);
            $end = strtotime('29-2-' . $year);
        }
        else if ($mon == '3')
        {
            $start = strtotime('01-3-' . $year);
            $end = strtotime('31-3-' . $year);
        }
        else if ($mon == '4')
        {
            $start = strtotime('01-4-' . $year);
            $end = strtotime('30-4-' . $year);
        }
        else if ($mon == '5')
        {
            $start = strtotime('01-5-' . $year);
            $end = strtotime('31-5-' . $year);
        }
        else if ($mon == '6')
        {
            $start = strtotime('01-6-' . $year);
            $end = strtotime('30-6-' . $year);
        }
        else if ($mon == '7')
        {
            $start = strtotime('01-7-' . $year);
            $end = strtotime('31-7-' . $year);
        }
        else if ($mon == '8')
        {
            $start = strtotime('01-8-' . $year);
            $end = strtotime('31-8-' . $year);
        }
        else if ($mon == '9')
        {
            $start = strtotime('01-9-' . $year);
            $end = strtotime('30-9-' . $year);
        }
        else if ($mon == '10')
        {

            $start = strtotime('01-10-' . $year);
            $end = strtotime('31-10-' . $year);
        }
        else if ($mon == '11')
        {
            $start = strtotime('01-11-' . $year);
            $end = strtotime('30-11-' . $year);
        }
        else if ($mon == '12')
        {
            $start = strtotime('01-12-' . $year);
            $end = strtotime('31-12-' . $year);
        }
        if ($type == 'count')
        {
            $this
                ->db
                ->select($table . '_id');
            $loop = $this
                ->db
                ->get_where($table, array(
                'order_date >=' => $start,
                'order_date <=' => $end,
                'method !=' => 'cancelled'
            ))->result_array();
            return count($loop);
        }
        else if ($type == 'instance')
        {

            $this
                ->db
                ->select($table . '_id');
            $loop = $this
                ->db
                ->get_where($table, array(
                'sale_datetime >=' => $start,
                'sale_datetime <=' => $end,
                'status !=' => 'cancelled',
                'order_type' => 1
            ))->result_array();
            return count($loop);
        }
        else if ($type == 'schedule')
        {
            $this
                ->db
                ->select($table . '_id');
            $loop = $this
                ->db
                ->get_where($table, array(
                'sale_datetime >=' => $start,
                'sale_datetime <=' => $end,
                'status !=' => 'cancelled',
                'order_type' => 2
            ))->result_array();
            return count($loop);
        }
        else
        {
            $sum = 0;
            $this
                ->db
                ->select($select);
            $loop = $this
                ->db
                ->get_where($table, array(
                'order_date >=' => $start,
                'order_date <=' => $end,
                'method !=' => 'cancelled'
            ))->result_array();
            foreach ($loop as $row)
            {
                $sum += $row[$select];
            }
            return $sum;
        }
    }

    function count_totalsalesreport($mon, $table, $select)
    {
        $year = date('Y');
        if ($mon == '1')
        {
            $start = strtotime('01-1-' . $year);
            $end = strtotime('31-1-' . $year);
        }
        else if ($mon == '2')
        {
            $start = strtotime('01-2-' . $year);
            $end = strtotime('29-2-' . $year);
        }
        else if ($mon == '3')
        {
            $start = strtotime('01-3-' . $year);
            $end = strtotime('31-3-' . $year);
        }
        else if ($mon == '4')
        {
            $start = strtotime('01-4-' . $year);
            $end = strtotime('30-4-' . $year);
        }
        else if ($mon == '5')
        {
            $start = strtotime('01-5-' . $year);
            $end = strtotime('31-5-' . $year);
        }
        else if ($mon == '6')
        {
            $start = strtotime('01-6-' . $year);
            $end = strtotime('30-6-' . $year);
        }
        else if ($mon == '7')
        {
            $start = strtotime('01-7-' . $year);
            $end = strtotime('31-7-' . $year);
        }
        else if ($mon == '8')
        {
            $start = strtotime('01-8-' . $year);
            $end = strtotime('31-8-' . $year);
        }
        else if ($mon == '9')
        {
            $start = strtotime('01-9-' . $year);
            $end = strtotime('30-9-' . $year);
        }
        else if ($mon == '10')
        {

            $start = strtotime('01-10-' . $year);
            $end = strtotime('31-10-' . $year);
        }
        else if ($mon == '11')
        {
            $start = strtotime('01-11-' . $year);
            $end = strtotime('30-11-' . $year);
        }
        else if ($mon == '12')
        {
            $start = strtotime('01-12-' . $year);
            $end = strtotime('31-12-' . $year);
        }

        $sum = 0;
        $this
            ->db
            ->select($select);
        $loop = $this
            ->db
            ->get_where($table, array(
            'order_date >=' => $start,
            'order_date <=' => $end,
            'method !=' => 'cancelled'
        ))->result_array();
        foreach ($loop as $row)
        {
            $sum += $row[$select];
        }
        return $sum;

    }
    
    
    
    /** sum of report **/
        function sum_totalsalesreport($mon, $table,$col, $select)
    {
        $year = date('Y');
        if ($mon == '1')
        {
            $start = strtotime('01-1-' . $year);
            $end = strtotime('31-1-' . $year);
        }
        else if ($mon == '2')
        {
            $start = strtotime('01-2-' . $year);
            $end = strtotime('29-2-' . $year);
        }
        else if ($mon == '3')
        {
            $start = strtotime('01-3-' . $year);
            $end = strtotime('31-3-' . $year);
        }
        else if ($mon == '4')
        {
            $start = strtotime('01-4-' . $year);
            $end = strtotime('30-4-' . $year);
        }
        else if ($mon == '5')
        {
            $start = strtotime('01-5-' . $year);
            $end = strtotime('31-5-' . $year);
        }
        else if ($mon == '6')
        {
            $start = strtotime('01-6-' . $year);
            $end = strtotime('30-6-' . $year);
        }
        else if ($mon == '7')
        {
            $start = strtotime('01-7-' . $year);
            $end = strtotime('31-7-' . $year);
        }
        else if ($mon == '8')
        {
            $start = strtotime('01-8-' . $year);
            $end = strtotime('31-8-' . $year);
        }
        else if ($mon == '9')
        {
            $start = strtotime('01-9-' . $year);
            $end = strtotime('30-9-' . $year);
        }
        else if ($mon == '10')
        {

            $start = strtotime('01-10-' . $year);
            $end = strtotime('31-10-' . $year);
        }
        else if ($mon == '11')
        {
            $start = strtotime('01-11-' . $year);
            $end = strtotime('30-11-' . $year);
        }
        else if ($mon == '12')
        {
            $start = strtotime('01-12-' . $year);
            $end = strtotime('31-12-' . $year);
        }

        $sum = 0;
        $this
            ->db
            ->select($select);
        $loop = $this
            ->db
            ->get_where($table, array(
            $col.'>=' => $start,
            $col.'<=' => $end,
            'method !=' => 'cancelled'
        ))->result_array();
        foreach ($loop as $row)
        {
            $sum += $row[$select];
        }
        return $sum;

    }

    function get_vendor_to_supercategory($table, $coloum1, $para1, $select, $zone_id)
    {
        $this->db->select($select);
        $loop = $this->db ->get_where($table, array(  $coloum1 => $para1,'zone_id'=>$zone_id,'status' =>'approved' ))->result_array();
        foreach ($loop as $row)
        {
            return  $this->db->get_where('shop_focus', array('shop_focus_id' =>$row[$select]))->row()->supercatgeory_id; 
        
        }
    }

    function singleselectbox($table, $coloum1, $para1, $select)
    {
        $this
            ->db
            ->select($select);
        $loop = $this
            ->db
            ->get_where($table, array(
            $coloum1 => $para1
        ))->result_array();
        foreach ($loop as $row)
        {
            return $row[$select];
        }
    }

    function twoselectbox($table, $coloum1, $para1, $coloum2, $para2, $select)
    {

        $loop = $this
            ->db
            ->get_where($table, array(
            $coloum1 => $para1,
            $coloum2 => $para2
        ))->result_array();
        foreach ($loop as $row)
        {
            return $row[$select];
        }
    }

    function calculateTime($distance)
    {
        $avg_speed = (1 / 48);
        $hours = $avg_speed * $distance;
        $mins = $hours * 60;
        return round($mins) + 10;
    }

    function distance($lat1, $lon1, $lat2, $lon2, $unit)
    {

        $theta = $lon1 - $lon2;
        $dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) + cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
        $dist = acos($dist);
        $dist = rad2deg($dist);
        $miles = $dist * 60 * 1.1515;
        $unit = strtoupper($unit);

         if ($unit == "K")
        {
            return ($miles * 1.609344);
        }
        else if ($unit == "N")
        {
            return ($miles * 0.8684);
        }
        else
        {
            return $miles;
        }
    }


    function getVendorDetails($loop ,$type){
    foreach($loop as $row){
        $general_info = json_decode($row['general_detail'], true);
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
         $distance_unit =  $this->Api_model->get_type_name_by_id('general_settings', '112', 'value');
       $distance = number_format($this
            ->Api_model
            ->distance($this->myLat, $this->myLon, $row['latitude'], $row['longitude'],   $distance_unit) , 2);
        $distance = number_format($this
        ->Api_model
        ->distance($this->myLat, $this->myLon, $row['latitude'], $row['longitude'],   $distance_unit) , 2);
        if($type=='array'){
            $vendor[] = array(
            'shopId' => $row['vendor_id'],
            'shopName' => $row['display_name'],
            'subtitle' => $row['subtitle'],
            'locationMark' => $row['address1'],
            'ratingNum' => $row['rating_num'],
            'ratingTotal' => $row['rating_total'],
            'distance' => $distance,
            'logo' => $img,
            'cover' => $coverImage,
            'latitude' => $row['latitude'],
            'longitude' => $row['longitude'], 
            'openStatus' => $row['livestatus']=='true'?true:false,
            'shopType' => $row['type'],
            'focusType' => $row['focus_id'],
            'marketKey' => $row['market_camping_key'],
            'marketValue' => $row['market_camping_value'],
            'instant' => $row['instant']==1?true:false,
            'takeaway' => $row['takeaway']==1?true:false,
            'schedule' => $row['schedule']==1?true:false,
            'bestSeller' => $row['best_seller']==1?true:false,
            'openingTime' => $general_info['openingTime'],
            'closingTime' =>  $general_info['closingTime'],
            'holidays' =>  $general_info['holidays'],
            'handoverTime' => $row['handover_time']
        );
        } else {
            $vendor = array(
                'shopId' => $row['vendor_id'],
                'shopName' => $row['display_name'],
                'subtitle' => $row['subtitle'],
                'locationMark' => $row['address1'],
                'ratingNum' => $row['rating_num'],
                'ratingTotal' => $row['rating_total'],
                'distance' => $distance,
                'logo' => $img,
                'cover' => $coverImage,
                'latitude' => $row['latitude'],
                'longitude' => $row['longitude'], 
                'openStatus' => $row['livestatus']=='true'?true:false,
                'shopType' => $row['type'],
                'focusType' => $row['focus_id'],
                'marketKey' => $row['market_camping_key'],
                'marketValue' => $row['market_camping_value'],
                'instant' => $row['instant']==1?true:false,
                'takeaway' => $row['takeaway']==1?true:false,
                'schedule' => $row['schedule']==1?true:false,
                'bestSeller' => $row['best_seller']==1?true:false,
                'openingTime' => $general_info['openingTime'],
                'closingTime' =>  $general_info['closingTime'],
                'holidays' =>  $general_info['holidays'],
                'handoverTime' => $row['handover_time']
            );
        }
      
    }
      return $vendor;
    }


    function get_variantDetails($variant){
        $variants = [];
        $i = 0;
        foreach ($variant as $row2)
        {
            if ($i == 0)
            {
                $selected = true;

            }
            else
            {
                $selected = false;
            }

            $i++;
            $variants[] = array(
                'variant_id' => $row2['variant_id'],
                'product_id' => $row2['product_id'],
                'quantity' => $row2['quantity'],
                'name' => $row2['name'],
                'tax' =>  floatval($row2['tax']),
                'discount' => $row2['discount'],
                'unit' => $row2['unit'],
                'image' => base_url() . 'uploads/restaurantproduct_image/' . $row2['image'],
                'sale_price' => $row2['sale_price'],
                'strike_price' => $row2['strike_price'],
                'type' => $row2['type'],
                'selected' => $selected,
                'foodType' => $row2['food_type'],
                'packingCharge' => floatval($row2['packing_charges'])
            );
        }
        return $variants;
    }


    function get_variant2Details($variant){
        $variants = [];
                $i = 0;
                foreach ($variant as $row2)
                {
                    if ($i == 0)
                    {
                        $selected = true;

                    }
                    else
                    {
                        $selected = false;
                    }

                    $i++;
                    if($row2['image_type']=='internal'){
                       $image = base_url() . 'uploads/product_image/' . $row2['image'];
                    }else{
                       $image = $row2['image'];
                    }
                    $variants[] = array(
                        'variant_id' => $row2['variant_2_id'],
                        'product_id' => $row2['product_id'],
                        'quantity' => $row2['quantity'],
                        'name' => $row2['name'],
                        'unit' => $row2['unit'],
                        'sale_price' => $row2['sale_price'],
                        'strike_price' => $row2['strike_price'],
                        'type' => $row2['type'],
                        'minPurchase' => $row2['min_purchase'],
                        'maxPurchase' => $row2['max_purchase'],
                        'tax' =>  floatval($row2['tax']),
                        'discount' => $row2['discount'],
                        'selected' => $selected,
                        'image' =>  $image,
                         'packingCharge' => 0,

                    );
                }

                return $variants;
    }

    function nearestDriver($para1 = '', $para2 = '', $para3='')
    {
      
      $cover_radius = $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '97', 'value');

        $sql = $this
            ->db
            ->query("SELECT  latitude, longitude, name, driver_id, phone, SQRT(
    POW(69.1 * (latitude -  $para1 ), 2) +
    POW(69.1 * ($para2 - longitude) * COS(latitude / 57.3), 2)) AS distance
FROM driver WHERE livestatus ='true' AND block = 'false' AND zone_id = $para3  HAVING distance < $cover_radius ORDER BY distance")->result_array();

        return $sql;
    }
    
     function nearestDrivermanual($para1 = '', $para2 = '', $para3='')
    {
      
      $cover_radius = $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '97', 'value');

        $sql = $this
            ->db
            ->query("SELECT  latitude, longitude, name, driver_id, phone, SQRT(
    POW(69.1 * (latitude -  $para1 ), 2) +
    POW(69.1 * ($para2 - longitude) * COS(latitude / 57.3), 2)) AS distance
FROM driver WHERE livestatus ='true' AND block = 'false' AND zone_id = $para3  HAVING distance < $cover_radius ORDER BY distance")->result_array();

        return $sql;
    }

    function nearestDriverwithVendor($para1 = '', $para2 = '', $para3 = '')
    {
 $cover_radius = $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '97', 'value'); 
        $sql = $this
            ->db
            ->query("SELECT  latitude, longitude, name, driver_id, phone, SQRT(
    POW(69.1 * (latitude -  $para1 ), 2) +
    POW(69.1 * ($para2 - longitude) * COS(latitude / 57.3), 2)) AS distance
FROM driver WHERE livestatus ='true' AND  block = 'false' AND store_id = $para3  HAVING distance < $cover_radius ORDER BY distance ")->result_array();
        return $sql;
    }

    
     function nearestDriverwithVendormanual($para1 = '', $para2 = '', $para3 = '')
    {
 $cover_radius = $this
            ->Api_model
            ->get_type_name_by_id('general_settings', '97', 'value'); 
        $sql = $this
            ->db
            ->query("SELECT  latitude, longitude, name, driver_id, phone, SQRT(
    POW(69.1 * (latitude -  $para1 ), 2) +
    POW(69.1 * ($para2 - longitude) * COS(latitude / 57.3), 2)) AS distance
FROM driver WHERE livestatus ='true' AND  block = 'false' AND store_id = $para3  HAVING distance < $cover_radius ORDER BY distance")->result_array();
        return $sql;
    }
    
    
    function image_upload($filedata = '', $filename = '', $id = '')
    {

        if ($_FILES && $_FILES[$filedata]['name'])
        {
            $exe = pathinfo($_FILES[$filedata]["name"], PATHINFO_EXTENSION);
            $new_name = $filename . '_' . $id;
            $config['file_name'] = $new_name;
            $config['upload_path'] = './uploads/' . $filename . '_image/';
            $config['allowed_types'] = 'gif|jpg|png';
            $config['max_size'] = 10024;
            $config['quality'] = '90%';
            $config['overwrite'] = true;
            $this
                ->load
                ->library('upload', $config);
            if (!$this
                ->upload
                ->do_upload($filedata))
            {
                $isUploadError = true;
                $response = array(
                    'status' => 'error',
                    'message' => $this
                        ->upload
                        ->display_errors()
                );
            }
            else
            {
                $uploadData = $this
                    ->upload
                    ->data();
                $fullPath = base_url('uploads/' . $uploadData['file_name']);
            }
        }

    }

    function tokenfailed()
    {
        $responce = array(
            'success' => false,
            'data' => 'invalid token',
        );
        return $responce;
    }

   

    function get_currency()
    {
        $currency_id = $this
            ->crud_model
            ->get_type_name_by_id('general_settings', '82', 'value');
        $currency_symbol = $this
            ->db
            ->get_where('currency_method', array(
            'currency_method_id' => $currency_id
        ))->row()->currency_symbol;
        return $currency_symbol;
    }

    /////////GET NAME BY TABLE NAME AND ID/////////////
    function get_type_name_by_id($type, $type_id = '', $field = 'name')
    {
        if ($type_id != '')
        {
            $l = $this
                ->db
                ->get_where($type, array(
                $type . '_id' => $type_id
            ));
            $n = $l->num_rows();
            if ($n > 0)
            {
                return $l->row()->$field;
            }
        }
    }

    function date_timestamp($date, $type)
    {
        $date = explode('-', $date);
        $d = $date[2];
        $m = $date[1];
        $y = $date[0];
        if ($type == 'start')
        {
            return mktime(0, 0, 0, $m, $d, $y);
        }
        if ($type == 'end')
        {
            return mktime(0, 0, 0, $m, $d + 1, $y);
        }
    }
    

    //RATING
    function rating($table,$col, $id)
    {
        

        $products = $this->db->get($table,array($col=>$id))->result_array();
        $num = 0;
        $total = 0;
        foreach ($products as $row) {
           
                
                $total += $row['rating'];
            
        }
        if ($num > 0) {
            $number = $total / $num;
            return number_format((float)$number, 2, '.', '');
        } else {
            return 0;
        }
    }
 
    function rating_count($table,$id)
    {
        $num = $this->get_type_name_by_id($table, $id, 'rating_num');
        return $num;
    }
    
    function get_rating_count($table,$coloum1,$para1, $select){
        $this ->db ->select($select);
        $loop = $this ->db  ->get_where($table, array( $coloum1 => $para1 ))->result_array();
        return count($loop);
    }
    
    function timeZone(){
      $timeZone_id =  $this->Api_model->get_type_name_by_id('general_settings', '109', 'value');
      $timezone =  $this->db->get_where('timezone', array('timezone_id' =>  $timeZone_id))->row()->name;
      date_default_timezone_set($timezone);
    }
    
    
    


    
    
    
  /*
    function pointer($latitude, $longitude){

         $zone_id = 'no_matched';  
         $point2 = array($latitude, $longitude);
  
         $this->db->order_by('zone_id','desc');
         $loop =   $this->db->get_where('zone',array('status'=>fasle))->result_array();
      
        foreach($loop as $row){
          
             $polygon = array();
         $polygon1 = json_decode($row['positions'],true);
             
          foreach($polygon1 as $row1){
             $point = $this ->pointStringToCoordinates($row1);
             $polygon[] = array($point["x"],$point["y"]);
          }
         
            echo  $this->contains($point2,$polygon);
    
            $zone_status =  $this->contains($point2,$polygon)?'inside':'outside';
             if($zone_status=='inside'){
                $zone_id = $row['zone_id'];
             } 
            
        
        }
        
         return $zone_id;





    }
    */
 
    function pointStringToCoordinates($pointString) {
        $coordinates = explode(" ", $pointString);
        return array("x" => $coordinates[0], "y" => $coordinates[1]);
    }
    
    
    function pointer2($latitude, $longitude){

         $zone_id = 'no_matched';  
         $point2 = array($latitude, $longitude);
  
         $this->db->order_by('zone_id','desc');
         $loop =   $this->db->get_where('zone',array('status'=>'fasle'))->result_array();
      
        foreach($loop as $row){
          
             $polygon = array();
         $polygon1 = json_decode($row['positions'],true);
          
             
          foreach($polygon1 as $row1){
             
             $point = $this ->pointStringToCoordinates($row1);
             
             $vertices_x[] = $point["x"];
             $vertices_y[] = $point["y"];
          }
           $points_polygon = count($vertices_x) - 1;  // number vertices - zero-based array
           if ($this->is_in_polygon($points_polygon, $vertices_x, $vertices_y, $latitude, $longitude)){
                  /* inside */
                $zone_id = $row['zone_id'];
             } 
    
            
            
        
        }
        
         return $zone_id;


    }
    
    
    function is_in_polygon($points_polygon, $vertices_x, $vertices_y, $longitude_x, $latitude_y)
{
  $i = $j = $c = 0;
  for ($i = 0, $j = $points_polygon ; $i < $points_polygon; $j = $i++) {
    if ( (($vertices_y[$i]  >  $latitude_y != ($vertices_y[$j] > $latitude_y)) &&
     ($longitude_x < ($vertices_x[$j] - $vertices_x[$i]) * ($latitude_y - $vertices_y[$i]) / ($vertices_y[$j] - $vertices_y[$i]) + $vertices_x[$i]) ) )
       $c = !$c;
  }
  return $c;
}
    
    
/*    
    function contains($point, $polygon)
{
    if($polygon[0] != $polygon[count($polygon)-1])
        $polygon[count($polygon)] = $polygon[0];
    $j = 0;
    $oddNodes = false;
    $x = $point[1];
    $y = $point[0];
    $n = count($polygon);
    for ($i = 0; $i < $n; $i++)
    {
        $j++;
        if ($j == $n)
        {
            $j = 0;
        }
        if ((($polygon[$i][0] < $y) && ($polygon[$j][0] >= $y)) || (($polygon[$j][0] < $y) && ($polygon[$i][0] >=
            $y)))
        {
            
            if ($polygon[$i][1] + ($y - $polygon[$i][0]) / ($polygon[$j][0] - $polygon[$i][0]) * ($polygon[$j][1] -
                $polygon[$i][1]) < $x)
            {
                echo 1;
                $oddNodes = !$oddNodes;
            }
        }
    }
       
    return $oddNodes;
} */
    
    function count_monthreportProvider($mon, $table, $coloum1, $para1, $type, $select)
    {
        $year = date('Y');
        if ($mon == '1')
        {
            $start = strtotime('01-1-' . $year);
            $end = strtotime('31-1-' . $year);
        }
        else if ($mon == '2')
        {
            $start = strtotime('01-2-' . $year);
            $end = strtotime('29-2-' . $year);
        }
        else if ($mon == '3')
        {
            $start = strtotime('01-3-' . $year);
            $end = strtotime('31-3-' . $year);
        }
        else if ($mon == '4')
        {
            $start = strtotime('01-4-' . $year);
            $end = strtotime('30-4-' . $year);
        }
        else if ($mon == '5')
        {
            $start = strtotime('01-5-' . $year);
            $end = strtotime('31-5-' . $year);
        }
        else if ($mon == '6')
        {
            $start = strtotime('01-6-' . $year);
            $end = strtotime('30-6-' . $year);
        }
        else if ($mon == '7')
        {
            $start = strtotime('01-7-' . $year);
            $end = strtotime('31-7-' . $year);
        }
        else if ($mon == '8')
        {
            $start = strtotime('01-8-' . $year);
            $end = strtotime('31-8-' . $year);
        }
        else if ($mon == '9')
        {
            $start = strtotime('01-9-' . $year);
            $end = strtotime('30-9-' . $year);
        }
        else if ($mon == '10')
        {

            $start = strtotime('01-10-' . $year);
            $end = strtotime('31-10-' . $year);
        }
        else if ($mon == '11')
        {
            $start = strtotime('01-11-' . $year);
            $end = strtotime('30-11-' . $year);
        }
        else if ($mon == '12')
        {
            $start = strtotime('01-12-' . $year);
            $end = strtotime('31-12-' . $year);
        }
        if ($type == 'count')
        {
            $this
                ->db
                ->select($table . '_id');
            $loop = $this
                ->db
                ->get_where($table, array(
                'date >=' => $start,
                'date <=' => $end,
                $coloum1 => $para1,
                'status !=' => 'cancelled'
            ))->result_array();
            return count($loop);
        }
        else if ($type == 'instance')
        {

            $this
                ->db
                ->select($table . '_id');
            $loop = $this
                ->db
                ->get_where($table, array(
                'sale_datetime >=' => $start,
                'sale_datetime <=' => $end,
                $coloum1 => $para1,
                'status !=' => 'cancelled',
                'order_type' => 1
            ))->result_array();
            return count($loop);
        }
        else if ($type == 'schedule')
        {
            $this
                ->db
                ->select($table . '_id');
            $loop = $this
                ->db
                ->get_where($table, array(
                'sale_datetime >=' => $start,
                'sale_datetime <=' => $end,
                $coloum1 => $para1,
                'status !=' => 'cancelled',
                'order_type' => 2
            ))->result_array();
            return count($loop);
        }
        else
        {
            $sum = 0;
            $this
                ->db
                ->select($select);
            $loop = $this
                ->db
                ->get_where($table, array(
                'order_date >=' => $start,
                'order_date <=' => $end,
                $coloum1 => $para1,
                'method !=' => 'cancelled'
            ))->result_array();
            foreach ($loop as $row)
            {
                $sum += $row[$select];
            }
            return $sum;
        }
    }
      
  /**Sales Count Function**/
     function CountGType($para1='',$para2=''){
        if($para2=='Gupdate'){
            $this->db->select('sales_count');
            $loop =$this->db->get_where('product',array('product_id'=>$para1))->result_array();
            if(count($loop)>=0){
                foreach($loop as $row){
                    $count=$row['sales_count']+1;
                    $data['sales_count'] = $count;
                    $this->db->where('product_id',$para1);
                    $this->db->update('product', $data);
                }
            }

        }
        else if($para2=='Rupdate'){
            $this->db->select('sales_count');
            $loop =$this->db->get_where('restaurantproduct',array('restaurantproduct_id'=>$para1))->result_array();
            if(count($loop)>=0){
                foreach($loop as $row){
                    $count=$row['sales_count']+1;
                    $data['sales_count'] = $count;
                    $this->db->where('restaurantproduct_id',$para1);
                    $this->db->update('product', $data);
                }
            }

        }

    }
}
?>
