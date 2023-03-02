<?php

class Trytest_model extends CI_Model
{
    public function insertData($table, $data)
    {
        $this->db->insert($table, $data);
    }

    public function getAllData($table)
    {
        return $this->db->get($table);
    }

    public function insertData_get_id($table, $data)
    {
        $query = $this->db->insert($table, $data);
        // id yang didapatkan dari id inputan terakhir di suatu tabel
        $insert_id = $this->db->insert_id();

        return  $insert_id;
    }

    public function get_detail($table, $id_table, $id)
    {
        $this->db->where($id_table, $id);
        $query = $this->db->get($table);
        //mengembalikan satu baris array
        $isi = $query->row_array();
        return $isi;
    }

    public function getPasienById($id_pasien)
    {
        return $this->db->get_where('user', ['id_pasien' => $id_pasien])->row_array();
    }

    public function tambahDataPasien($data_clean)
    {
        //   $this->db->where('id_pasien', $this->input->post('id_pasien'));
        $this->db->insert('pasien', $data_clean);
    }
}
