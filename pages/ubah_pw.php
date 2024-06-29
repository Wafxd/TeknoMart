<?php 
include '../db/koneksi.php';

$email = $_GET["email"];
if (isset($_POST["submit"])) {
  $password = $_POST["password"];
  $confirm = $_POST["confirm"];

  if ($password === $confirm) {
      $hashed_password = password_hash($password, PASSWORD_DEFAULT);
      $query = "UPDATE tb_user SET password = '$hashed_password' WHERE email = '$email'";
      $result = mysqli_query($conn, $query);

      if ($result) {
          echo "<script>
            alert('Password berhasil diubah');
            window.location.href = 'logout.php';
          </script>";
      } else {
          echo "<script>
            alert('Gagal mengubah password, silahkan coba lagi.');
          </script>";
      }
  } else {
      echo "<script>
        alert('Password dan konfirmasi password tidak cocok, silahkan coba lagi.');
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
			      			<h2 class="mb-4">Ubah Password Anda</h2>
			      		</div>
                
			      	</div>
							<form class="signin-form" method="post">
			      		<div class="form-group mt-3 pb-2">
			      			<input type="password" class="form-control" name="password" required>
			      			<label class="form-control-placeholder" style="color:#0095ff" for="password">Password Baru</label>
			      		</div>
                <div class="form-group mt-3 pb-2">
			      			<input type="password" class="form-control" name="confirm" required>
			      			<label class="form-control-placeholder" style="color:#0095ff" for="confirm">Masukkan Ulang Password Baru</label>
			      		</div>
		            <div class="form-group">
		            	<button type="submit" name="submit" class="form-control btn rounded submit px-3" style="background-color:#0095ff ; color: white">Kirim</button>
		            </div>
                <div class="form-group d-md-flex">
									<div class="w-50">
										<a href="../index.php">< Ke Halaman Utama</a>
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