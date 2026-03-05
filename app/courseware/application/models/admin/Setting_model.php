<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * User_model class.
 * 
 * @extends CI_Model
 */
class Setting_model extends CI_Model {

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

	

	public function get_contact() {
		$this->db->select('*');
		$this->db->from('contact');
		$this->db->where('id_contact','1');
		return $this->db->get()->row();
	}
	

	public function update_contact($data) {

		$this->db->where("id_contact", '1');
		$this->db->update("contact",$data);
		return true;
	}


	public function get_footer_type1() {
		$this->db->select('*');
		$this->db->from('footer');
		//$this->db->where('type_footer','1');
		return $this->db->get()->result();	
	}

	public function insert_footer_type1($data) {
		$this->db->insert("footer", $data);
		return true;
	}

	public function get_footer_type1_byid($id) {
		$this->db->select('*');
		$this->db->from('footer');
		$this->db->where('id_footer',$id);
		return $this->db->get()->row();
	}

	public function update_footer_type1($data,$id) {

		$this->db->where("id_footer",$id);
		$this->db->update("footer",$data);
		return true;
	}

		public function get_footer_type2() {
		$this->db->select('*');
		$this->db->from('footer');
		$this->db->where('type_footer','2');
		return $this->db->get()->result();	
	}

	public function get_about() {
		$this->db->select('*');
		$this->db->from('about');
		$this->db->where('id_about','1');
		return $this->db->get()->row();
	}
	

	public function update_about($data) {

		$this->db->where("id_about", '1');
		$this->db->update("about",$data);
		return true;
	}







	

}
