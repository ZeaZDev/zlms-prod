<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Slideshow extends CI_Controller {

	function __construct() {

		parent::__construct();
		$this->load->model('admin/Slideshow_model','slideshow');
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
			'menu' => 'slideshow' );

		$data['slideshow'] = $this->slideshow->get_slideshow();
		$this->load->view('admin/layouts/header',$data);
		$this->load->view('admin/slideshow/index');
		$this->load->view('admin/layouts/footer');
	}

	public function add()
	{
		$data = array(
			'menu' => 'slideshow' );

		//$data['news_list'] = $this->news->get_new();
		$this->load->view('admin/layouts/header',$data);
		$this->load->view('admin/slideshow/add');
		$this->load->view('admin/layouts/footer');
	}

	public function insert()
	{
		$this->form_validation->set_message('required', '<font color="red">กรุณาระบุ %s</font>');

		$this->form_validation->set_rules('name', 'ชื่อภาพ', 'trim|required');

		if ($this->form_validation->run() == FALSE)
		{
			$data = array(
				'menu' => 'slideshow' ,
				'insert' => 'f' );

			//$data['news_list'] = $this->news->get_new();
			$this->load->view('admin/layouts/header',$data);
			$this->load->view('admin/slideshow/add');
			$this->load->view('admin/layouts/footer');

		}else
		{

			$config['upload_path']    = FCPATH.'/assets/img/slideshow/';
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
			$data['name_slideshow'] = $this->input->post('name');
			$data['url_slideshow'] = $this->input->post('url');
			$data['status_slideshow'] = $this->input->post('status') != '1' ? '0' : $this->input->post('status');
			$data['img_slideshow'] = $img_name;

			$result = $this->slideshow->insert_slideshow($data);
			if ($result == true)
			{
				$data = array(
				'menu' => 'slideshow' ,
				'insert' => 't' );

			//$data['news_list'] = $this->news->get_new();
			$this->load->view('admin/layouts/header',$data);
			$this->load->view('admin/slideshow/add');
			$this->load->view('admin/layouts/footer');
				
			}
		}
	}

	public function edit()
	{
		$data = array(
			'menu' => 'slideshow' );

		$id = $this->uri->segment(4);

		$data['slideshow'] = $this->slideshow->get_slideshow_byid($id);

		//$data['news_list'] = $this->news->get_new();
		$this->load->view('admin/layouts/header',$data);
		$this->load->view('admin/slideshow/edit');
		$this->load->view('admin/layouts/footer');
	}

	public function edit_slideshow()
	{
		$id=$this->input->post('id');
		//echo $id;

		$this->form_validation->set_message('required', '<font color="red">กรุณาระบุ %s</font>');

		$this->form_validation->set_rules('name', 'ชื่อภาพ', 'trim|required');

		if ($this->form_validation->run() == FALSE)
		{
			$data = array(
				'menu' => 'slideshow' ,
				'insert' => 'f' );

			//$data['news_list'] = $this->news->get_new();
			$this->load->view('admin/layouts/header',$data);
			$this->load->view('admin/slideshow/edit');
			$this->load->view('admin/layouts/footer');


		}
		else
		{


			$config['upload_path']    = FCPATH.'/assets/img/slideshow/';
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
			$data['name_slideshow'] = $this->input->post('name');
			$data['url_slideshow'] = $this->input->post('url');
			$data['status_slideshow'] = $this->input->post('status') != '1' ? '0' : $this->input->post('status');
			if ($img_name!='') {
				$data['img_slideshow'] = $img_name;
			}
			
			$result = $this->slideshow->update_slideshow($data,$id);
			if ($result == true)
			{
				$data = array(
				'menu' => 'slideshow' ,
				'insert' => 't' );

			//$data['news_list'] = $this->news->get_new();
			$this->load->view('admin/layouts/header',$data);
			$this->load->view('admin/slideshow/edit');
			$this->load->view('admin/layouts/footer');
				
			}


		}
	}


	




}
