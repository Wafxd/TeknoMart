<?php 
    include "../db/koneksi.php";
    $barang = query("SELECT * FROM tb_barang");

    if (isset($_POST["hapus"])) {
        $id_barang = $_POST["id_barang"];
        
        // Panggil fungsi hapus_produk dengan id_barang yang dipilih
        if (hapus_produk($id_barang)) {
            echo "<script>
                alert('Barang berhasil dihapus');
                window.location.href = 'edit_product.php'; 
            </script>";
        } else {
            echo "<script>
                alert('Gagal menghapus barang');
                history.back();
            </script>";
        }
    }

    if (isset($_POST["edit_produk"])) {
        // Periksa apakah data yang diperlukan tersedia dalam $_POST
        if (!empty($_POST["id_barang"]) && !empty($_POST["nama_barang"]) && !empty($_POST["kategori"]) && !empty($_POST["merk"]) && !empty($_POST["harga"]) && !empty($_POST["keterangan"])) {
            // Panggil fungsi edit_produk dan cek apakah berhasil
            if (edit_produk($_POST)) {
                echo "<script>
                    alert('Barang Berhasil Diedit');
                    window.location.href = 'index.php'; 
                </script>";
            } else {
                echo "<script>
                    alert('Gagal Mengedit Barang');
                    history.back();
                </script>";
            }
        } else {
            echo "<script>
                alert('Form Tidak Boleh Kosong');
                history.back();
            </script>";
        }
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Dashboard Tekno</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="../css/styles.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="index.php">Admin Tekno</a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
        <!-- Navbar Search-->
        <!-- Navbar-->
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Admin</a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#!">Logout</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">Core</div>
                        <a class="nav-link" href="index.php">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            Dashboard
                        </a>
                        <div class="sb-sidenav-menu-heading">Interface</div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayout">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            Pesanan
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="batal.php">Pesanan Dibatalkan</a>
                                <a class="nav-link" href="konfirmasi.php">Konfirmasi Pesanan</a>
                                <a class="nav-link" href="diproses.php">Untuk Dikirim</a>
                                <a class="nav-link" href="selesai.php">Pesanan Selesai</a>
                                <a class="nav-link" href="refund.php">Pengajuan Retur</a>
                            </nav>
                        </div>

                        <a class="nav-link active collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            Manajemen Produk
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse show" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="all_product.php">Lihat Semua Produk</a>
                                <a class="nav-link active" href="edit_product.php">Edit & Hapus Produk</a>
                                <a class="nav-link" href="add_product.php">Tambah Produk & Stok</a>
                            </nav>
                        </div>
                    
                        <div class="sb-sidenav-menu-heading">Addons</div>
                        <a class="nav-link" href="pendapatan.php">
                            <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                            Pemasukan
                        </a>
                        <a class="nav-link" href="pengeluaran.php">
                            <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                            Pengeluaran
                        </a>
                        <a class="nav-link" href="user.php">
                            <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                            Pelanggan
                        </a>
                    </div>
                </div>
            </nav>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Manajemen Produk</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item active">Edit Produk & Hapus Produk</li>
                    </ol>
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            Barang Di Techno Mart
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>Nama barang</th>
                                        <th>Harga</th>
                                        <th>Kategori</th>
                                        <th>Merk</th>
                                        <th>Stok</th>
                                        <th>Edit</th>
                                        <th>Hapus</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($barang as $brg) { ?>
                                    <tr>
                                        <td><?= $brg["nama_barang"] ?></td>
                                        <td><?= $brg["harga"] ?></td>
                                        <td><?= $brg["kategori"] ?></td>
                                        <td><?= $brg["merk"] ?></td>
                                        <td><?= $brg["stok"] ?></td>
                                        
                                        <td>
                                            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop<?= $brg['id_barang'] ?>">Edit</button>
                                            <div class="modal fade" id="staticBackdrop<?= $brg['id_barang'] ?>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                                <form method="post" enctype="multipart/form-data">
                                                    <div class="modal-dialog modal-dialog-scrollable">
                                                        <input type="hidden" name="id_barang" value="<?= $brg['id_barang'] ?>">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h1 class="modal-title fs-5" id="staticBackdropLabel">Form Edit Barang</h1>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="container">                                           
                                                                    <label for="nama_barang"><p style="font-size : 18px">Nama Barang : </p></label>
                                                                    <input type="text" name="nama_barang" class="form-control" value="<?= $brg["nama_barang"] ?>">
                
                                                                    <label for="kategori" class="pt-4"><p style="font-size : 18px">Kategori Barang : </p></label>
                                                                    <select name="kategori" class="form-control">
                                                                        <option value="Headphone">Headphone</option>
                                                                        <option value="Kipas Angin">Kipas Angin</option>
                                                                        <option value="Mesin Cuci">Mesin Cuci</option>
                                                                        <option value="Television">Television</option>
                                                                        <option value="Setrika">Setrika</option>
                                                                        <option value="Audio Speaker">Audio Speaker</option>
                                                                        <option value="Microphone">Microphone</option>
                                                                        <option value="Microwave">Microwave</option>
                                                                        <option value="Monitor">Monitor</option>
                                                                        <option value="Rice Cooker">Rice Cooker</option>
                                                                        <option value="Vacum Cleaner">Vacum Cleaner</option>
                                                                        <option value="Proyektor">Proyektor</option>
                                                                        <option value="Laptop">Laptop</option>
                                                                        <option value="Lampu">Lampu</option>
                                                                        <option value="Kulkas">Kulkas</option>
                                                                        <option value="AC">AC</option>
                                                                        <option value="Dispenser">Dispenser</option>
                                                                        <option value="Handphone">Handphone</option>
                                                                    </select>
                
                                                                    <label for="merk" class="pt-4"><p style="font-size : 18px">Merk Barang : </p></label>
                                                                    <select name="merk" class="form-control">
                                                                    <option value="Aqua Japan">Aqua Japan</option>
                                                                    <option value="Changhong">Changhong</option>
                                                                    <option value="Electrolux">Electrolux</option>
                                                                    <option value="Daikin">Daikin</option>
                                                                    <option value="Deon">Deon</option>
                                                                    <option value="Immersive">Immersive</option>
                                                                    <option value="Karcher">Karcher</option>
                                                                    <option value="Bosch">Bosch</option>
                                                                    <option value="Ecovacs">Ecovacs</option>
                                                                    <option value="Tineco">Tineco</option>
                                                                    <option value="Meval">Meval</option>
                                                                    <option value="Polytron">Polytron</option>
                                                                    <option value="Canon">Canon</option>
                                                                    <option value="Infinix">Infinix</option>
                                                                    <option value="Epson">Epson</option>
                                                                    <option value="SPC">SPC</option>
                                                                    <option value="Viewsonic">Viewsonic</option>
                                                                    <option value="Panasonic">Panasonic</option>
                                                                    <option value="LG">LG</option>
                                                                    <option value="Hitachi">Hitachi</option>
                                                                    <option value="Acer">Acer</option>
                                                                    <option value="Philips">Philips</option>
                                                                    <option value="BENQ">BENQ</option>
                                                                    <option value="Optoma">Optoma</option>
                                                                    <option value="Fantech">Fantech</option>
                                                                    <option value="Realme">Realme</option>
                                                                    <option value="Roadmaster">Roadmaster</option>
                                                                    <option value="DELL">DELL</option>
                                                                    <option value="HP">HP</option>
                                                                    <option value="Oppo">Oppo</option>
                                                                    <option value="Xiaomi">Xiaomi</option>
                                                                    <option value="Asus">Asus</option>
                                                                    <option value="Sanken">Sanken</option>
                                                                    <option value="Midea">Midea</option>
                                                                    <option value="Lenovo">Lenovo</option>
                                                                    <option value="Cosmos">Cosmos</option>
                                                                    <option value="MSI">MSI</option>
                                                                    <option value="Sharp">Sharp</option>
                                                                    <option value="Sony">Sony</option>
                                                                    <option value="Oxone">Oxone</option>
                                                                    <option value="Tefal">Tefal</option>
                                                                    <option value="Turbo">Turbo</option>
                                                                    <option value="Yongma">Yongma</option>
                                                                    <option value="Samsung">Samsung</option>
                                                                    <option value="Logitech">Logitech</option>
                                                                    <option value="Rexus">Rexus</option>
                                                                    <option value="Kirin">Kirin</option>
                                                                    <option value="Miyako">Miyako</option>
                                                                    <option value="Maspion">Maspion</option>
                                                                    <option value="Shure">Shure</option>
                                                                    <option value="Nakamichi">Nakamichi</option>
                                                                    <option value="BIK">BIK</option>
                                                                    <option value="KDK">KDK</option>
                                                                    <option value="JBL">JBL</option>
                                                                    <option value="Auidiobank">Auidiobank</option>
                                                                    <option value="JETE">JETE</option>
                                                                    <option value="Rinnai">Rinnai</option>
                                                                    <option value="Hisense">Hisense</option>  
                                                                    </select>
                
                                                                    <label for="harga" class="pt-4"><p style="font-size : 18px">Harga Barang : </p></label>
                                                                    <input type="number" name="harga" class="form-control" min="1" value="<?= $brg["harga"] ?>">
                
                                                                    <label for="keterangan" class="pt-4"><p style="font-size : 18px">Keterangan / Deskripsi Barang : </p></label>
                                                                    <textarea name="keterangan" class="form-control" cols="30" rows="10"><?= $brg["keterangan"] ?></textarea>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                <button name="edit_produk" type="submit" class="btn btn-primary">Edit Barang</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </td>
                                        <td>
                                            <form method="post">
                                                <input type="hidden" name="id_barang" value="<?= $brg['id_barang'] ?>">
                                                <button class="btn btn-danger" name="hapus" type="submit">Hapus</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <?php } ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </main>
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright &copy; Tekno Mart</div>
                        <div>
                            <a href="#">Privacy Policy</a>
                            &middot;
                            <a href="#">Terms &amp; Conditions</a>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="../js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    <script src="../js/datatables-simple-demo.js"></script>
</body>
</html>
