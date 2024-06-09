<?php 
include "../db/koneksi.php";

if (isset($_POST["submit"]))  {
    if (!empty($_POST["username"]) && !empty($_POST["email"]) && !empty($_POST["password"]) && !empty($_POST["confirm"] ) && !empty($_POST["nama"])&& !empty($_POST["alamat"] )) {
        if ($_POST["password"] != $_POST["confirm"]) {
            echo "<script>
                
            alert('Password Tidak Sama');
            history.back();
            
            </script>";
        }
        else {
            if (add_user($_POST) > 0 ) {
                echo "<script>
                    alert('Akun anda berhasil dibuat');
                    window.location.href = 'login.php';
                </script>";
            } else {
                echo "<script>
                    alert('Data Gagal Ditambahkan');
                </script>";
            }
        }
    
    } else {
        echo "<script>
            alert('Form tidak lengkap. Mohon isi semua field.');
            history.back();
        </script>";
    }
}
?>




<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Techno Mart</title>
    <link rel="stylesheet" href="../css/login.css">
    
</head>

<body>
    <div class="container">
        <div class="login">
            <form method="post">
                <h1>Register</h1>
                <hr>
                <p>Daftar Ke Techno Mart</p>
                <label for="">Nama Lengkap</label>
                <input type="text" name="nama" placeholder="Masukkan Nama Lengkap">
                <label for="">Username</label>
                <input type="text" name="username" placeholder="Masukkan Username">
                <label for="">Alamat</label>
                <input type="text" name="alamat" placeholder="Masukkan Alamat Lengkap">
                <label for="">Email</label>
                <input type="email" name="email" placeholder="Masukkan Email">
                <label for="">Password</label>
                <input type="password" name="password" placeholder="Masukkan Password">
                <label for="">Confirm Password</label>
                <input type="password" name="confirm" placeholder="Masukkan Ulang Password">
                <button name="submit">Register</button>
                <p>
                    <a href="login.php">Sudah Punya Akun?</a>
                </p>
            </form>
        </div>
        <div class="left">
            <img src="../assets/icon/shop.png" alt="">
        </div>
    </div>
</body>

</html>