<?php

class Trytest extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        if ($this->session->userdata('status') != "login") {
            redirect(base_url("Login"));
        }
        // $this->load->database();
        $this->load->model('Trytest_model');
        $this->load->model('Keanggotaan_model');
        $this->load->helper('url');
        $this->load->library('form_validation');
    }

    public function index()
    {
        $data['fuzzy'] = 'sistem pakar';
        $data['user'] = $this->db->get_where('user', ['id_pasien' => $this->session->userdata('id_pasien')])->row_array();
        $this->load->model('Trytest_model');
        $this->load->view('template/header', $data);
        $this->load->view('home/index');
        $this->load->view('template/footer');
    }

    public function tambah()
    {
        $data['fuzzy'] = 'sistem pakar';
        $data['user'] = $this->db->get_where('user', ['id_pasien' => $this->session->userdata('id_pasien')])->row_array();

        // validasi inputan memastikan harus terisi
        $this->form_validation->set_rules('kondisi', 'Condition', 'required');
        $this->form_validation->set_rules('jenis_kulit', 'Condition', 'required');
        $this->form_validation->set_rules('komedo', 'Condition', 'required');
        $this->form_validation->set_rules('pustul', 'Condition', 'required');
        $this->form_validation->set_rules('nodul', 'Condition', 'required');

        if ($this->form_validation->run() == FALSE) {
            $this->load->view('template/header', $data);
            $this->load->view('home/index');
            $this->load->view('template/footer');
        } else {
            //cek sesi yang masuk berdasarkan id_pasien dan mengambil nilai inputan dari view
            $this->session->userdata('id_pasien');
            $id_pasien = $this->input->post('id_pasien', true);
            $nama_pasien = $this->input->post('nama_pasien', true);
            $jenis_kelamin = $this->input->post('jenis_kelamin', true);
            $kondisi = $this->input->post('kondisi', true);
            $jenis_kulit = $this->input->post('jenis_kulit', true);
            $komedo = $this->input->post('komedo', true);
            $pustul = $this->input->post('pustul', true);
            $nodul = $this->input->post('nodul', true);

            // in_array fungsi untuk mencari nilai di dalam array, jika ada return true
            if (in_array("", $data) || in_array("0", $data)) {
                $data_clean = array(
                    'id_pasien' => $id_pasien,
                    'nama_pasien' => $nama_pasien,
                    'jenis_kelamin' => $jenis_kelamin,
                    'kondisi' => $kondisi,
                    'jenis_kulit' => $jenis_kulit,
                    'komedo' =>  $komedo,
                    'pustul' =>  $pustul,
                    'nodul' =>  $nodul,
                    'valid' => 0
                );
            } else {
                $data_clean = array(
                    'id_pasien' => $id_pasien,
                    'nama_pasien' => $nama_pasien,
                    'jenis_kelamin' => $jenis_kelamin,
                    'kondisi' => $kondisi,
                    'jenis_kulit' => $jenis_kulit,
                    'komedo' =>  $komedo,
                    'pustul' =>  $pustul,
                    'nodul' =>  $nodul,
                    'valid' => 1
                );
            }
            $data['kondisi'] = $kondisi;

            //insert data inputan dan return id pasien
            $query = $this->Trytest_model->insertData_get_id('pasien', $data_clean);
            //get seluruh data periksa berdasarkan id pasien
            $data['periksa'] = $this->Trytest_model->get_detail('pasien', 'id_data', $query);

            //*step 1 Fuzzifikasi
            $this->proses_fuzzyfikasi($query);
            //*tampilan list hasil fuzzifikasi
            $data['fuzzyfikasi'] = $this->Keanggotaan_model->hasil_keanggotaan2($query);

            // *step 2 proses conjunction/inferensi get rule
            $conjunction = $this->proses_conjunction($query);
            $data['conjunction'] = $conjunction['linguistic'];

            //menghitung jumlah rule pada proses conjunction
            $data['jum_rule'] = count($data['conjunction']);

            // *step 3 disjunction rule
            $disjunction = $conjunction['disjunction'];
            $disj = $this->proses_disjunction($disjunction);

            //menampilkan jumlah per tingkat acne ke view
            $data['jml_ringan'] = $disj['jml_ringan'];
            $data['jml_sedang'] = $disj['jml_sedang'];
            $data['jml_berat'] = $disj['jml_berat'];

            //menampilkan rule hasil disjunction ke view
            $data['ringan'] = $disj['string_ringan'];
            $data['sedang'] = $disj['string_sedang'];
            $data['berat'] = $disj['string_berat'];

            // *step 4 defuzzifikasi
            $defuzzifikasi = $this->proses_defuzzifikasi($disj['max_ringan'], $disj['max_sedang'], $disj['max_berat']);

            $data['defuzzifikasi'] = $defuzzifikasi;
            //menampilkan max masing-masing tingkat risiko
            $data['max_ringan'] = $disj['max_ringan'];
            $data['max_sedang'] = $disj['max_sedang'];
            $data['max_berat'] = $disj['max_berat'];

            //menghitung Z score total berdasarkan score setiap tingkat acne
            $data['z_scoretotal'] = ($defuzzifikasi[0]['z_score'] + $defuzzifikasi[1]['z_score'] + $defuzzifikasi[2]['z_score']) / ($disj['max_ringan'] + $disj['max_sedang'] + $disj['max_berat']);

            //membatasi nilai desimal dibelakang koma
            $data['z_score_total'] = number_format($data['z_scoretotal'], 2);

            //ambil score dr masing-masing diagnosa pada database
            $scr_ringan = $this->Trytest_model->get_detail("diagnosa", "id_diagnosa", 1);
            $scr_sedang = $this->Trytest_model->get_detail("diagnosa", "id_diagnosa", 2);
            $scr_berat = $this->Trytest_model->get_detail("diagnosa", "id_diagnosa", 3);

            //menampilkan hasil total berdasarkan interval tingkat acne
            if ($data['z_score_total'] <= $scr_ringan['score']) {
                $data['max_z_score'] = 'RINGAN';
                $id_diagnosa = 1;
            } elseif (($data['z_score_total'] > $scr_ringan['score']) && ($data['z_score_total'] <= $scr_sedang['score'])) {
                $data['max_z_score'] = 'SEDANG';
                $id_diagnosa = 2;
            } elseif ($data['z_score_total'] > $scr_sedang['score']) {
                $data['max_z_score'] = 'BERAT';
                $id_diagnosa = 3;
            }
            //simpan/insert hasil
            $insert_hasil = array(
                'id_data' => $query,
                'kondisi' => $kondisi,
                'id_diagnosa' => $id_diagnosa,
                'z_score' =>  $data['z_score_total']
            );

            $this->Trytest_model->insertData('hasil', $insert_hasil);

            $pemilihanobat = $this->proses_pemilihanobat($query);
            $data['topical'] = $pemilihanobat['topical'];
            $data['oral'] = $pemilihanobat['oral'];
            $data['lainnya'] = $pemilihanobat['lainnya'];

            $data['fuzzy'] = 'sistem pakar';
            $this->load->view('template/header', $data);
            $this->load->view('output/index', $data);
            $this->load->view('template/footer');
            // redirect('Trytest/proses_periksa');
        }
    }

    private function proses_fuzzyfikasi($id)
    {
        //mengambil data inputan
        $data_pemeriksaan = $this->Trytest_model->get_detail('pasien', 'id_data', $id);

        $var_jenis_kulit = $data_pemeriksaan['jenis_kulit']; //kelompok 1
        $var_komedo = $data_pemeriksaan['komedo']; //kelompok 2
        $var_pustul = $data_pemeriksaan['pustul']; //kelompok 3
        $var_nodul = $data_pemeriksaan['nodul']; //kelompok 4

        $id_var_jenis_kulit = 1;
        //mengambil himpunan fuzzy berdasarkan id_variabel 
        $keanggotaan_jenis_kulit = $this->Keanggotaan_model->get_keanggotaan_by_var('keanggotaan', 'id_variabel', $id_var_jenis_kulit);
        //variabel fuzzy ke proses fuzzifikasi 
        $this->fuzzyfikasi($id, $id_var_jenis_kulit, $keanggotaan_jenis_kulit, $var_jenis_kulit, 'KERING', 'NORMAL', 'BERMINYAK');

        $id_var_komedo = 2;
        $keanggotaan_komedo = $this->Keanggotaan_model->get_keanggotaan_by_var('keanggotaan', 'id_variabel', $id_var_komedo);
        $this->fuzzyfikasi($id, $id_var_komedo, $keanggotaan_komedo, $var_komedo, 'KOMEDO RINGAN', 'KOMEDO SEDANG', 'KOMEDO BERAT');

        $id_var_pustul = 3;
        $keanggotaan_pustul = $this->Keanggotaan_model->get_keanggotaan_by_var('keanggotaan', 'id_variabel', $id_var_pustul);
        $this->fuzzyfikasi($id, $id_var_pustul, $keanggotaan_pustul, $var_pustul, 'PUSTUL RINGAN', 'PUSTUL SEDANG', 'PUSTUL BERAT');

        $id_var_nodul = 4;
        $keanggotaan_nodul = $this->Keanggotaan_model->get_keanggotaan_by_var('keanggotaan', 'id_variabel', $id_var_nodul);
        $this->fuzzyfikasi($id, $id_var_nodul, $keanggotaan_nodul, $var_nodul, 'TIDAK NODUL', 'NODUL SEDANG', 'NODUL BERAT');
    }

    private function fuzzyfikasi($id_data, $id_variabel, $keanggotaan, $var, $bb, $bt, $ba)
    {
        //proses mencari derajat keanggotaan/nilai fuzzy pada fungsi keanggotaan  
        foreach ($keanggotaan as $td) {
            //rumus pada batas bawah
            if ($td['keterangan'] == $bb) {
                if ($var == 0) {
                    $miu = 1;
                } elseif ($var <= $td['b_bawah']) {
                    $miu = 1;
                } elseif (($var >= $td['b_bawah']) && ($var <= $td['b_atas'])) {
                    $miu = ($td['b_atas'] - $var) / ($td['b_atas'] - $td['b_bawah']);
                } elseif ($var >= $td['b_atas']) {
                    $miu = 0;
                }

                //rumus pada batas tengah
            } elseif ($td['keterangan'] == $bt) {
                if (($var <= $td['b_bawah']) || ($var >= $td['b_atas'])) {
                    $miu = 0;
                } elseif (($var >= $td['b_bawah']) && ($var <= $td['b_tengah'])) {
                    $miu = ($var - $td['b_bawah']) / ($td['b_tengah'] - $td['b_bawah']);
                } elseif (($var >= $td['b_tengah']) && ($var <= $td['b_atas'])) {
                    $miu = ($td['b_atas'] - $var) / ($td['b_atas'] - $td['b_tengah']);
                }
                //rumus pada batas atas
            } elseif ($td['keterangan'] == $ba) {
                if ($var <= $td['b_bawah']) {
                    $miu = 0;
                } elseif (($var >= $td['b_bawah']) && ($var <= $td['b_atas'])) {
                    $miu = ($var - $td['b_bawah']) / ($td['b_atas'] - $td['b_bawah']);
                } elseif ($var >= $td['b_atas']) {
                    $miu = 1;
                }
            }

            if ($miu != 0) {
                //dimasukkan ke dalam database
                $fuzzy = array(
                    'id_data' => $id_data,
                    'id_variabel' => $id_variabel,
                    'id_keanggotaan' => $td['id_keanggotaan'],
                    'mem_func' => $miu
                );
                $this->Trytest_model->insertData('hasil_periksa', $fuzzy);
            }
        }
    }

    private function proses_conjunction($id)
    {
        //mengambil hasil derajat keanggotaan/nilai fuzzy berdasarkan himpunan fuzzy dan variabel fuzzy
        $get_hasil_fuzzy = $this->Keanggotaan_model->hasil_keanggotaan2($id);
        //inisialisasi
        $kering = '';
        $normal = '';
        $berminyak = '';

        $komedo_ringan = '';
        $komedo_sedang = '';
        $komedo_berat = '';

        $pustul_ringan = '';
        $pustul_sedang = '';
        $pustul_berat = '';

        $tidak_nodul = '';
        $nodul_sedang = '';
        $nodul_berat = '';

        foreach ($get_hasil_fuzzy as $val) {
            //kelompok 1 jenis_kulit
            if ($val['id_variabel'] == 1) {
                if ($val['keterangan'] == 'KERING') {
                    //menyimpan derajat keanggotaan/mem_func pada variabel baru sesuai dengan himpunan yg tepat
                    $kering = $val['mem_func'];
                } elseif ($val['keterangan'] == 'NORMAL') {
                    $normal = $val['mem_func'];
                } elseif ($val['keterangan'] == 'BERMINYAK') {
                    $berminyak = $val['mem_func'];
                }
            }

            //kelompok 2 komedo
            elseif ($val['id_variabel'] == 2) {
                if ($val['keterangan'] == 'KOMEDO RINGAN') {
                    $komedo_ringan = $val['mem_func'];
                } elseif ($val['keterangan'] == 'KOMEDO SEDANG') {
                    $komedo_sedang = $val['mem_func'];
                } elseif ($val['keterangan'] == 'KOMEDO BERAT') {
                    $komedo_berat = $val['mem_func'];
                }
            }

            //kelompok 3 pustul
            elseif ($val['id_variabel'] == 3) {
                if ($val['keterangan'] == 'PUSTUL RINGAN') {
                    $pustul_ringan = $val['mem_func'];
                } elseif ($val['keterangan'] == 'PUSTUL SEDANG') {
                    $pustul_sedang = $val['mem_func'];
                } elseif ($val['keterangan'] == 'PUSTUL BERAT') {
                    $pustul_berat = $val['mem_func'];
                }
            }

            //kelompok  4 nodul
            elseif ($val['id_variabel'] == 4) {
                if ($val['keterangan'] == 'TIDAK NODUL') {
                    $tidak_nodul = $val['mem_func'];
                } elseif ($val['keterangan'] == 'NODUL SEDANG') {
                    $nodul_sedang = $val['mem_func'];
                } elseif ($val['keterangan'] == 'NODUL BERAT') {
                    $nodul_berat = $val['mem_func'];
                }
            }
        }
        //mengambil seluruh rule
        $get_all_rule = $this->Trytest_model->getAllData('rule');
        $linguistic = array();
        $disjunction = array();
        //proses mencari rule yang sesuai 
        foreach ($get_all_rule->result_array() as $rule) {
            //mencocokan dgn seluruh rule yang ada dan menyimpan derajat keanggotaan/mem_func berdasarkan variabel yang sesuai 
            if ($rule['jenis_kulit'] == 'KERING') {
                $jenis_kulit = $kering;
            } elseif ($rule['jenis_kulit'] == 'NORMAL') {
                $jenis_kulit = $normal;
            } elseif ($rule['jenis_kulit'] == 'BERMINYAK') {
                $jenis_kulit = $berminyak;
            }

            if ($rule['komedo'] == 'KOMEDO RINGAN') {
                $komedo = $komedo_ringan;
            } elseif ($rule['komedo'] == 'KOMEDO SEDANG') {
                $komedo = $komedo_sedang;
            } elseif ($rule['komedo'] == 'KOMEDO BERAT') {
                $komedo = $komedo_berat;
            }

            if ($rule['pustul'] == 'PUSTUL RINGAN') {
                $pustul = $pustul_ringan;
            } elseif ($rule['pustul'] == 'PUSTUL SEDANG') {
                $pustul = $pustul_sedang;
            } elseif ($rule['pustul'] == 'PUSTUL BERAT') {
                $pustul = $pustul_berat;
            }

            if ($rule['nodul'] == 'TIDAK NODUL') {
                $nodul = $tidak_nodul;
            } elseif ($rule['nodul'] == 'NODUL SEDANG') {
                $nodul = $nodul_sedang;
            } elseif ($rule['nodul'] == 'NODUL BERAT') {
                $nodul = $nodul_berat;
            }

            if ($jenis_kulit != '' && $komedo != '' && $pustul != '' && $nodul != '') {
                //memilih derajat keanggotaan minimum dari nilai-nilai linguistik yang dihubungkan oleh ∩ 
                $bobot = min($jenis_kulit, $komedo, $pustul, $nodul);
                //cetak clipping pada fungsi keanggotaan untuk penentuan tingkat keparahan acne
                $linguistic[] = array(
                    'rule' => "JENIS KULIT " . $rule['jenis_kulit'] . "(" . $jenis_kulit . ") , " . $rule['komedo'] . "(" . $komedo . ") , " . $rule['pustul'] . "(" . $pustul . ") , dan " . $rule['nodul'] . "(" . $nodul . ") THEN Tingkat Keparahan Acne adalah " . $rule['tingkat_acne'] . "(" . $bobot . ")",
                );
                //menyimpan hasil tingkat acne berdasarkan bobot minimum
                $disjunction[] = array(
                    'tingkat_acne' => $rule['tingkat_acne'],
                    'bobot' => $bobot,
                );
            }
        }
        return $rule = array('linguistic' => $linguistic, 'disjunction' => $disjunction);
    }

    private function proses_disjunction($disjunction)
    {
        //wadah untuk hasil jumlah berdasarkan tingkat acne yang terkumpul
        $risiko_ringan = 0;
        $risiko_sedang = 0;
        $risiko_berat = 0;
        //wadah untuk menyimpan kumpulan nilai derajat keanggotaan berdasarkan tingkat acne
        $res_ringan = array();
        $res_sedang = array();
        $res_berat = array();
        //proses disjunction menghitung jumlah berdasarkan tingkat acne
        //$key sebagai index array,  => $value nilai/isi dr index
        foreach ($disjunction as $key => $val) {
            if ($val['tingkat_acne'] == 'RINGAN') {
                $risiko_ringan = $risiko_ringan + 1;
                $res_ringan[] = $val['bobot'];
            } elseif ($val['tingkat_acne'] == 'SEDANG') {
                $risiko_sedang = $risiko_sedang + 1;
                $res_sedang[] = $val['bobot'];
            } elseif ($val['tingkat_acne'] == 'BERAT') {
                $risiko_berat = $risiko_berat + 1;
                $res_berat[] = $val['bobot'];
            }
        }
        //print disjunction
        //mengubah array menjadi string atau text atau kalimat
        $disj_ringan = implode(' <b>&#8746;</b> RINGAN ', $res_ringan);
        $disj_sedang = implode(' <b>&#8746;</b> SEDANG ', $res_sedang);
        $disj_berat = implode(' <b>&#8746;</b> BERAT ', $res_berat);

        $string_ringan = '';
        $string_sedang = '';
        $string_berat = '';
        //memilih derajat maksimum dari seluruh tingkat acne yang dihubungkan oleh ∪ (gabungan)
        //empty digunakan untuk memeriksa apakah suatu variabel kosong atau tidak, mengembalikan nilai salah jika variabel ada dan tidak kosong, jika tidak maka mengembalikan nilai benar
        if ($risiko_ringan != 0 && empty($res_ringan) == FALSE) {
            $max_ringan = max($res_ringan);
            $string_ringan = "Tingkat keparahan acne RINGAN " . $disj_ringan . "<br> -> Nilai MAX untuk Prediksi tingkat keparahan acne <b>RINGAN</b> = " . $max_ringan . "<br>";
        } else {
            $max_ringan = 0;
        }
        if ($risiko_sedang != 0 && empty($res_sedang) == FALSE) {
            $max_sedang = max($res_sedang);
            $string_sedang = "Tingkat keparahan acne SEDANG " . $disj_sedang . "<br> -> Nilai MAX untuk Prediksi tingkat keparahan acne <b>SEDANG</b> = " . $max_sedang . "<br>";
        } else {
            $max_sedang = 0;
        }
        if ($risiko_berat != 0 && empty($res_berat) == FALSE) {
            $max_berat = max($res_berat);
            $string_berat = "Tingkat keparahan acne BERAT " . $disj_berat . "<br> -> Nilai MAX untuk Prediksi tingkat keparahan acne <b>BERAT</b> = " . $max_berat . "<br>";
        } else {
            $max_berat = 0;
        }

        return $string_max = array(
            'string_ringan' => $string_ringan,
            'string_sedang' => $string_sedang,
            'string_berat' => $string_berat,
            'jml_ringan'    => $risiko_ringan,
            'jml_sedang'    => $risiko_sedang,
            'jml_berat'    => $risiko_berat,
            'max_ringan'    => $max_ringan,
            'max_sedang'    => $max_sedang,
            'max_berat'    => $max_berat
        );
    }

    private function proses_defuzzifikasi($ringan, $sedang, $berat)
    {
        //ambil data tingkat acne
        $data_diagnosa = $this->Trytest_model->getAllData('diagnosa');

        $konsekuen = array($ringan, $sedang, $berat);
        $def = array();
        //data tingkat acne & nilai Z score hasil kali dari score * max tingkat acne
        //$key sebagai index array,  => $value nilai/isi dr index
        foreach ($data_diagnosa->result_array() as $key => $value) {
            // [] untuk index array saat looping
            $def[] = array(
                'tingkat_acne' => $value['nama_diagnosa'],
                'score' => $value['score'],
                'z_score' => $value['score'] * $konsekuen[$key]
            );
        }
        return $def;
    }

    private function proses_pemilihanobat($id)
    {
        //panggil seluruh data hasil pasien
        $get_hasil = $this->Trytest_model->get_detail('hasil', 'id_data', $id);

        $cek_kondisi = $get_hasil['kondisi'];
        $tingkat_acne = $get_hasil['id_diagnosa'];

        $kondisi = 0;
        if ($cek_kondisi == 'hamil/menyusui') {
            $kondisi = 1;
        }

        if ($tingkat_acne == '1') {
            //panggil seluruh data obat
            $get_obat = $this->Keanggotaan_model->getAllObat($kondisi, 'ringan');

            $lainnya = 'Terapi bantuan lainnya: Ekstraksi komedo. <br> Terapi pemeliharaan (maintance) dimulai dari pembersihan wajah menggunakan sabun minimal dua kali sehari dan mengaplikasikan sunscreen yang hipoalergenik dan non komedogenik. ';
        } elseif ($tingkat_acne == '2') {
            $get_obat = $this->Keanggotaan_model->getAllObat($kondisi, 'sedang');

            $lainnya = 'Terapi bantuan lainnya: Laser atau light therapy atau photodynamic therapy. <br> Terapi pemeliharaan (maintance) dimulai dari pembersihan wajah menggunakan sabun minimal dua kali sehari dan mengaplikasikan sunscreen yang hipoalergenik dan non komedogenik. <br><br> Catatan: Jangan digunakan obat diatas jika Anda memiliki alergi terhadap obat tersebut! Jika terjadi reaksi alergi obat, efek samping serius atau overdosis setelah mengonsumsi, segera hubungi dokter.';
        } elseif ($tingkat_acne == '3') {
            $get_obat = $this->Keanggotaan_model->getAllObat($kondisi, 'berat');

            $lainnya = 'Terapi bantuan lainnya: Ekstraksi komedo, laser atau light therapy atau photodynamic therapy. <br> Terapi pemeliharaan (maintance) dimulai dari pembersihan wajah menggunakan sabun minimal dua kali sehari dan mengaplikasikan sunscreen yang hipoalergenik dan non komedogenik. <br><br> Catatan: Jangan digunakan obat diatas jika Anda memiliki alergi terhadap obat tersebut! Jika terjadi reaksi alergi obat, efek samping serius atau overdosis setelah mengonsumsi, segera hubungi dokter.';
        }

        $oral = array();
        $topical = array();
        //mencari obat
        foreach ($get_obat as $obat) {
            if ($obat['terapi'] == 'oral') {
                //memasukkan data obat ke baris baru array oral dan topical
                array_push($oral, $obat['nama_obat'], $obat['keterangan']);
            } else {
                array_push($topical, $obat['nama_obat'], $obat['keterangan']);
            }
        };

        $data['oral'] = $oral;
        $data['topical'] = $topical;
        $data['lainnya'] = $lainnya;
        return $data;
    }
}
