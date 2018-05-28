<?php

	include('server.php');

	if(isset($_GET['id_book']) ){

			$usern = $_SESSION['username'];
			$query1 = "SELECT id_pelanggan FROM pelanggan WHERE pelanggan.`username_pelanggan` = '$usern'";
			$results = $db->query($query1);
			#mysqli_query($db, $query1) or die(mysqli_error($db)); 
			if($row = $results->fetch_assoc()){
				$userid = $row['id_pelanggan'];
			}

	// ambil id dari query string
	$id = $_GET['id_book'];

	// buat query hapus
	$sql = "CALL diskon_hari('id')";
	$query = mysqli_query($db, $sql);

	$sql1 = "CALL diskon_ultah('$userid','$id')";
	$query = mysqli_query($db, $sql1);

	header('location: transaksi.php');

	}
?>