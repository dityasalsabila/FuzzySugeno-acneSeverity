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
                        <!-- <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a> -->
                    </li>
            </div>
        </nav>
    </header>
    <div class="container" style="font-family: 'Montserrat', sans-serif">
        <div class="card o-hidden border-0 shadow-lg my-5 p-3 mt-3 mb-3 rounded-lg mx-auto" style="max-width: 38rem">
            <h5 class="card-header text-center">Login Page</h5>
            <div class="card-body">
                <?= $this->session->flashdata('message'); ?>

                <form class="" method="post" action="<?= base_url('Login'); ?>">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username" name="username" value="<?= set_value('username'); ?>">
                        <?= form_error('username', '<small class="text-danger">', '</small>');  ?>

                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" name="password">
                        <?= form_error('password', '<small class="text-danger">', '</small>');  ?>
                    </div>

                    <!-- <button href="" type="submit" class="btn btn-primary float-right">Login</button> -->
                    <button href="" type="submit" class="btn btn-block" style="background-color:#CB8583; color:white">Log in</button>

                    <hr>
                    <div class="text-center">
                        <a href=" <?= base_url(); ?>Login/signin" id="" class="small">Create an Account!</a>
                    </div>
                </form>
            </div>
        </div>
    </div>