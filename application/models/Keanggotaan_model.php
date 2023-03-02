<?php

class Keanggotaan_model extends CI_Model
{
    public function get_keanggotaan_by_var($table, $id_table, $id)
    {
        $this->db->where($id_table, $id);
        $query = $this->db->get($table);
        //mengembalikan seluruh nilai array 
        $isi = $query->result_array();
        return $isi;
    }

    public function hasil_keanggotaan2($id_data)
    {
        $this->db->select('`variabel`.kelompok, `hasil_periksa`.id_variabel, `variabel`.nama_variabel, 
        `keanggotaan`.keterangan, `hasil_periksa`.mem_func, `hasil_periksa`.id_data');
        $this->db->from('variabel');
        $this->db->join('hasil_periksa', 'hasil_periksa.id_variabel=variabel.id_variabel', 'left');
        $this->db->join('keanggotaan', 'keanggotaan.id_keanggotaan=hasil_periksa.id_keanggotaan', 'left');
        $this->db->where('hasil_periksa.id_data', $id_data);
        $this->db->order_by('variabel.kelompok', 'asc');
        $query = $this->db->get();
        //menghitung byk baris
        if ($query->num_rows() != 0) {
            return $query->result_array();
        } else {
            return false;
        }
    }

    public function getAllObat($kondisi, $tingkat_acne)
    {
        return $this->db->query('SELECT * FROM `treatment` WHERE kondisi=' . $kondisi . ' AND ' . $tingkat_acne . ' = 1 ')->result_array();
    }

    // public function get_mem_func($id_data, $id_variabel)
    // {
    //     return $this->db->query(' SELECT mem_func FROM hasil_periksa WHERE hasil_periksa.id_data= ' . $id_data . ' 
    //     AND hasil_periksa.id_variabel= ' . $id_variabel)->row()->mem_func;
    //     // $query = $this->db->query(' SELECT hasil_periksa WHERE hasil_periksa.id_data= ' . $id_data . ' AND hasil_periksa.id_variabel= ' . $id_variabel);
    //     // return $query->result_array();
    // }
}
