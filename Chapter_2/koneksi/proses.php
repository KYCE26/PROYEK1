<?php
require 'koneksi.php';
if ($_GET['id'] == 'login') {
    $user = $_POST['user'];
    $pass = $_POST['pass'];

    $row = $koneksi->prepare("SELECT * FROM login WHERE username = ? AND password = md5(?)");

    $row->execute(array($user, $pass));

    $hitung = $row->rowCount();

    if ($hitung > 0) {

        session_start();
        $hasil = $row->fetch();

        $_SESSION['USER'] = $hasil;

        if ($_SESSION['USER']['level'] == 'admin') {
            echo '<script>alert("Login Sukses");window.location="../admin/index.php";</script>';
        } else {
            echo '<script>alert("Login Sukses");window.location="../index.php";</script>';
        }
    } else {
        echo '<script>alert("Login Gagal");window.location="../index.php";</script>';
    }
}

if ($_GET['id'] == 'daftar') {
    $data[] = $_POST['nama'];
    $data[] = $_POST['user'];
    $data[] = $_POST['noktp'];
    $data[] = $_POST['alamat'];
    $data[] = $_POST['notlp'];
    $data[] = md5($_POST['pass']);
    $data[] = 'pengguna';

    $row = $koneksi->prepare("SELECT * FROM login WHERE username = ?");

    $row->execute(array($_POST['user']));

    $hitung = $row->rowCount();

    if ($hitung > 0) {
        echo '<script>alert("Daftar Gagal, Username Sudah digunakan ");window.location="../index.php";</script>';
    } else {

        $sql = "INSERT INTO `login`(`nama_pengguna`, `username`, `no_ktp`, `alamat`, `no_telepon`, `password`, `level`)
                VALUES (?,?,?,?,?,?,?)";
        $row = $koneksi->prepare($sql);
        $row->execute($data);

        echo '<script>alert("Daftar Sukses Silahkan Login");window.location="../index.php";</script>';
    }
}

if ($_GET['id'] == 'booking') {
    $total = $_POST['total_harga'] * $_POST['lama_sewa'];
    $unik  = random_int(100, 999);
    $total_harga = $total + $unik;

    $data[] = time();
    $data[] = $_POST['id_login'];
    $data[] = $_POST['id_mobil'];
    $data[] = $_POST['ktp'];
    $data[] = $_POST['nama'];
    $data[] = $_POST['alamat'];
    $data[] = $_POST['no_tlp'];
    $data[] = $_POST['tanggal'];
    $data[] = $_POST['lama_sewa'];
    $data[] = $total_harga;
    $data[] = "Belum Bayar";
    $data[] = date('Y-m-d');

    $sql = "INSERT INTO booking (kode_booking, 
    id_login, 
    id_mobil, 
    ktp, 
    nama, 
    alamat, 
    no_tlp, 
    tanggal, lama_sewa, total_harga, konfirmasi_pembayaran, tgl_input) 
        VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
    $row = $koneksi->prepare($sql);
    $row->execute($data);

    echo '<script>alert("Anda Sukses Booking silahkan Melakukan Pembayaran");
    window.location="../bayar.php?id=' . time() . '";</script>';
}

if ($_GET['id'] == 'konfirmasi') {
    $dir = '../assets/image/';
    $tmp_name = $_FILES['foto']['tmp_name'];
    $name = time() . basename($_FILES['foto']['name']);
    $allowedImageType = array("image/gif",   "image/JPG",   "image/jpeg",   "image/pjpeg",   "image/png",   "image/x-png");

    move_uploaded_file($tmp_name, $dir . $name);
    $data[] = $_POST['id_booking'];
    $data[] = $_POST['no_rekening'];
    $data[] = $_POST['nama'];
    $data[] = $_POST['nominal'];
    $data[] = $_POST['tgl'];
    $data[] = $name;

    $sql = "INSERT INTO `pembayaran`(`id_booking`, `no_rekening`, `nama_rekening`, `nominal`, `tanggal`,`foto`) 
    VALUES (?,?,?,?,?,?)";
    $row = $koneksi->prepare($sql);
    $row->execute($data);

    $data2[] = 'Sedang di proses';
    $data2[] = $_POST['id_booking'];
    $sql2 = "UPDATE `booking` SET `konfirmasi_pembayaran`=? WHERE id_booking=?";
    $row2 = $koneksi->prepare($sql2);
    $row2->execute($data2);
    echo '<script>alert("Kirim Sukses , Pembayaran anda sedang diproses");history.go(-2);</script>';
}

// if ($_GET['id'] == 'Bukti') {
//     $dir = '../../assets/image/';
//     $tmp_name = $_FILES['foto']['tmp_name'];
//     $name = time() . basename($_FILES['foto']['name']);
//     $allowedImageType = array("image/gif",   "image/JPG",   "image/jpeg",   "image/pjpeg",   "image/png",   "image/x-png");

//     if ($_FILES['foto']["error"] > 0) {
//         $output['error'] = "Error in File";
//     } elseif (!in_array($_FILES['foto']["type"], $allowedImageType)) {
//         echo '<script>alert("You can only upload JPG, PNG and GIF file");window.location="konfirmasi.php"</script>';
//     } elseif (round($_FILES['foto']["size"] / 1024) > 4096) {
//         echo '<script>alert("WARNING !!! Besar Gambar Tidak Boleh Lebih Dari 4 MB !");window.location="konfirmasi.php"</script>';
//     } else {
//         if (move_uploaded_file($tmp_name, $dir . $name)) {
//             $data[] = $name;

//             $sql = "INSERT INTO `pembayaran`(`foto`) 
//                 VALUES (?)";
//             $row = $koneksi->prepare($sql);
//             $row->execute($data);
//             echo '<script>alert("sukses");window.location="index.php"</script>';
//         } else {
//             echo '<script>alert("Harap Upload Gambar !");window.location="konfirmasi.php"</script>';
//         }
//     }
// }
