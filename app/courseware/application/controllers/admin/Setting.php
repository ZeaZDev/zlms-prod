<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Setting extends CI_Controller {

	function __construct() {

		parent::__construct();
		$this->load->model('admin/Setting_model','setting');
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



	public function contact()
	{
		$data = array(
			'menu' => 'contact' );

		$data['contact'] = $this->setting->get_contact();
		$this->load->view('admin/layouts/header',$data);
		$this->load->view('admin/setting/contact');
		$this->load->view('admin/layouts/footer');
	}


	public function update_contact()
	{
		$this->form_validation->set_message('required', '<font color="red">กรุณาระบุ %s</font>');

		$this->form_validation->set_rules('name', 'ชื่อ', 'trim|required');
		$this->form_validation->set_rules('detail', 'รายละเอียด', 'trim|required');

		if ($this->form_validation->run() == FALSE)
		{
			$data = array(
				'menu' => 'contact',
				'insert' => 'f' );

			$data['contact'] = $this->setting->get_contact();
			$this->load->view('admin/layouts/header',$data);
			$this->load->view('admin/setting/contact');
			$this->load->view('admin/layouts/footer');



		}else
		{

			$data = array();
			$data['name_contact'] = $this->input->post('name');
			$data['detail_contact'] = $this->input->post('detail');
			
			$result = $this->setting->update_contact($data);

			if ($result == true)
			{
				$data = array(
					'menu' => 'contact',
					'insert' => 't' );

				$data['contact'] = $this->setting->get_contact();
				$this->load->view('admin/layouts/header',$data);
				$this->load->view('admin/setting/contact');
				$this->load->view('admin/layouts/footer');
				
			}
		}

	}

	public function footer()
	{
		$data = array(
			'menu' => 'footer' );

		$data['footer_type1'] = $this->setting->get_footer_type1();
		$this->load->view('admin/layouts/header',$data);
		$this->load->view('admin/setting/footer');
		$this->load->view('admin/layouts/footer');
	}

	public function add_footer_type1()
	{
		$data = array(
			'menu' => 'footer' );

		//$data['footer_type1'] = $this->setting->get_footer_type1();
		$this->load->view('admin/layouts/header',$data);
		$this->load->view('admin/setting/add_footer_type1');
		$this->load->view('admin/layouts/footer');
	}

	public function insert_footer_type1()
	{
		$this->form_validation->set_message('required', '<font color="red">กรุณาระบุ %s</font>');

		$this->form_validation->set_rules('name', 'ชื่อหน่วยงานที่เกี่ยวข้อง', 'trim|required');
		$this->form_validation->set_rules('url', 'URL', 'trim|required');
		$this->form_validation->set_rules('type', 'หน่วยงาน', 'trim|required');

		if ($this->form_validation->run() == FALSE)
		{
			$data = array(
				'menu' => 'footer',
				'insert' => 'f' );

			$this->load->view('admin/layouts/header',$data);
			$this->load->view('admin/setting/add_footer_type1');
			$this->load->view('admin/layouts/footer');

		}else
		{

			$data = array();
			$data['name_footer'] = $this->input->post('name');
			$data['url_footer'] = $this->input->post('url');
			$data['type_footer'] = $this->input->post('type');
			$data['status_footer'] = $this->input->post('status');

			$id=$this->input->post('id');

			//echo $id;

			if ($id=='') {

				$result = $this->setting->insert_footer_type1($data);
				if ($result == true)
				{
					$data = array(
						'menu' => 'footer',
						'insert' => 't' );

					$this->load->view('admin/layouts/header',$data);
					$this->load->view('admin/setting/add_footer_type1');
					$this->load->view('admin/layouts/footer');

				}
			}else{

				$result = $this->setting->update_footer_type1($data,$id);
				if ($result == true)
				{
					$data = array(
						'menu' => 'footer',
						'insert' => 't' );

					$this->load->view('admin/layouts/header',$data);
					$this->load->view('admin/setting/add_footer_type1');
					$this->load->view('admin/layouts/footer');

				}
			}

			
			
			
		}
	}

	public function edit_footer_type1()
	{
		$data = array(
			'menu' => 'footer' );

		$id = $this->uri->segment(4);
		$data['footer_type1'] = $this->setting->get_footer_type1_byid($id);
		$this->load->view('admin/layouts/header',$data);
		$this->load->view('admin/setting/edit_footer_type1');
		$this->load->view('admin/layouts/footer');
	}




	public function about()
	{
		$data = array(
			'menu' => 'about' );

		$data['about'] = $this->setting->get_about();
		$this->load->view('admin/layouts/header',$data);
		$this->load->view('admin/setting/about');
		$this->load->view('admin/layouts/footer');
	}


	public function update_about()
	{
		$this->form_validation->set_message('required', '<font color="red">กรุณาระบุ %s</font>');

		$this->form_validation->set_rules('name1', 'ชื่อ', 'trim|required');
		$this->form_validation->set_rules('name2', 'ชื่อ', 'trim|required');
		$this->form_validation->set_rules('name3', 'ชื่อ', 'trim|required');
		$this->form_validation->set_rules('detail', 'รายละอียด', 'trim|required');

		if ($this->form_validation->run() == FALSE)
		{
			$data = array(
				'menu' => 'about',
				'insert' => 'f' );

			$data['about'] = $this->setting->get_about();
			$this->load->view('admin/layouts/header',$data);
			$this->load->view('admin/setting/about');
			$this->load->view('admin/layouts/footer');

		}
		else
		{


			$config['upload_path']    = FCPATH.'/assets/img/tem/';
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
			$data['name1_about'] = $this->input->post('name1');
			$data['name2_about'] = $this->input->post('name2');
			$data['name3_about'] = $this->input->post('name3');
			$data['detail_about'] = $this->input->post('detail');

			if ($img_name!='') {
				$data['img_about'] = $img_name;
			}
			
			//print_r($data['detail_news']);
			$result = $this->setting->update_about($data);
			if ($result == true)
			{
				$data = array(
					'menu' => 'about',
					'insert' => 't' );

				$data['about'] = $this->setting->get_about();
				$this->load->view('admin/layouts/header',$data);
				$this->load->view('admin/setting/about');
				$this->load->view('admin/layouts/footer');
				
			}


		}

	}

	




}
