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
        <!-- <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <img src="asset/gambar/IMG_2232.jpg" style="width:560px; height:670px;" alt="stylesheet">
                </div>
            </div>
        </div> -->
        <!-- <h5 class=" card-header bg-info text-white">Rekomendasi Treatment Kulit Wajah</h5> -->

        <div class="card p-3 mt-3 mb-3 rounded-lg">
            <div class="card-body">
                <!-- <?php if (validation_errors()) : ?>
                    <div class="alert alert-danger" role="alert">
                        A simple danger alert—check it out!
                        <?= validation_errors(); ?>
                    </div>
                <?php endif; ?> -->
                <form method="post" action="<?= base_url('Trytest/tambah'); ?>">
                    <!-- <input type="hidden" name="id_pasien" value=" <?= $user['id_pasien']; ?> "> -->
                    <div class="form-group">
                        <label for="id_pasien">Id Pasien</label>
                        <input type="text" name="id_pasien" class="form-control" id="id_pasien" value=" <?= $this->session->userdata('id_pasien'); ?> " readonly>
                    </div>
                    <div class="form-group">
                        <label for="nama_pasien">Nama Lengkap</label>
                        <input type="text" name="nama_pasien" class="form-control" id="name" value=" <?= $this->session->userdata('nama_pasien'); ?> " readonly>
                    </div>
                    <div class="form-group">
                        <label for="jenis_kelamin">Jenis Kelamin</label>
                        <input type="text" name="jenis_kelamin" class="form-control" id="jenis_kelamin" value=" <?= $this->session->userdata('jenis_kelamin'); ?> " readonly>
                    </div>
                    <div class="form-group">
                        <label for="kondisi">Kondisi</label>
                        <select name="kondisi" class="form-control" id="kondisi">
                            <option selected disabled value="">Choose...</option>
                            <option value="tidak hamil/menyusui">Tidak hamil/menyusui</option>
                            <option value="hamil/menyusui">Sedang hamil/menyusui</option>
                        </select>
                        <?= form_error('kondisi', '<small class="text-danger">', '</small>');  ?>
                    </div>
                    <div class="form-group">
                        <label for="jenis_kulit">Jenis kulit wajah</label>
                        <select class="form-control" id="jenis_kulit" name="jenis_kulit">
                            <option selected disabled value="">Choose...</option>
                            <option value="0.1">Kulit terasa kencang setelah mencuci muka dan terlihat kering</option>
                            <option value="0.3">Hanya kulit bagian T-Zone terasa lebih berminyak</option>
                            <option value="0.5">Kulit terasa berminyak dan terlihat mengkilap</option>
                        </select>
                        <?= form_error('jenis_kulit', '<small class="text-danger">', '</small>');  ?>
                    </div>
                    <!-- Komedo -->
                    <div class="form-group">
                        <label for="komedo">Banyaknya Komedo pada wajah</label>
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-outline-info btn-sm" data-toggle="modal" data-target="#modalKomedo">
                            View details <i class="fa fa-chevron-circle-right" aria-hidden="true"></i>
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="modalKomedo" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Whitehead dan Blackhead</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="mb-2">
                                            <img src="asset/gambar/whitehead3.png" alt="" class="gambar">
                                            <img src="asset/gambar/blackhead3.jpg" alt="" class="gambar">
                                        </div>
                                        <div style="text-align:justify;">
                                            Komedo merupakan bintik-bintik yang muncul di permukaan pori-pori kulit, dan
                                            merupakan awal mula munculnya jerawat. Komedo memiliki 2
                                            jenis, yaitu <b>whitehead</b> dan <b>blackhead</b>.
                                            Jika permukaan kulit tertutup oleh lapisan luar, komedo ini disebut dengan
                                            <b>whitehead</b>
                                            (komedo putih) yang belum teroksidasi udara. Ada juga komedo yang
                                            permukaannya terbuka dan terpapar oleh udara sehingga berubah warna menjadi
                                            coklat atau kehitaman, dalam hal ini disebut sebagai <b>blackhead</b>
                                            (komedo
                                            hitam). Kemunculan komedo jarang dibarengi dengan rasa nyeri, kecuali
                                            bila komedo mengalami infeksi.
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Option komedo -->
                        <select class="form-control" id="komedo" name="komedo">
                            <!-- <option selected disabled value="">Choose...</option>
                            <option value="15">Hanya terdapat blackhead di sekitar wajah</option>
                            <option value="50">Terdapat beberapa blackhead dan whitehead di sekitar wajah</option>
                            <option value="100">Terdapat banyak blackhead dan whitehead yang menyeluruh pada wajah</option> -->
                            <option selected disabled value="">Choose...</option>
                            <option value="15">Sangat sedikit Whitehead atau Blackhead hingga tidak terlihat</option>
                            <option value="30">Sedikit Whitehead atau Blackhead yang terlihat</option>
                            <option value="60">Cukup banyak Whitehead dan Blackhead yang terlihat</option>
                            <option value="80">Banyak Whitehead dan Blackhead yang hampir menyeluruh pada wajah</option>
                            <option value="110">Terlihat sangat banyak Whitehead dan Blackhead yang menyeluruh pada wajah</option>

                        </select>
                        <?= form_error('komedo', '<small class="text-danger">', '</small>');  ?>
                    </div>

                    <!-- Pustule -->
                    <div class="form-group">
                        <label for="pustul">Banyaknya Papula dan Pustula pada wajah</label>
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-outline-info btn-sm" data-toggle="modal" data-target="#modalPustul">
                            View details <i class="fa fa-chevron-circle-right" aria-hidden="true"></i>
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="modalPustul" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Papula dan Pustula</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="mb-2">
                                            <img src="asset/gambar/pustul2.jpg" alt="" class="gambar">
                                            <img src="asset/gambar/pustul.png" alt="" class="gambar">
                                        </div>
                                        <div style="text-align:justify;">
                                            <b>Papula</b> biasanya muncul ketika komedo,
                                            baik blackhead maupun whitehead dibiarkan begitu saja tanpa penanganan.
                                            Papula muncul di bawah permukaan kulit, jika diraba terasa seperti benjolan
                                            kecil yang padat dan terasa nyeri. Biasanya kulit disekitar papula tampak
                                            bengkak kemerahan, namun tidak memiliki titik nanah pada puncak jerawat.
                                            <br>
                                            <b>Pustula</b> merupakan jenis jerawat lanjutan dari papula yang memiliki
                                            ukuran yang lebih besar dan lunak. Biasanya pada jenis jerawat pustula,
                                            bagian dasarnya berwarna kemerahan, sementara puncaknya berwarna putih atau
                                            kekuningan dan tampak lebih terangkat karena berisi nanah.
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Option Pustule -->
                        <input type="number" max="1000" step="0" min="0" class="form-control" id="pustul" name="pustul">
                        <?= form_error('pustul', '<small class="text-danger">', '</small>');  ?>

                        <!-- <select class="form-control" id="pustul" name="pustul">
                            <option selected disabled value="">Choose...</option>
                            <option value="0.3">Hanya terdapat beberapa bintil merah di sekitar wajah dengan jumlah kurang
                                dari 15
                            </option>
                            <option value="0.6">Terdapat bintil merah yang berisi nanah di sekitar wajah dengan jumlah 15-50
                            </option>
                            <option value="0.9">Terdapat banyak bintil merah yang berisi nanah yang menyeluruh pada wajah dengan jumlah
                                lebih dari 50
                            </option>
                        </select> -->

                    </div>

                    <!-- Kista -->
                    <div class="form-group">
                        <label for="nodul">Banyaknya Nodul pada wajah</label>
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-outline-info btn-sm" data-toggle="modal" data-target="#modalKista">
                            View details <i class="fa fa-chevron-circle-right" aria-hidden="true"></i>
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="modalKista" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Nodul dan Kistik</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="mb-2">
                                            <img src="asset/gambar/kistik.jpg" alt="" class="gambar">
                                            <img src="asset/gambar/kista1.jpg" alt="" class="gambar">
                                        </div>
                                        <div style="text-align:justify;">
                                            <b>Nodul</b> merupakan jenis jerawat yang muncul di bawah permukaan kulit.
                                            Dibandingkan dengan pustula, nodul berukuran lebih besar kisaran 0,5-1cm, keras, disertai
                                            peradangan dan menimbulkan rasa nyeri. Pada nodul infeksi terjadi di bawah
                                            permukaan kulit yang menyebabkan pori-pori kulit memerah dan membengkak.
                                            <br> <b>Kistik</b> sering disebut dengan jerawat batu, kistik memiliki
                                            ukuran yang lebih besar menyerupai bisul dan merupakan bentuk yang lebih
                                            berat dibandingkan
                                            dengan nodul serta terasa nyeri apabila disentuh, serta berisi nanah dan
                                            darah. Hal ini terjadi karena
                                            peradangan yang lebih hebat lagi dan
                                            semakin meluas. Sehingga tidak bisa diperbaiki hanya dengan perawatan sendiri dirumah, disarankan untuk melakukan konsultasi langsung dengan dokter kulit.
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Option nodul -->
                        <input type="number" max="1000" step="0" min="0" class="form-control" id="nodul" name="nodul">
                        <?= form_error('nodul', '<small class="text-danger">', '</small>');  ?>
                        <!-- <select class="form-control" id="nodul" name="nodul">
                            <option selected disabled value="">Choose...</option>
                            <option value="0">Tidak ada</option>
                            <option value="0.5">Terdapat bintil merah yang lebih besar dengan ukuran 0,5-1cm di sekitar wajah dengan jumlah kurang dari 5
                            </option>
                            <option value="1.0">Terdapat banyak bintil merah yang lebih besar dengan ukuran 0,5-1cm pada wajah dengan jumlah
                                lebih dari 5 </option>
                        </select> -->

                    </div>
                    <input type="submit" class="btn btn-lg btn-block" style="background-color:#CB8583; color: white;" value="Lihat Hasil">
                    <!-- <button type="submit" name="" href="<?= base_url(); ?>Output/index" class="btn btn-lg float-right" style="background-color:#CB8583; color: white;">Lihat
                        Hasil</button> -->
                </form>
            </div>

        </div>
    </div>