<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {

	function __construct() {

		parent::__construct();
		$this->load->model('admin/Admin_model','admin');
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



	public function user()
	{
		$data = array(
			'menu' => 'user' );

		$data['user'] = $this->admin->get_user();
		$this->load->view('admin/layouts/header',$data);
		$this->load->view('admin/admin/user');
		$this->load->view('admin/layouts/footer');
	}

	public function adduser()
	{
		$data = array(
			'menu' => 'user' );

		$data['role'] = $this->admin->get_role();
		$data['faculty'] = $this->admin->get_faculty();
		$this->load->view('admin/layouts/header',$data);
		$this->load->view('admin/admin/user_add');
		$this->load->view('admin/layouts/footer');
	}

	public function user_insert()
	{
		$this->form_validation->set_message('required', '<font color="red">กรุณาระบุ %s</font>');

		$this->form_validation->set_rules('fname', 'ชื่อ', 'trim|required');
		$this->form_validation->set_rules('lname', 'นามสกุล', 'trim|required');
		$this->form_validation->set_rules('mail', 'อีเมล', 'trim|required');
		$this->form_validation->set_rules('tall', 'เบอร์โทรศัพท์', 'trim|required');
		$this->form_validation->set_rules('faculty', 'สังกัด', 'trim|required');
		$this->form_validation->set_rules('role', 'สิทธิผู้ใช้งาน', 'trim|required');

		if ($this->form_validation->run() == FALSE)
		{
			$data = array(
				'menu' => 'user',
				'insert' => 'f' );

			//$data['news_list'] = $this->news->get_new();
			$data['role'] = $this->admin->get_role();
			$data['faculty'] = $this->admin->get_faculty();
			$this->load->view('admin/layouts/header',$data);
			$this->load->view('admin/admin/user_add');
			$this->load->view('admin/layouts/footer');

		}else
		{
			$id=$this->input->post('id');

			$data = array();
			$data['fname_user'] = $this->input->post('fname');
			$data['lname_user'] = $this->input->post('lname');
			$data['login_user'] = $this->input->post('mail');
			if ($id=='') {

				$data['pass_user'] = md5(md5(md5($this->input->post('tall'))));
			}
			$data['tall_user'] = $this->input->post('tall');
			$data['faculty_user'] = $this->input->post('faculty');
			$data['role_user'] = $this->input->post('role');
			$data['status_user'] = $this->input->post('status') != '1' ? '0' : $this->input->post('status');


			if ($id=='') {
				$result = $this->admin->insert_user($data);
			}else{
				$result = $this->admin->update_user($data,$id);
			}

			if ($result == true)
			{
				$data = array(
					'menu' => 'role',
					'insert' => 't' );

				$data['role'] = $this->admin->get_role();
				$data['faculty'] = $this->admin->get_faculty();
				$this->load->view('admin/layouts/header',$data);
				$this->load->view('admin/admin/user_add');
				$this->load->view('admin/layouts/footer');
				
			}
		}
	}



	public function edituser()
	{
		$data = array(
			'menu' => 'user' );

		$id = $this->uri->segment(4);

		$data['role'] = $this->admin->get_role();
		$data['faculty'] = $this->admin->get_faculty();
		$data['user'] = $this->admin->get_user_byid($id);
		$this->load->view('admin/layouts/header',$data);
		$this->load->view('admin/admin/user_edit');
		$this->load->view('admin/layouts/footer');
	}












	public function role()
	{
		$data = array(
			'menu' => 'role' );

		$data['role'] = $this->admin->get_role();
		$this->load->view('admin/layouts/header',$data);
		$this->load->view('admin/admin/role');
		$this->load->view('admin/layouts/footer');
	}

	public function addrole()
	{
		$data = array(
			'menu' => 'role' );

		//$data['role'] = $this->admin->get_role();
		$this->load->view('admin/layouts/header',$data);
		$this->load->view('admin/admin/role_add');
		$this->load->view('admin/layouts/footer');
	}

	public function role_insert()
	{
		$this->form_validation->set_message('required', '<font color="red">กรุณาระบุ %s</font>');

		$this->form_validation->set_rules('name', 'สิทธิผู้ใช้งาน', 'trim|required');

		if ($this->form_validation->run() == FALSE)
		{
			$data = array(
				'menu' => 'role',
				'insert' => 'f' );

			//$data['news_list'] = $this->news->get_new();
			$this->load->view('admin/layouts/header',$data);
			$this->load->view('admin/admin/role_add');
			$this->load->view('admin/layouts/footer');

		}else
		{
			$data = array();
			$data['name_role'] = $this->input->post('name');
			$data['news_role'] = $this->input->post('news') != '1' ? '0' : $this->input->post('news');
			$data['calendar_role'] = $this->input->post('calendar') != '1' ? '0' : $this->input->post('calendar');
			$data['personnel_role'] = $this->input->post('personnel') != '1' ? '0' : $this->input->post('personnel');
			$data['setting_role'] = $this->input->post('setting') != '1' ? '0' : $this->input->post('setting');
			$data['status_role'] = $this->input->post('status') != '1' ? '0' : $this->input->post('status');

			$id=$this->input->post('id');

			if ($id=='') {
				$result = $this->admin->insert_role($data);
			}else{
				$result = $this->admin->update_role($data,$id);
			}

			if ($result == true)
			{
				$data = array(
					'menu' => 'role',
					'insert' => 't' );

			//$data['news_list'] = $this->news->get_new();
				$this->load->view('admin/layouts/header',$data);
				$this->load->view('admin/admin/role_add');
				$this->load->view('admin/layouts/footer');
				
			}
		}
	}



	public function editrole()
	{
		$data = array(
			'menu' => 'role' );

		$id = $this->uri->segment(4);

		$data['role'] = $this->admin->get_role_byid($id);
		$this->load->view('admin/layouts/header',$data);
		$this->load->view('admin/admin/role_edit');
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

	




}
