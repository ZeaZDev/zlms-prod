<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class About extends CI_Controller {

	function __construct() {

		parent::__construct();
		$this->load->model('web/Home_model','home');
		$this->load->model('web/News_model','news');
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
			'menu' => 'about' );
		$data['about'] = $this->home->get_about();
		$data['footer'] = $this->home->get_footer();
		$this->load->view('web/layouts/header',$data);
		$this->load->view('web/about/index');
		$this->load->view('web/layouts/footer');
	}



}
