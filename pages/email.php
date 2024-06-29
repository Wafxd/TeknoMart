<?php 
session_start();
include "../db/koneksi.php";

if (isset($_POST["submit"])) {
  if (!empty($_POST["email"])) {
      $email = mysqli_real_escape_string($conn, $_POST["email"]);

      $query = "SELECT * FROM tb_user WHERE email = '$email'";
      $result = mysqli_query($conn, $query);

      if ($result && mysqli_num_rows($result) > 0) {
          // Email ditemukan, arahkan ke halaman ubah_pw.php
          echo "<script>
            alert('Email ditemukan. Silahkan lanjutkan untuk mengubah password.');
            window.location.href = 'ubah_pw.php?email=$email';
          </script>";
      } else {
          // Email tidak ditemukan
          echo "<script>
            alert('Email tidak terdaftar, silahkan coba lagi.');
            history.back();
          </script>";
      }
  } else {
      // Field email kosong
      echo "<script>
        alert('Silahkan masukkan email.');
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
			      			<h2 class="mb-4">Masukkan Email Anda Yang Terdaftar</h2>
			      		</div>
                
			      	</div>
							<form class="signin-form" method="post">
			      		<div class="form-group mt-3 pb-2">
			      			<input type="text" class="form-control" name="email" required>
			      			<label class="form-control-placeholder" style="color:#0095ff" for="email">Email</label>
			      		</div>
		            <div class="form-group">
		            	<button type="submit" name="submit" class="form-control btn rounded submit px-3" style="background-color:#0095ff ; color: white">Kirim</button>
		            </div>
                <div class="form-group d-md-flex">
									<div class="w-50">
										<a href="login.php">< Ke Halaman Login</a>
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