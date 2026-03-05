<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class News extends CI_Controller {

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
			'menu' => 'news' );

		$data['news'] = $this->news->get_news();
		$data['footer'] = $this->home->get_footer();
		$this->load->view('web/layouts/header',$data);
		$this->load->view('web/news/index');
		$this->load->view('web/layouts/footer');
	}

	public function tag()
	{
		$data = array(
			'menu' => 'news' );

		$tag = $this->uri->segment(3);

		//echo ($tag);
		
		$data['news'] = $this->news->get_tag_news($tag);
		$data['footer'] = $this->home->get_footer();
		$this->load->view('web/layouts/header',$data);
		$this->load->view('web/news/index');
		$this->load->view('web/layouts/footer');
	}


	public function view()
	{
		$data = array(
			'menu' => 'news' );

		$id = $this->uri->segment(3);

		$data['news'] = $this->news->get_news_id($id);
		$data['img'] = $this->news->viewimg($id);
		$data['footer'] = $this->home->get_footer();

		$views=$data['news']->views_news;
		
		if ($views!='') {
			$datanews = array();
			$datanews['views_news'] = $views+1;
			$result = $this->news->update_news($datanews,$id);

			if ($result == true)
			{
				$this->load->view('web/layouts/header',$data);
				$this->load->view('web/news/view');
				$this->load->view('web/layouts/footer');
			}
		}else{
			redirect('web2019');
		}
		
	}


}
