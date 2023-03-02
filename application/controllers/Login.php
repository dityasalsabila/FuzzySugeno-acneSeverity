<?php
class Login extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();

        $this->load->library('form_validation');
        $this->load->database();
    }

    public function index()
    {
        $this->form_validation->set_rules('username', 'Username', 'trim|required');
        $this->form_validation->set_rules('password', 'Password', 'trim|required');

        if ($this->form_validation->run() == false) {
            $data['fuzzy'] = 'Login Page';
            $this->load->view('template/header', $data);
            $this->load->view('login/login');
            $this->load->view('template/footer');
        } else {
            $this->_login();
        }
    }

    public function _login()
    {
        $username = $this->input->post('username');
        $password = $this->input->post('password');

        $user = $this->db->get_where('user', ['username' => $username])->row_array();

        //jika user ada
        if ($user) {
            //usernya ada cek password
            if (password_verify($password, $user['password'])) {
                $data = [
                    'id_pasien' => $user['id_pasien'],
                    'username' => $user['username'],
                    'nama_pasien' => $user['nama_pasien'],
                    'jenis_kelamin' => $user['jenis_kelamin'],
                    'status' => "login"
                ];
                $this->session->set_userdata($data);
                redirect('Trytest');
            } else {
                $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert"> 
                Wrong password!</div>');
                redirect('Login');
            }
        } else {
            $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">
            Username is not registered!</div>');
            redirect('Login');
        }
    }


    public function signin()
    {
        $this->form_validation->set_rules('name', 'Name', 'required|trim');
        $this->form_validation->set_rules('username', 'Username', 'required|trim|is_unique[user.username]', [
            'is_unique' => 'This Username has already registered!'
        ]);
        $this->form_validation->set_rules('password', 'Password', 'required|trim|min_length[3]', [
            'min_length' => 'Password too short!'
        ]);
        $this->form_validation->set_rules('jenis_kelamin', 'Jenis Kelamin', 'required|trim');

        if ($this->form_validation->run() == false) {
            $data['fuzzy'] = 'User Resgistration';
            $this->load->view('template/header', $data);
            $this->load->view('login/signin');
            $this->load->view('template/footer');
        } else {
            $data = [
                'nama_pasien' => htmlspecialchars($this->input->post('name', true)),
                'username' => htmlspecialchars($this->input->post('username', true)),
                'password' => password_hash($this->input->post('password'), PASSWORD_DEFAULT),
                'jenis_kelamin' => $this->input->post('jenis_kelamin'),
            ];

            $this->db->insert('user', $data);
            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">
            Congratulations! your account has been created. Please Login </div>');
            redirect('Login');
        }
    }

    public function logout()
    {
        $this->session->unset_userdata('username');
        $this->session->unset_userdata('status');

        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">
        You have been logged out!</div>');
        redirect('Login');
    }
}
