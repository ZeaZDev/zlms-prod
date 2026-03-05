<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Operation extends CI_Controller {

	function __construct() {

		parent::__construct();
		$this->load->model('admin/Operation_model','operation');
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

	public function user_login() {

		$username = $this->input->post('login');
		$password = md5(md5(md5($this->input->post('pass'))));


		if ($this->operation->resolve_user_login($username,$password)) {

			$id_user = $this->operation->get_user_id_from_username($username);
			$login_user    = $this->operation->get_user($id_user);
				// set session user datas
			$_SESSION['id_user']        = (int)$login_user->id_user;
			$_SESSION['login_user']     = (string)$login_user->login_user;
			$_SESSION['fname_user']     = (string)$login_user->fname_user;
			$_SESSION['lname_user']     = (string)$login_user->lname_user;
			$_SESSION['repass_user']     = (string)$login_user->repass_user;
			
			$_SESSION['name_role']     = (string)$login_user->name_role;
			$_SESSION['news_role']     = (string)$login_user->news_role;
			$_SESSION['calendar_role']     = (string)$login_user->calendar_role;
			$_SESSION['personnel_role']     = (string)$login_user->personnel_role;
			$_SESSION['setting_role']     = (string)$login_user->setting_role;
			$_SESSION['status_role']     = (string)$login_user->status_role;


			$_SESSION['logged_in']        = (bool)true;

			redirect('admin/home');
			

		} else {

			$data = array(
				'menu' => 'home',
				'login' => 'no' );

			$data['news'] = $this->news->get_news();
			$data['slideshow'] = $this->home->get_slideshow();
			$data['footer'] = $this->home->get_footer();
			$this->load->view('web/layouts/header',$data);
			$this->load->view('web/home/index');
			$this->load->view('web/layouts/footer');
			//redirect('operation/home');
		}
	}

	public function logout() {

		// create the data object
		$data = new stdClass();

		if (isset($_SESSION['logged_in']) && $_SESSION['logged_in'] == true) {

			// remove session datas
			foreach ($_SESSION as $key => $value) {
				unset($_SESSION[$key]);
			}
			// user logout ok
			redirect('home');

		} else {

			// there user was not logged in, we cannot logged him out,
			// redirect him to site root
			redirect('admin/home');

		}
		//print_r($_SESSION);

	}




	

	// public function home()
	// {	
	// 	redirect('web');
	// }

	// public function error()
	// {	
	// 	$data = array(
	// 		'sidebar' => 'dashboard' );
	// 	$this->load->view('layouts/header',$data);
	// 	$this->load->view('operation/error');
	// 	$this->load->view('layouts/footer');
	// }


	// public function backdrop()
	// {	

	// 	$password = $this->input->post('pass');
	// 	if ($password=='limo41') {
	// 		redirect('operation/home');
	// 	}
	// 	$this->load->view('master/backdrop/index');
	// }

	// public function repass()
	// {
	// 	$this->form_validation->set_message('required', '<font color="red">กรุณาระบุ %s</font>');

	// 	$this->form_validation->set_rules('pass', 'รหัสผ่านเดิม', 'trim|required');
	// 	$this->form_validation->set_rules('passn', 'รหัสผ่านใหม่', 'trim|required');
	// 	$this->form_validation->set_rules('passn2', 'รหัสผ่านใหม่', 'trim|required');

	// 	if ($this->form_validation->run() == FALSE)
	// 	{
	// 		$data = array(
	// 			'repass' => '1',
	// 			'sidebar' => '1' );
	// 		$this->load->view('layouts/header',$data);
	// 		$this->load->view('operation/password');
	// 		$this->load->view('layouts/footer');

	// 	}


	// 	$id_p = $_SESSION['id_user'];
	// 	$passworddb =  $this->operation->getPassByCode($id_p);  
	// 	$passworddb = $passworddb[0]->pass_user;      
	// 	$pass = md5(md5(md5($this->input->post('pass'))));
	// 	$passn = $this->input->post('passn');
	// 	$passn2 = $this->input->post('passn2');


	// 	if ($pass != $passworddb) {
	// 		$data = array(
	// 			'repass' => '1',
	// 			'sidebar' => '1',
	// 			"re"=>"passerror" );
	// 		$this->load->view('layouts/header',$data);
	// 		$this->load->view('operation/password');
	// 		$this->load->view('layouts/footer');
	// 	}
	// 	elseif ($passn != $passn2) {
	// 		$data = array(
	// 			'repass' => '1',
	// 			'sidebar' => '1',
	// 			"re"=>"passerror2" );
	// 		$this->load->view('layouts/header',$data);
	// 		$this->load->view('operation/password');
	// 		$this->load->view('layouts/footer');
	// 	}
	// 	else
	// 	{

	// 		$data = array();
	// 		$data['pass_user'] =  md5(md5(md5($this->input->post('passn'))));
	// 		$data['repass'] =  1;

	// 		$data_id = $_SESSION['id_user'];
	// 		$result = $this->operation->repass($data,$data_id);

	// 		if ($result == true)
	// 		{
	// 			$data = array(
	// 				'sidebar' => '1',
	// 				"re"=>"ok" );
	// 			$this->load->view('layouts/header',$data);
	// 			$this->load->view('operation/password');
	// 			$this->load->view('layouts/footer');

	// 		}

	// 	}
	// }

	public function pass()
	{
		$data = array(
			'menu' => '',
			're' => '1' );

		//$data['news_list'] = $this->news->get_new();
		$this->load->view('admin/layouts/header',$data);
		$this->load->view('admin/admin/re_pass');
		$this->load->view('admin/layouts/footer');
	}

	public function repass_user()
	{
		$this->form_validation->set_message('required', '<font color="red">กรุณาระบุ %s</font>');
		$this->form_validation->set_message('min_length', '<font color="red"> กรุณาระบุ %s (อย่างน้อย 8 หลัก)  </font>');
		$this->form_validation->set_message('matches', '<font color="red">กรุณาระบุรหัสผ่านให้ตรงกัน</font>');

		$this->form_validation->set_rules('p1', 'รหัสผ่านเดิม', 'trim|required');
		$this->form_validation->set_rules('p2', 'รหัสผ่านใหม่', 'trim|required|min_length[8]');
		$this->form_validation->set_rules('p3', 'รหัสผ่านใหม่ ', 'trim|required|matches[p2]');

		if ($this->form_validation->run() == FALSE)
		{
			$data = array(
				'menu' => '',
				're' => '1' );
			$this->load->view('admin/layouts/header',$data);
			$this->load->view('admin/admin/re_pass');
			$this->load->view('admin/layouts/footer');

		}else{


			$id_p = $_SESSION['id_user'];
			$passworddb =  $this->operation->getPassByCode($id_p);  
			$passworddb = $passworddb[0]->pass_user;      
			$p1 = md5(md5(md5($this->input->post('p1'))));
			$p2 = $this->input->post('p2');
			$p3 = $this->input->post('p3');


			if ($p1 != $passworddb) {
				$data = array(
					'menu' => '',
					're' => '1',
					"error"=>"1" );
				$this->load->view('admin/layouts/header',$data);
				$this->load->view('admin/admin/re_pass');
				$this->load->view('admin/layouts/footer');
			}
			else
			{

				$data = array();
				$data['pass_user'] =  md5(md5(md5($this->input->post('p2'))));
				$data['repass_user'] =  1;

				$data_id = $_SESSION['id_user'];
				$result = $this->operation->repass($data,$data_id);

				if ($result == true)
				{
					

					$data = array(
						'menu' => '',
						"insert"=>"t" );
					$_SESSION['repass_user'] = 1;
					$this->load->view('admin/layouts/header',$data);
					$this->load->view('admin/admin/re_pass');
					$this->load->view('admin/layouts/footer');

				}

			}

		}






	}









}
