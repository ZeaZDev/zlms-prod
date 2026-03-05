<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Personnel extends CI_Controller {

	function __construct() {

		parent::__construct();
		$this->load->model('admin/Personnel_model','personnel');
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



	public function index()
	{
		$data = array(
			'menu' => 'personnel' );

		$data['personnel'] = $this->personnel->get_personnel();
		$this->load->view('admin/layouts/header',$data);
		$this->load->view('admin/personnel/index');
		$this->load->view('admin/layouts/footer');
	}


	public function add()
	{
		$data = array(
			'menu' => 'personnel' );

		$data['faculty'] = $this->admin->get_faculty();
		$this->load->view('admin/layouts/header',$data);
		$this->load->view('admin/personnel/add');
		$this->load->view('admin/layouts/footer');
	}

	public function edit()
	{
		$data = array(
			'menu' => 'personnel' );

		$id = $this->uri->segment(4);
		$data['personnel'] = $this->personnel->get_personnel_id($id);
		$data['faculty'] = $this->admin->get_faculty();
		$this->load->view('admin/layouts/header',$data);
		$this->load->view('admin/personnel/edit');
		$this->load->view('admin/layouts/footer');
	}




	public function insert()
	{
		$this->form_validation->set_message('required', '<font color="red">กรุณาระบุ %s</font>');
		$this->form_validation->set_message('valid_email', '<font color="red"> %s ไม่ถูกต้อง</font>');
		$this->form_validation->set_message('numeric', '<font color="red">กรุณาระบุ %s เป็นตัวเลข</font>');

		$this->form_validation->set_rules('fname', 'ชื่อ', 'trim|required');
		$this->form_validation->set_rules('lname', 'นามสกุล', 'trim|required');
		$this->form_validation->set_rules('faculty', 'สังกัด', 'trim|required');
		$this->form_validation->set_rules('email', 'Email', 'trim|valid_email');
		$this->form_validation->set_rules('tel', 'เบอร์โทรศัพท์', 'trim|required|numeric');

		if ($this->form_validation->run() == FALSE)
		{
			$data = array(
				'menu' => 'contact',
				'insert' => 'f' );

			$data['faculty'] = $this->admin->get_faculty();
			$this->load->view('admin/layouts/header',$data);
			$this->load->view('admin/personnel/add');
			$this->load->view('admin/layouts/footer');



		}else
		{
			$id=$this->input->post('id');

			$data = array();
			$data['fname_personnel'] = $this->input->post('fname');
			$data['lname_personnel'] = $this->input->post('lname');
			$data['faculty_personnel'] = $this->input->post('faculty');
			$data['mail_personnel'] = $this->input->post('email');
			$data['tel_personnel'] = $this->input->post('tel');

			if ($id=='') {
				$result = $this->personnel->insert_personnel($data);
			}else{
				$result = $this->personnel->update_personnel($data,$id);
			}

			if ($result == true)
			{
				$data = array(
					'menu' => 'contact',
					'insert' => 't' );

				$data['faculty'] = $this->admin->get_faculty();
				$this->load->view('admin/layouts/header',$data);
				$this->load->view('admin/personnel/add');
				$this->load->view('admin/layouts/footer');
				
			}
		}

	}

	





}
