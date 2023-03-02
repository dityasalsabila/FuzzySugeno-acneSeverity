<?php

class Output_model extends CI_model
{
    public function getAllNama_obat()
    {
        $query = $this->db->get('treatment')->result_array();
    }
}