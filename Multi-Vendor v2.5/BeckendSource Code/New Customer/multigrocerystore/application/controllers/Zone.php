
<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Zone extends CI_Controller
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
      
        $this->load->view('front/zone');
     
    }
    
    
    function zoneEdit($para1='', $para2=''){
          $data['zone_id'] = $para1;
          $this->load->view('front/zone_edit',$data);
    }
    
    function saveZone($para1='', $para2=''){
      
        $coordinates = explode(",", $this->input->post('position'));
         
        $i =0;
        $limit = 0;
        $totallength = count($coordinates);
        if($totallength%2==0){
            $limit = $totallength;
        }else{
            $limit = $totallength-1;
        }
    
        foreach($coordinates as $position){
            if($i%2==0 && $i<$limit ){
               
             $val[] =   preg_replace('/[^\d-.]+/', '', $coordinates[$i]).' '.preg_replace('/[^\d-.]+/', '', $coordinates[$i+1]);
             
            }
                                          
            
           $i++;
        }
        
        print_r($val);
     
        $data['title']     = $this->input->post('title');
        if($this->input->post('coordinates')!=''){
        $data['positions'] = json_encode($val);
        $data['position_array'] =$this->input->post('position');
        $data['original_position'] = json_encode($this->input->post('coordinates'));
        }
        
        
        $data['date']      = time();
        if($para1=='do_add'){
          $this->db->insert('zone',$data);
        } else{
          $id = $this->input->post('zone_id');
          $this->db->where('zone_id', $id);
          $this->db->update('zone',$data);
        }
    }
    
   function loadZone(){
        $this->myLat = $this->input ->get('myLat', true);
        $this->myLon = $this ->input ->get('myLon', true);
        $this->Api_model->pointer($this->myLat,   $this->myLon);
   }
   
    
    function decodeTest(){
       $loop = json_decode($this->db->get_where('zone', array('zone_id' => 1))->row()->positions,true);
    echo count($loop);
        
    }
    
   
    
}

?>
 
