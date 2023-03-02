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
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href=" <?= base_url(); ?> ">Home <span class="sr-only">(current)</span></a>
                    </li>
            </div>
        </nav>
    </header>
    <div class="container" style="font-family: 'Montserrat', sans-serif">
        <div class="card o-hidden border-0 shadow-lg my-5 p-3 mt-3 mb-3 rounded-lg mx-auto" style="max-width: 38rem">
            <h5 class="card-header text-center">Create an Account!</h5>
            <div class="card-body">

                <form method="post" action="<?= base_url(); ?>Login/signin">
                    <div class="form-group">
                        <label for="name">Nama Lengkap</label>
                        <input type="text" class="form-control" id="name" name="name" value="<?= set_value('name'); ?>">
                        <?= form_error('name', '<small class="text-danger">', '</small>');  ?>
                    </div>
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username" name="username" value="<?= set_value('username'); ?>">
                        <?= form_error('username', '<small class="text-danger">', '</small>');  ?>
                        <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" name="password">
                        <?= form_error('password', '<small class="text-danger">', '</small>');  ?>
                    </div>
                    <div class="form-group">
                        <label for="jenis_kelamin">Jenis Kelamin</label>
                        <input type="text" class="form-control" id="jenis_kelamin" name="jenis_kelamin" value="<?= set_value('jenis_kelamin'); ?>">
                        <?= form_error('jenis_kelamin', '<small class="text-danger">', '</small>');  ?>
                    </div>
                    <!-- <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                        <label class="form-check-label" for="exampleCheck1">Check me out</label>
                    </div> -->
                    <button href="" type="submit" class="btn btn-block" style="background-color:#CB8583; color:white">Sign up</button>
                    <hr>
                    <div class="text-center">
                        <a href=" <?= base_url(); ?>Login/index" id="" class="small">Have an Account? Log in.</a>
                    </div>
                </form>
            </div>
        </div>
    </div>