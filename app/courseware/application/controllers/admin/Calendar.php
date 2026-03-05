<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Calendar extends CI_Controller {

	function __construct() {

		parent::__construct();
		$this->load->model('admin/Calendar_model','calendar');
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
			'menu' => 'calendar' );

		$data['calendar'] = $this->calendar->get_calendar();
		$this->load->view('admin/layouts/header',$data);
		$this->load->view('admin/calendar/index');
		$this->load->view('admin/layouts/footer');
	}


	public function add()
	{
		$data = array(
			'menu' => 'calendar' );

		$this->load->view('admin/layouts/header',$data);
		$this->load->view('admin/calendar/add');
		$this->load->view('admin/layouts/footer');
	}

	public function edit()
	{
		$data = array(
			'menu' => 'calendar' );

		$id = $this->uri->segment(4);
		$data['calendar'] = $this->calendar->get_calendar_id($id);
		$this->load->view('admin/layouts/header',$data);
		$this->load->view('admin/calendar/edit');
		$this->load->view('admin/layouts/footer');
	}




	public function insert()
	{
		$this->form_validation->set_message('required', '<font color="red">กรุณาระบุ %s</font>');

		$this->form_validation->set_rules('name', 'ชื่อ', 'trim|required');
		$this->form_validation->set_rules('detail', 'รายละอียด', 'trim|required');
		$this->form_validation->set_rules('date', 'วันที่', 'trim|required');

		if ($this->form_validation->run() == FALSE)
		{
			$data = array(
				'menu' => 'calendar',
				'insert' => 'f' );

			$this->load->view('admin/layouts/header',$data);
			$this->load->view('admin/calendar/add');
			$this->load->view('admin/layouts/footer');



		}else
		{
			$id=$this->input->post('id');

			$data = array();
			$data['name_calendar'] = $this->input->post('name');
			$data['detail_calendar'] = $this->input->post('detail');
			$data['date_calendar'] = $this->input->post('date');
			$data['date2_calendar'] = $this->input->post('date2');
			$data['status_calendar'] = $this->input->post('status') != '1' ? '0' : $this->input->post('status');

			//print_r($data);

			if ($id=='') {
				$result = $this->calendar->insert_calendar($data);
			}else{
				$result = $this->calendar->update_calendar($data,$id);
			}

			if ($result == true)
			{
				$data = array(
					'menu' => 'contact',
					'insert' => 't' );

				$data['faculty'] = $this->admin->get_faculty();
				$this->load->view('admin/layouts/header',$data);
				$this->load->view('admin/calendar/add');
				$this->load->view('admin/layouts/footer');

			}
		}

	}

	





}
