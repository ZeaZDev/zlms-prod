<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Calendar extends CI_Controller {

	function __construct() {

		parent::__construct();
		$this->load->model('web/Calendar_model','calendar');
		$this->load->model('web/Home_model','home');
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
		// $data['about'] = $this->home->get_about();
		$data['calendar'] = $this->calendar->get_calendar();
		$data['footer'] = $this->home->get_footer();
		$this->load->view('web/layouts/header',$data);
		$this->load->view('web/calendar/index');
		$this->load->view('web/calendar/calendar');
		$this->load->view('web/layouts/footer');
	}


	public function view()
	{
		$data = array(
		 	'menu' => 'calendar' );
		// $data['about'] = $this->home->get_about();
		$id = $this->uri->segment(3);

		$data['calendar'] = $this->calendar->get_calendar_id($id);
		$data['footer'] = $this->home->get_footer();
		$this->load->view('web/layouts/header',$data);
		$this->load->view('web/calendar/view');
		$this->load->view('web/layouts/footer');
	}



}
