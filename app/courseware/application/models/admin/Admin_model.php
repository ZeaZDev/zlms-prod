<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * User_model class.
 * 
 * @extends CI_Model
 */
class Admin_model extends CI_Model {

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

	

	public function get_role() {
		$this->db->select('*');
		$this->db->from('role');
		return $this->db->get()->result();
		
	}

	public function insert_role($data) {
		$this->db->insert("role", $data);
		return true;
	}

	public function get_role_byid($id) {
		$this->db->select('*');
		$this->db->from('role');
		$this->db->where('id_role',$id);
		return $this->db->get()->row();
	}

	public function update_role($data,$id) {

		$this->db->where("id_role", $id);
		$this->db->update("role",$data);
		return true;
	}


	public function get_user() {
		$this->db->select('*');
		$this->db->from('user');
		$this->db->join('faculty','user.faculty_user=faculty.id_faculty','left');
		$this->db->join('role','user.role_user=role.id_role','left');
		return $this->db->get()->result();
		
	}

	public function get_faculty() {
		$this->db->select('*');
		$this->db->from('faculty');
		return $this->db->get()->result();
		
	}

	public function insert_user($data) {
		$this->db->insert("user", $data);
		return true;
	}

	public function get_user_byid($id) {
		$this->db->select('*');
		$this->db->from('user');
		$this->db->where('id_user',$id);
		return $this->db->get()->row();
	}

	public function update_user($data,$id) {

		$this->db->where("id_user", $id);
		$this->db->update("user",$data);
		return true;
	}

















	

}
