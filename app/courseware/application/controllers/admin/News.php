<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class News extends CI_Controller {

	function __construct() {

		parent::__construct();
		$this->load->model('admin/News_model','news');
		//$this->load->model('Staff_Model','staff');
		$this->load->library('form_validation');
	}
	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */



	public function index()
	{
		$data = array(
			'menu' => 'news' );

		$data['news_list'] = $this->news->get_news();
		$this->load->view('admin/layouts/header',$data);
		$this->load->view('admin/news/index');
		$this->load->view('admin/layouts/footer');
	}

	public function add()
	{
		$data = array(
			'menu' => 'news' );

		//$data['news_list'] = $this->news->get_new();
		$this->load->view('admin/layouts/header',$data);
		$this->load->view('admin/news/add');
		$this->load->view('admin/layouts/footer');
	}

	public function insert()
	{
		$this->form_validation->set_message('required', '<font color="red">กรุณาระบุ %s</font>');

		$this->form_validation->set_rules('name', 'หัวข้อข่าว', 'trim|required');
		$this->form_validation->set_rules('detail', 'รายละเอียด', 'trim|required');
		// $this->form_validation->set_rules('tag', 'อย่างน้อย 1 Tag', 'trim|required');

		if ($this->form_validation->run() == FALSE)
		{
			$data = array(
				'menu' => 'news',
				'insert' => 'f' );

			//$data['news_list'] = $this->news->get_new();
			$this->load->view('admin/layouts/header',$data);
			$this->load->view('admin/news/add');
			$this->load->view('admin/layouts/footer');

		}else
		{

			$config['upload_path']    = FCPATH.'/assets/img/news/';
			$config['allowed_types']  = 'gif|jpg|png';
			$config['file_name'] = md5(microtime());

			$this->load->library('upload', $config);
			$img_name = "";
			if ( ! $this->upload->do_upload('img')){
				$error = array('error' => $this->upload->display_errors());
			}else{
				$data = array('upload_data' => $this->upload->data());
				$img_name = $data['upload_data']['file_name'];
			}


			$data = array();
			$data['name_news'] = $this->input->post('name');
			$data['detail_news'] = $this->input->post('detail');
			//$data['tag_news'] = $this->input->post('tag');
			$data['tag_news'] = "";
			$data['status_news'] = $this->input->post('status') != '1' ? '0' : $this->input->post('status');
			$data['date_news'] =  date("Y-m-d H:i:s");
			$data['views_news'] = '1';
			$data['img_news'] = $img_name;
			$data['post_news'] = '1';//$_SESSION['id_user'];
			// $data['post_news'] = $_SESSION['id_user'];

			//print_r($data['detail_news']);
			$id_news=$this->news->insert_news($data);

			for($loop=0;$loop<count($_FILES['album_img']['name']);$loop++) {

				$_FILES['singleFile']['name'] = $_FILES['album_img']['name'][$loop];
				$_FILES['singleFile']['type'] = $_FILES['album_img']['type'][$loop];
				$_FILES['singleFile']['tmp_name'] = $_FILES['album_img']['tmp_name'][$loop];
				$_FILES['singleFile']['error'] = $_FILES['album_img']['error'][$loop];
				$_FILES['singleFile']['size'] = $_FILES['album_img']['size'][$loop];

				$this->load->library('upload', $config);
				$img_name = "";
				if ( ! $this->upload->do_upload('singleFile')){
					$error = array('error' => $this->upload->display_errors());
				}else{
					$data = array('upload_data' => $this->upload->data());
					$img_name = $data['upload_data']['file_name'];

					$data2 = array();
					$data2['idnews_album_news'] = $id_news;
					$data2['name_album_news'] = $img_name;
					//print_r($data2);
					$this->news->insert_album_news($data2);
				}
			}

			$data = array(
				'menu' => 'news' ,
				'insert' => 't' );
			//$data['news_list'] = $this->news->get_new();
			$this->load->view('admin/layouts/header',$data);
			$this->load->view('admin/news/add');
			$this->load->view('admin/layouts/footer');
		}
	}

	public function edit()
	{
		$data = array(
			'menu' => 'news' );

		$id = $this->uri->segment(4);

		$data['news'] = $this->news->get_news_id($id);
		$data['album_news'] = $this->news->get_album_news($id);
		$this->load->view('admin/layouts/header',$data);
		$this->load->view('admin/news/edit');
		$this->load->view('admin/layouts/footer');
	}

	public function edit_news()
	{
		$id=$this->input->post('id');
		//echo $id;

		$this->form_validation->set_message('required', '<font color="red">กรุณาระบุ %s</font>');

		$this->form_validation->set_rules('name', 'หัวข้อข่าว', 'trim|required');
		$this->form_validation->set_rules('detail', 'รายละเอียด', 'trim|required');
		// $this->form_validation->set_rules('tag', 'อย่างน้อย 1 Tag', 'trim|required');

		if ($this->form_validation->run() == FALSE)
		{
			$data = array(
				'menu' => 'news',
				'insert' => 'f' );

			$data['news'] = $this->news->get_news_id($id);
			$data['album_news'] = $this->news->get_album_news($id);
			$this->load->view('admin/layouts/header',$data);
			$this->load->view('admin/news/edit');
			$this->load->view('admin/layouts/footer');

		}
		else
		{


			$config['upload_path']    = FCPATH.'/assets/img/news/';
			$config['allowed_types']  = 'gif|jpg|png';
			$config['file_name'] = md5(microtime());

			$this->load->library('upload', $config);
			$img_name = "";
			if ( ! $this->upload->do_upload('img')){
				$error = array('error' => $this->upload->display_errors());
			}else{
				$data = array('upload_data' => $this->upload->data());
				$img_name = $data['upload_data']['file_name'];
			}


			$data = array();
			$data['name_news'] = $this->input->post('name');
			$data['detail_news'] = $this->input->post('detail');
			$data['tag_news'] = $this->input->post('tag');
			$data['status_news'] = $this->input->post('status') != '1' ? '0' : $this->input->post('status');
			//$data['date_news'] =  date("Y-m-d H:i:s");
			if ($img_name!='') {
				$data['img_news'] = $img_name;
			}
			$data['post_news'] = '1';
			// $data['post_news'] = $_SESSION['id_user'];

			//print_r($data['detail_news']);
			$result = $this->news->update_news($data,$id);
			if ($result == true)
			{
				$data = array(
					'menu' => 'news',
					'insert' => 't' );

				$data['news'] = $this->news->get_news_id($id);
				$data['album_news'] = $this->news->get_album_news($id);
				$this->load->view('admin/layouts/header',$data);
				$this->load->view('admin/news/edit');
				$this->load->view('admin/layouts/footer');

			}


		}
	}

	public function album_news_news()
	{
		$id_news = $this->input->post('id_news');

		$config['upload_path']    = FCPATH.'/assets/img/news/';
		$config['allowed_types']  = 'gif|jpg|png';
		$config['file_name'] = md5(microtime());

		for($loop=0;$loop<count($_FILES['img']['name']);$loop++) {

			$_FILES['singleFile']['name'] = $_FILES['img']['name'][$loop];
			$_FILES['singleFile']['type'] = $_FILES['img']['type'][$loop];
			$_FILES['singleFile']['tmp_name'] = $_FILES['img']['tmp_name'][$loop];
			$_FILES['singleFile']['error'] = $_FILES['img']['error'][$loop];
			$_FILES['singleFile']['size'] = $_FILES['img']['size'][$loop];

			$this->load->library('upload', $config);
			$img_name = "";
			if ( ! $this->upload->do_upload('singleFile')){
				$error = array('error' => $this->upload->display_errors());
			}else{
				$data = array('upload_data' => $this->upload->data());
				$img_name = $data['upload_data']['file_name'];

				$data = array();
				$data['idnews_album_news'] = $id_news;
				$data['name_album_news'] = $img_name;
					//print_r($data2);
				$this->news->insert_album_news($data);
			}
		}
		$data = array(
			'menu' => 'news',
			'insert' => 't' );

		$data['news'] = $this->news->get_news_id($id_news);
		$data['album_news'] = $this->news->get_album_news($id_news);
		$this->load->view('admin/layouts/header',$data);
		$this->load->view('admin/news/edit');
		$this->load->view('admin/layouts/footer');

	}

	public function del_img_new()
	{
		$id = $this->input->post('delimg');
		for($loop=0;$loop<count($id);$loop++) {

			$data_id = $id[$loop];

			$data = array();
			$data['del_album_news'] = 1;


			// print_r($data_id);
			// print_r($data);
			$this->news->update_album_news($data,$data_id);

		}

		$data = array(
			'menu' => 'news',
			'insert' => 't' );
		$id_news = $this->uri->segment(4);
		$data['news'] = $this->news->get_news_id($id_news);
		$data['album_news'] = $this->news->get_album_news($id_news);
		$this->load->view('admin/layouts/header',$data);
		$this->load->view('admin/news/edit');
		$this->load->view('admin/layouts/footer');
	}




}
