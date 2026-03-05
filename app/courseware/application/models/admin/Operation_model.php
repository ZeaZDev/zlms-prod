<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * User_model class.
 * 
 * @extends CI_Model
 */
class Operation_model extends CI_Model {

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

	public function resolve_user_login($username, $password) {
		
		$this->db->select('pass_user');
		$this->db->from('user');
		$this->db->join('role','user.role_user=role.id_role','left');
		$this->db->where('login_user', $username);
		$this->db->where('pass_user', $password);
		$this->db->where('status_user',1);
		$this->db->where('status_role !=',0);
		$hash = $this->db->get()->row('pass_user');
		return $hash;
		
	}
	public function get_user_id_from_username($username) {
		
		$this->db->select('id_user');
		$this->db->from('user');
		$this->db->where('login_user', $username);
		$this->db->join('role','user.role_user=role.id_role','left');
		return $this->db->get()->row('id_user');
		
	}
	public function get_user($id_user) {
		
		$this->db->from('user');
		$this->db->where('id_user', $id_user);
		$this->db->join('role','user.role_user=role.id_role','left');
		return $this->db->get()->row();
		
	}

	public function getPassByCode($id_user) {
		$this->db->select('pass_user');
		$this->db->from('user');
		$this->db->where('id_user', $id_user);
		return $this->db->get()->result();
		
	}

	public function repass($data,$data_id) {
		$this->db->where("id_user", $data_id);
		$this->db->update("user",$data);
		return true;
		
		
	}

















	
	public function get_member() {
		$this->db->select('*');
		$this->db->from('member');
		return $this->db->get()->result();
		
	}

	



	








	

}
