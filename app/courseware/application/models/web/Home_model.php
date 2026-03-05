<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * User_model class.
 * 
 * @extends CI_Model
 */
class Home_model extends CI_Model {

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

	

	public function get_slideshow() {
		$this->db->select('*');
		$this->db->from('slideshow');
		$this->db->where('status_slideshow','1');
		return $this->db->get()->result();	
	}

	public function get_footer() {
		$this->db->select('*');
		$this->db->from('footer');
		$this->db->where('status_footer','1');
		return $this->db->get()->result();	
	}

	public function get_contact() {
		$this->db->select('*');
		$this->db->from('contact');
		$this->db->where('id_contact',1);
		return $this->db->get()->row();
	}

	public function get_about() {
		$this->db->select('*');
		$this->db->from('about');
		$this->db->where('id_about',1);
		return $this->db->get()->row();
	}





	

}
