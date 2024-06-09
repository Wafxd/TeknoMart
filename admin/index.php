<?php 
include "../db/koneksi.php";
session_start();

if (isset($_SESSION['id_admin']) && isset($_SESSION['username'])) {
    $id_user = $_SESSION['id_admin'];
    $username = $_SESSION["username"];
    $nama = query("SELECT nama FROM tb_user WHERE id_user = '$id_user'")[0];
} else {
    echo "<script>
            document.location.href = 'login_admin.php';
        </script>";
}
$barang = query("SELECT * FROM tb_barang");
$total_customers = query("SELECT COUNT(*) AS total FROM tb_user")[0]['total'];
$total_items = query("SELECT COUNT(*) AS total FROM tb_barang")[0]['total'];
$total_orders = query("SELECT COUNT(*) AS total FROM orders")[0]['total'];
$barang = query("SELECT * FROM tb_barang");
$data_pemasukan = query("SELECT DATE_FORMAT(orders.tanggal, '%Y-%m-%d') AS tanggal, SUM(details.harga_satuan * details.qty) AS pemasukan 
                          FROM orders
                          INNER JOIN details using(id_orders)
                          WHERE status = 'Selesai'
                          GROUP BY tanggal");
$data_pengeluaran = query("SELECT DATE_FORMAT(tanggal, '%Y-%m-%d') AS tanggal, SUM(harga * qty) AS pengeluaran 
                          FROM tb_pengeluaran 
                          GROUP BY tanggal");
$data_pemasukan_json = json_encode($data_pemasukan);
$data_pengeluaran_json = json_encode($data_pengeluaran);
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
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand ps-3" href="index.php">Admin Tekno</a>
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><?= $username ?></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="logout.php">Logout</a></li>
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
                            <a class="nav-link active" href="index.php">
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
                    <h1 class="mt-4">Dashboard</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item active">Dashboard</li>
                    </ol>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="card bg-primary text-white mb-4">
                                <div class="card-body d-flex justify-content-between align-items-center">
                                    <div>
                                        <h3>Total Pelanggan</h3>
                                        <h2><?php echo $total_customers; ?></h2>
                                    </div>
                                    <img src="../assets/icon/customer.png" alt="Customer Icon" style="width: 50px; height: 50px;">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card bg-warning text-white mb-4">
                                <div class="card-body d-flex justify-content-between align-items-center">
                                    <div>
                                        <h3>Total Barang</h3>
                                        <h2><?php echo $total_items; ?></h2>
                                    </div>
                                    <img src="../assets/icon/product.png" alt="Product Icon" style="width: 50px; height: 50px;">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card bg-success text-white mb-4">
                                <div class="card-body d-flex justify-content-between align-items-center">
                                    <div>
                                        <h3>Total Pesanan</h3>
                                        <h2><?php echo $total_orders; ?></h2>
                                    </div>
                                    <img src="../assets/icon/orders.png" alt="Orders Icon" style="width: 50px; height: 50px;">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h2>Pemasukan</h2>
                                </div>
                                <div class="card-body">
                                    <canvas id="chartPemasukan" style="width: 100%; height: 200px;"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h2>Pengeluaran</h2>
                                </div>
                                <div class="card-body">
                                    <canvas id="chartPengeluaran" style="width: 100%; height: 200px;"></canvas>
                                </div>
                            </div>
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
        <script>
        document.addEventListener('DOMContentLoaded', (event) => {
            const dataPemasukan = <?php echo $data_pemasukan_json; ?>;
            const dataPengeluaran = <?php echo $data_pengeluaran_json; ?>;

            const labelsPemasukan = dataPemasukan.map(entry => entry.tanggal);
            const dataPemasukanValues = dataPemasukan.map(entry => entry.pemasukan);

            const labelsPengeluaran = dataPengeluaran.map(entry => entry.tanggal);
            const dataPengeluaranValues = dataPengeluaran.map(entry => entry.pengeluaran);


            const ctxPemasukan = document.getElementById('chartPemasukan').getContext('2d');
            const chartPemasukan = new Chart(ctxPemasukan, {
                type: 'line',
                data: {
                    labels: labelsPemasukan,
                    datasets: [{
                        label: 'Pemasukan',
                        data: dataPemasukanValues,
                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1,
                        fill: false
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true,
                            ticks: {
                                stepSize: 10000000, // 10 million
                                callback: function(value) {
                                    return 'Rp ' + value / 1000000 + ' Juta'; // Display in millions
                                }
                            }
                        }
                    }
                }
            });

            const ctxPengeluaran = document.getElementById('chartPengeluaran').getContext('2d');
            const chartPengeluaran = new Chart(ctxPengeluaran, {
                type: 'line',
                data: {
                    labels: labelsPengeluaran,
                    datasets: [{
                        label: 'Pengeluaran',
                        data: dataPengeluaranValues,
                        backgroundColor: 'rgba(255, 99, 132, 0.2)',
                        borderColor: 'rgba(255, 99, 132, 1)',
                        borderWidth: 1,
                        fill: false
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true,
                            ticks: {
                                stepSize: 10000000, // 10 million
                                callback: function(value) {
                                    return 'Rp ' + value / 1000000 + ' Juta'; // Display in millions
                                }
                            }
                        }
                    }
                }
            });
        });
        </script>
    </body>
</html>
