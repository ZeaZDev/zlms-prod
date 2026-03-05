<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * User_model class.
 * 
 * @extends CI_Model
 */
class Calendar_model extends CI_Model {

	/**
	 * __construct function.
	 * 
	 * @access public
	 * @return void
	 */
	public function __construct() {
		
		parent::__construct();
		$this->load->database();
		
	}

	


	public function get_calendar() {
		$this->db->select('*');
		$this->db->from('calendar');
		//$this->db->join('faculty','personnel.faculty_personnel=faculty.id_faculty','left');
		$this->db->Order_by('id_calendar','desc');
		return $this->db->get()->result();	
	}

	public function get_calendar_id($id) {
		$this->db->select('*');
		$this->db->from('calendar');
		$this->db->where('id_calendar',$id);
		return $this->db->get()->row();
	}

	public function insert_calendar($data) {
		$this->db->insert("calendar", $data);
		return true;
	}

	public function update_calendar($data,$id) {

		$this->db->where("id_calendar",$id);
		$this->db->update("calendar",$data);
		return true;
	}








	

}
