<?php

	$date = date('Y-m-d');

	include('server.php');

	if(isset($_GET['id_booking']) ){

			$usern = $_SESSION['username'];
			$query1 = "SELECT id_pelanggan FROM pelanggan WHERE pelanggan.`username_pelanggan` = '$usern'";
			$results = $db->query($query1);
			#mysqli_query($db, $query1) or die(mysqli_error($db)); 
			if($row = $results->fetch_assoc()){
				$userid = $row['id_pelanggan'];
			}

	// ambil id dari query string
	$id = $_GET['id_booking'];


	// buat query hapus
	$sql = "CALL denda('$id','$date')";
	$query = mysqli_query($db, $sql);

	header('location: transaksi.php');

	}
?>