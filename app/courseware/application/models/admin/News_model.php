<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * User_model class.
 * 
 * @extends CI_Model
 */
class News_model extends CI_Model {

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

	

	public function get_news() {
		$this->db->select('*');
		$this->db->from('news');
		$this->db->join('user','news.post_news=user.id_user','left');
		// $this->db->join('car_type','car_model.id_car_type=car_type.id_car_type','left');
		// $this->db->where("dell_car_model",'0');
		$this->db->order_by("news.id_news","desc");
		return $this->db->get()->result();
		
	}
	
	public function insert_news($data) {
		$this->db->insert("news", $data);
		$id_news=$this->db->insert_id();
		return $id_news;
	}

	public function insert_album_news($data) {
		$this->db->insert("album_news", $data);
	}



	public function get_news_id($id) {
		$this->db->select('*');
		$this->db->from('news');
		$this->db->where('id_news',$id);
		return $this->db->get()->row();
	}
	public function get_album_news($id) {
		$this->db->select('*');
		$this->db->from('album_news');
		$this->db->where("idnews_album_news",$id);
		$this->db->where("del_album_news",'0');
		return $this->db->get()->result();
		
	}


	public function update_news($data,$data_id) {

		$this->db->where("id_news", $data_id);
		$this->db->update("news",$data);
		return true;
	}

	public function update_album_news($data,$data_id) {

		$this->db->where("id_album_news", $data_id);
		$this->db->update("album_news",$data);
	}





	

}
