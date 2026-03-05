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
		$this->db->where('status_calendar','1');
		return $this->db->get()->result();	
	}

	public function get_calendar_id($id) {
		$this->db->select('*');
		$this->db->from('calendar');
		$this->db->where('status_calendar','1');
		$this->db->where('id_calendar',$id);
		return $this->db->get()->row();
	}

	





	

}
