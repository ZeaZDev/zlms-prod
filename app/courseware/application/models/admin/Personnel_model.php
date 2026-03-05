<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * User_model class.
 * 
 * @extends CI_Model
 */
class Personnel_model extends CI_Model {

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

	


	public function get_personnel() {
		$this->db->select('*');
		$this->db->from('personnel');
		$this->db->join('faculty','personnel.faculty_personnel=faculty.id_faculty','left');
		//$this->db->where('type_footer','1');
		return $this->db->get()->result();	
	}

	public function get_personnel_id($id) {
		$this->db->select('*');
		$this->db->from('personnel');
		$this->db->where('id_personnel',$id);
		return $this->db->get()->row();
	}

	public function insert_personnel($data) {
		$this->db->insert("personnel", $data);
		return true;
	}

	public function update_personnel($data,$id) {

		$this->db->where("id_personnel",$id);
		$this->db->update("personnel",$data);
		return true;
	}








	

}
