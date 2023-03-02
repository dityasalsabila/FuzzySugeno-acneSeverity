<?php

class Home extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->database();
	}


	public function index()
	{
		$data['fuzzy'] = 'sistem pakar';

		$this->load->view('template/header', $data);
		$this->load->view('home/home');
		$this->load->view('template/footer');
	}
}
