<?php 
    include "../db/koneksi.php";
    $orders = query("SELECT * FROM orders 
                inner join jasa_kirim using(id_jasa) 
                inner join metode using(id_metode)
                inner join tb_user using(id_user) 
                where status = 'Diproses' OR status = 'Dikirim' ORDER BY status DESC");
    

    if(isset($_POST["kirim"])){
        if (kirim($_POST) > 0 ) {
            echo "<script>
                alert('Pesanan Dikirim');
                window.location.href='diproses.php';
            </script>";
        } else {
            echo "<script>
                alert('Pesanan Gagal Dikirim');
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
							<a class="nav-link collapsed active" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="true" aria-controls="collapseLayouts">
								<div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
								Pesanan
								<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
							</a>
							<div class="collapse show" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
								<nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="batal.php">Pesanan Dibatalkan</a>
                                    <a class="nav-link" href="konfirmasi.php">Konfirmasi Pesanan</a>
                                    <a class="nav-link active" href="diproses.php">Untuk Dikirim</a>
                                    <a class="nav-link" href="selesai.php">Pesanan Selesai</a>
                                    <a class="nav-link" href="refund.php">Pengajuan Retur</a>
								</nav>
							</div>
							<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
								<div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
								Manajemen Produk
								<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
							</a>
							<div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
								<nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="all_product.php">Lihat Semua Produk</a>
									<a class="nav-link" href="edit_product.php">Edit & Hapus Produk</a>
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
                        <h1 class="mt-4">Pesanan</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Untuk Dikirim</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Pesanan Di Techno Mart
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple" class="text-center">
                                    <thead>
                                        <tr>
                                            <th>Nama User</th>
                                            <th>Status</th>
                                            <th>Bukti Pembayaran</th>
                                            <th>Resi</th>
                                            <th>Konfirmasi</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php 
                                        foreach ($orders as $ord){
                                        ?>
                                        <tr>
                                            <td><p style="font-size:16px"><?= $ord["nama"] ?></p></td>
                                            <td><?= $ord["status"] ?></td>
                                            <?php 
                                            if(empty($ord["bukti_pembayaran"])){
                                            ?>
                                                <td><img src="../assets/icon/x.png" alt="" height="20" width="20"></td>
                                            <?php }else {?>
                                                <td class="text-center align-middle">
                                                    <img src="../assets/icon/check.png" alt="" height="25" width="25">
                                                </td>
                                            <?php }?>
                                            <td>
                                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal<?= $ord['id_orders'] ?>">
                                                    Lihat
                                                </button>
                                                <div class="modal fade" id="exampleModal<?= $ord["id_orders"] ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog modal-lg">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h1 class="modal-title fs-5" id="exampleModalLabel">Detail Pesanan</h1>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div id="printArea<?= $ord['id_orders'] ?>">
                                                                    <div class="container">
                                                                        <div class="container p-3 mb-3" style="border : 1px solid #000">
                                                                            <div class="row">
                                                                                <div class="col-2">
                                                                                    <p style="text-align: left">Tujuan</p>
                                                                                </div>
                                                                                <div class="col-1">:</div>
                                                                                <div class="col-6">
                                                                                    <p style="text-align: left"><?= $ord["alamat"] ?></p>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-2">
                                                                                    <p style="text-align: left">Penerima</p>
                                                                                </div>
                                                                                <div class="col-1">:</div>
                                                                                <div class="col-6">
                                                                                    <p style="text-align: left"><?= $ord["nama"] ?></p>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-2">
                                                                                    <p style="text-align: left">No HP</p>
                                                                                </div>
                                                                                <div class="col-1">:</div>
                                                                                <div class="col-6">
                                                                                    <p style="text-align: left"><?= $ord["telp"] ?></p>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-2">
                                                                                    <p style="text-align: left">Ongkir</p>
                                                                                </div>
                                                                                <div class="col-1">:</div>
                                                                                <div class="col-6">
                                                                                    <p style="text-align: left"><?= rupiah($ord["harga_jasa"]) ?></p>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-2">
                                                                                    <p style="text-align: left">Pengirim</p>
                                                                                </div>
                                                                                <div class="col-1">:</div>
                                                                                <div class="col-6">
                                                                                    <p style="text-align: left">Techno Mart</p>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row pb-2">
                                                                            <div class="col">
                                                                                <h5 style="text-align:left">DAFTAR PRODUK</h5>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row" style="border-bottom : 1px dashed #000">
                                                                            <div class="col-1">No</div>
                                                                            <div class="col-5">Nama Produk</div>
                                                                            <div class="col">QTY</div>
                                                                        </div>
                                                                        <?php 
                                                                        $ids = $ord["id_orders"];
                                                                        $details = query("SELECT * FROM details 
                                                                        inner join orders using(id_orders)
                                                                        inner join tb_barang using(id_barang)
                                                                        inner join jasa_kirim using(id_jasa) 
                                                                        inner join metode using(id_metode)
                                                                        where id_orders = '$ids'");

                                                                        $total = 0;
                                                                        $total_harga = 0;
                                                                        $n = 1;

                                                                        foreach ($details as $dt){
                                                                            $total_harga += $dt["harga_satuan"] * $dt["qty"];
                                                                            $total += $dt["harga_satuan"] * $dt["qty"];
                                                                            $total += $dt["harga_jasa"] + $dt["harga_admin"]
                                                                        ?>
                                                                        <div class="row">
                                                                            <div class="col-1"><?= $n ?>.</div>
                                                                            <div class="col-5"><?= $dt["nama_barang"] ?></div>
                                                                            <div class="col"><?= $dt["qty"] ?></div>
                                                                        </div>
                                                                        <?php 
                                                                            $n += 1;
                                                                        }?>
                                                                    </div>
                                                                    <div class="container" style="border-top : 1px dashed #000">
                                                                        <div class="row pb-3 pt-4">
                                                                            <div class="col-2">Pesan Pembeli :</div>
                                                                            <?php 
                                                                            if (empty($ord["pesan"])){
                                                                            ?>
                                                                                <div class="col-5">---</div>
                                                                            <?php } else{?>
                                                                                <div class="col-5"><?= $ord["pesan"] ?></div>
                                                                            <?php }?>
                                                                            <div class="col"></div>
                                                                            <div class="col"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-primary" onclick="printModalContent(<?= $ord['id_orders'] ?>)">
                                                                    <span><img src="../assets/icon/print.png" alt="ss" height="20" width="20"></span> 
                                                                    Print
                                                                </button>
                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </td>
                                            <td>
                                                <?php 
                                                if (!empty($ord["bukti_pembayaran"] && $ord["status"] == 'Diproses')) {
                                                ?>
                                                <form method="post">
                                                    <input type="hidden" name="id_orders" value="<?= $ord["id_orders"] ?>">
                                                    <a href="" onclick="return confirm('Yakin untuk mengirim pesanan?')">
                                                        <button  type="submit" class="btn btn-success" name="kirim">
                                                            Kirim   
                                                        </button>
                                                    </a>
                                                </form>
                                                <?php }?>
                                            </td>
                                        </tr>
                                        <?php }?>
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
        <script>
            function printModalContent(orderId) {
                var printContents = document.getElementById('printArea' + orderId).innerHTML;
                var originalContents = document.body.innerHTML;

                document.body.innerHTML = printContents;

                window.print();

                document.body.innerHTML = originalContents;

                window.location.reload(); // Refresh the page to restore the original content
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../js/datatables-simple-demo.js"></script>
    </body>
</html>
