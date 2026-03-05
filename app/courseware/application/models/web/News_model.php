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
		$this->db->where('status_news','1');
		$this->db->order_by("date_news", "desc");
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

	public function get_news_id($id) {
		$this->db->select('*');
		$this->db->from('news');
		$this->db->join('user','user.id_user=news.post_news','left');
		$this->db->where('status_news','1');
		$this->db->where('id_news',$id);
		return $this->db->get()->row();
	}

	public function viewimg($id){
		$this->db->select('*');
		$this->db->from('album_news');
		$this->db->where('idnews_album_news',$id);
		$this->db->where("del_album_news",'0');
		return $this->db->get()->result();	
	}

	public function update_news($datanews,$id) {
		$this->db->where("id_news", $id);
		$this->db->update("news",$datanews);
		return true;
	}



	function get_tag_news($tag = '')
	{
		$sql = "
		SELECT *
		FROM news
		WHERE status_news=1";

		if ($tag != '')
		{
			$sql .= " AND (news.tag_news like '%".$tag."%' ) ";
		}

		$sql .= "
		ORDER BY date_news DESC
		";
		$query = $this->db->query($sql);
		//print_r($this->db->last_query());
		return $query->result();
	}



	

}
