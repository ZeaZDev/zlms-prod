<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

	function __construct() {

		parent::__construct();
		$this->load->model('web/Home_model','home');
		$this->load->model('web/News_model','news');
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
			'menu' => 'home' );

		$data['news'] = $this->news->get_news();
		$data['slideshow'] = $this->home->get_slideshow();
		$data['footer'] = $this->home->get_footer();
		$this->load->view('web/layouts/header',$data);
		$this->load->view('web/home/index');
		$this->load->view('web/layouts/footer');
	}


}
