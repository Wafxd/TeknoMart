<?php 
session_start();
include "../db/koneksi.php";

if (isset($_SESSION['id_user']) && isset($_SESSION['username'])) {
    $id_user = $_SESSION['id_user'];
    $username = $_SESSION["username"];
    $nama = query("SELECT * FROM tb_user WHERE id_user = '$id_user'")[0];
} else {
    $id_user = null;
    $username = null;
    $nama = null;
}

if (isset($_POST["submit"])) {
    if (!empty($_POST["nama"]) && !empty($_POST["telp"]) && !empty($_POST["alamat"])) {
        $ubah = ubah($id_user, $_POST);
        if ($ubah) {
            echo "<script>
                alert('Ubah Profile sukses'); 
                window.location.href = '../index.php';
            </script>";
        } else {
            echo "<script>
                alert('Ubah Profile gagal'); 
                window.location.href = '../index.php';
            </script>";
        }
    } else {
        echo "<script>
            alert('Harap isi semua form');
            history.back();
        </script>";
    }
}


?>

<!doctype html>
<html lang="en">
  <head>
  	<title>Login 05</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="../css/profile.css">

	</head>
	<body style="background-color:#6fc3ff">
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-7 col-lg-5">
					<div class="wrap">
						<div class="login-wrap p-4 p-md-5">
			      	<div class="d-flex">
			      		<div class="w-100">
			      			<h2 class="mb-4">Edit Profile</h2>
			      		</div>
                
			      	</div>
							<form method="post" >
			      		<div class="form-group mt-3 pb-2">
			      			<input type="text" name="nama" class="form-control" value="<?= $nama["nama"] ?>" required>
			      			<label class="form-control-placeholder" style="color:#0095ff" for="username">Username</label>
			      		</div>
                <div class="form-group mt-4 pb-2" >
			      			<input type="text" name="telp" class="form-control" value="<?= $nama["telp"] ?>" required>
			      			<label class="form-control-placeholder" style="color:#0095ff" for="telp">No Handphone</label>
			      		</div>
                <div class="form-group mt-4">
			      			<input type="text" name="alamat" class="form-control" value="<?= $nama["alamat"] ?>" required>
			      			<label class="form-control-placeholder" style="color:#0095ff" for="alamat">Alamat</label>
			      		</div>
		            
		            <div class="form-group">
		            	<button type="submit" name="submit" class="form-control btn rounded submit px-3" style="background-color:#0095ff ; color: white">Ubah</button>
		            </div>
                <div class="form-group d-md-flex">
									<div class="w-50">
										<a href="../index.php">< Ke Halaman Utama</a>
									</div>
                  <div class="w-50 text-md-right">
										<a href="email.php" style="color: red">Ubah Password</a>
									</div>
		            </div>
		            
		          </form>
		        </div>
		      </div>
				</div>
			</div>
		</div>
	</section>

	<script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>

	</body>
</html>


