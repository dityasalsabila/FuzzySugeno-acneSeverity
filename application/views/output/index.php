<body style="font-family: 'Montserrat', sans-serif">
    <header>
        <nav class="navbar navbar-expand-lg navbar-light " style="background-color:#E7C0B3;">
            <span class="navbar-brand mb-0 h1"><i class="fa fa-user-md" aria-hidden="true"></i> Sistem
                Pakar</span>
            <!-- <a class="navbar-brand" href="#"><i class="fa fa-medkit" aria-hidden="true"></i>Navbar</a> -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse " id="navbarNav">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href=" <?= base_url(); ?> ">Home <span class="sr-only">(current)</span></a>
                    </li>
                </ul>
                <form class="form-inline m-0">
                    <a class="btn btn-outline-dark" href="<?= base_url('Login/logout'); ?>"><i class="fa fa-sign-out" aria-hidden="true"></i> Log out</a>
                </form>
            </div>
        </nav>
    </header>
    <div class="container" style="font-family: 'Montserrat', sans-serif">
        <div class="card p-3 mt-3 mb-3 rounded-lg">
            <h4 class="card-header text-center">Hasil</h4>
            <div class="card-body">

                <form method="post">
                    <div class="form-group row">
                        <label for="name" class="col-sm-2 col-form-label">Nama Lengkap</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" id="name" name="name" rows="1" readonly><?= $this->session->userdata('nama_pasien'); ?></textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="jenis_kelamin" class="col-sm-2 col-form-label">Jenis kelamin</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" id="jenis_kelamin" name="jenis_kelamin" rows="1" readonly><?= $this->session->userdata('jenis_kelamin'); ?></textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="kondisi" class="col-sm-2 col-form-label">Kondisi</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" id="kondisi" name="kondisi" rows="1" readonly><?= $kondisi; ?></textarea>
                        </div>
                    </div>
                </form>
            </div>

            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard-pulse" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M10 1.5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-1Zm-5 0A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5v1A1.5 1.5 0 0 1 9.5 4h-3A1.5 1.5 0 0 1 5 2.5v-1Zm-2 0h1v1H3a1 1 0 0 0-1 1V14a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V3.5a1 1 0 0 0-1-1h-1v-1h1a2 2 0 0 1 2 2V14a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V3.5a2 2 0 0 1 2-2Zm6.979 3.856a.5.5 0 0 0-.968.04L7.92 10.49l-.94-3.135a.5.5 0 0 0-.895-.133L4.232 10H3.5a.5.5 0 0 0 0 1h1a.5.5 0 0 0 .416-.223l1.41-2.115 1.195 3.982a.5.5 0 0 0 .968-.04L9.58 7.51l.94 3.135A.5.5 0 0 0 11 11h1.5a.5.5 0 0 0 0-1h-1.128L9.979 5.356Z" />
                        </svg> Tingkat Keparahan Acne</h5>
                    <p class="card-text"> Dinyatakan terdeteksi memiliki tingkat keparahan acne
                        <?php echo $max_z_score ?>
                    </p>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-outline-info btn-sm" data-toggle="modal" data-target="#staticBackdrop">
                        Perhitungan Fuzzy Sugeno <i class="fa fa-chevron-circle-right" aria-hidden="true"></i>
                    </button>

                    <!-- Modal -->
                    <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Proses Perhitungan Fuzzy Sugeno</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">1. Proses Fuzzyfikasi</h5>
                                    </div>
                                    <div class="panel-body">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th class="col-md-1">No</th>
                                                    <th class="col-md-2">Variabel</th>
                                                    <th class="col-md-3">Keterangan</th>
                                                    <th class="col-md-3">Derajat Keanggotaan</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
                                                $no = 1;
                                                foreach ($fuzzyfikasi as $val) {; ?>
                                                    <tr>
                                                        <td><?php echo $no++; ?></td>
                                                        <td><?php echo $val['nama_variabel']; ?></td>
                                                        <td><?php echo $val['keterangan']; ?></td>
                                                        <td><?php echo $val['mem_func']; ?></td>
                                                    </tr>
                                                <?php } ?>
                                            </tbody>

                                        </table>
                                    </div>
                                    <div class="panel-heading">
                                        <h5 class="panel-title">2. Proses Inferensi <br>a) Conjunction</h5>
                                    </div>
                                    <div class="panel-body">
                                        <table class="table table-hover">
                                            <tbody>
                                                <?php $no = 1;
                                                foreach ($conjunction as $val) {; ?>
                                                    <tr>
                                                        <td><?php echo $no++; ?></td>
                                                        <td><?php echo $val['rule']; ?></td>
                                                    </tr>
                                                <?php } ?>
                                            </tbody>
                                        </table>
                                        <div class="panel-heading">
                                            <h6>Jumlah Rule = <?php echo $jum_rule; ?></h6>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="panel-heading">
                                        <h5 class="panel-title">b) Disjunction</h5>
                                    </div>
                                    <div class="panel-body">
                                        <p>
                                            Jumlah per masing - masing Tingkat Keparahan Acne : <br>
                                            Ambil nilai Max dari Tingkat Keparahan Acne yang sama (berdasarkan nilai - nilai linguistik yang dihubungkan)
                                        </p>
                                        <p>1. Tingkat Risiko <b>Ringan</b> = <?php echo $jml_ringan; ?></p>
                                        <?php if (!empty($ringan)) {
                                            echo $ringan;
                                        } ?>
                                        <p>2. Tingkat Risiko <b>Sedang</b> = <?php echo $jml_sedang; ?></p>
                                        <?php if (!empty($sedang)) {
                                            echo $sedang;
                                        } ?>
                                        <p>3. Tingkat Risiko <b>Berat</b> = <?php echo $jml_berat; ?></p>
                                        <?php if (!empty($berat)) {
                                            echo $berat;
                                        } ?>

                                    </div>
                                    <br>
                                    <div class="panel-heading">
                                        <h5 class="panel-title">3. Proses Defuzzyfikasi</h5>
                                    </div>
                                    <div class="panel-body">
                                        <p>Masing-masing nilai <b>Z Score</b> berdasarkan masing-masing nilai MAX tingkat risiko</p>
                                    </div>
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>No.</th>
                                                <th>Tingkat Risiko</th>
                                                <th>Score</th>
                                                <th>Z Score</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php $no = 1;
                                            foreach ($defuzzifikasi as $val) {; ?>
                                                <tr>
                                                    <td><?php echo $no++; ?></td>
                                                    <td><?php echo $val['tingkat_acne']; ?></td>
                                                    <td><?php echo $val['score']; ?></td>
                                                    <td><?php echo $val['z_score']; ?></td>
                                                </tr>
                                            <?php } ?>
                                        </tbody>
                                    </table>
                                    <p>Z Score Total = ( <?php echo $defuzzifikasi[0]['z_score'] . '+' . $defuzzifikasi[1]['z_score'] . '+' . $defuzzifikasi[2]['z_score'] . ') / (' . $max_ringan . '+' . $max_sedang . '+' . $max_berat . ')' ?></p>
                                    <p><b>Z Score Total = <?php echo $z_score_total; ?></b></p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag-plus" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M8 7.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V12a.5.5 0 0 1-1 0v-1.5H6a.5.5 0 0 1 0-1h1.5V8a.5.5 0 0 1 .5-.5z" />
                            <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z" />
                        </svg> Perawatan yang direkomendasikan</h5>

                    <p class="card-text" style="text-align:justify;">
                        <?php
                        if ($topical) {
                            echo '<b>Topical</b> <br>';
                            foreach ($topical as $t) {
                                echo  $t . '<br>';
                            }
                        } ?> <br>
                        <?php if ($oral) {
                            echo '<b>Oral</b> <br>';
                            foreach ($oral as $o) {
                                echo $o . '<br>';
                            }
                        } ?>

                        <?php echo '<br><br>' . $lainnya;
                        ?>

                    </p>
                    <!-- <h3><span class="badge badge-pill badge-info">Info</span></h3> -->
                </div>
            </div>


            <br>
            <p><a href=" <?= base_url(); ?>Trytest/index" class="btn btn-lg float-right" style="background-color:#CB8583; color: white;">Coba Ulang</a></p>
        </div>

    </div>