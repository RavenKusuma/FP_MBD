<?php 

	include('server.php');
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Holiday</title>
<!--
Holiday Template
http://www.templatemo.com/tm-475-holiday
-->
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,700' rel='stylesheet' type='text/css'>
  <link href="css/font-awesome.min.css" rel="stylesheet">
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet">  
  <link href="css/flexslider.css" rel="stylesheet">
  <link href="css/templatemo-style.css" rel="stylesheet">

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>
  <body class="tm-gray-bg">
  	<!-- Header -->
  	<div class="tm-header">
  		<div class="container">
  			<div class="row">
  				<div class="col-lg-6 col-md-4 col-sm-3 tm-site-name-container">
  					<a href="#" class="tm-site-name">Holiday</a>	
  				</div>
	  			<div class="col-lg-6 col-md-8 col-sm-9">
	  				<div class="mobile-menu-icon">
		              <i class="fa fa-bars"></i>
		            </div>
	  				<nav class="tm-nav">
						<ul>
							<li><a href="index.php" >Home</a></li>
							<li><a href="about.php">About</a></li>
							<li><a href="profil.php" class="active">Profil</a></li>
							<li><a href="logout.php">Logout</a></li>
						</ul>
					</nav>		
	  			</div>				
  			</div>
  		</div>	  	
  	</div>
	
	<!-- Banner -->
	<section class="tm-banner">
		<!-- Flexslider -->
		<div class="flexslider flexslider-banner">
		  <ul class="slides">
		    <li>
			    <div class="tm-banner-inner">
					<h1 class="tm-banner-title">Find <span class="tm-yellow-text">The Best</span> Place</h1>
					<p class="tm-banner-subtitle">For Your Holidays</p>
					<a href="#more" class="tm-banner-link">Learn More</a>	
				</div>
				<img src="img/banner-1.jpg" alt="Image" />	
		    </li>
		    <li>
			    <div class="tm-banner-inner">
					<h1 class="tm-banner-title">Find <span class="tm-yellow-text">The Best</span> Place</h1>
					<p class="tm-banner-subtitle">Wonderful Destinations</p>
					<a href="#more" class="tm-banner-link">Learn More</a>	
				</div>
		      <img src="img/banner-2.jpg" alt="Image" />
		    </li>
		    <li>
			    <div class="tm-banner-inner">
					<h1 class="tm-banner-title">Find <span class="tm-yellow-text">The Best</span> Place</h1>
					<p class="tm-banner-subtitle">Comfortable Destination</p>
					<a href="#more" class="tm-banner-link">Learn More</a>	
				</div>
		      <img src="img/banner-3.jpg" alt="Image" />
		    </li>
		  </ul>
		</div>	
	</section>
	
	<div class="container">
		<h1>
			List Booking
		</h1>
		<table class="table table-striped">
		<thead>
		<tr>
			<th>ID Pelanggan</th>
			<th>Nama Pelanggan</th>
			<th>ID Booking</th>
			<th>NO Kamar</th>
			<th>Tgl Checkin</th>
			<th>Tgl Checkout</th>
			<th>Status</th>
		</tr>
		</thead>
		<tbody>

		<?php
		$sqli = "SELECT * FROM pelanggan_booking";
		$query = mysqli_query($db, $sqli);



		while($pegawai = mysqli_fetch_array($query)){
			echo "<tr>";

			echo "<td>".$pegawai['ID_PELANGGAN']."</td>";
			echo "<td>".$pegawai['NAMA_PELANGGAN']."</td>";
			echo "<td>".$pegawai['ID_BOOKING']."</td>";
			echo "<td>".$pegawai['NO_KAMAR']."</td>";
			echo "<td>".$pegawai['TGL_CHECKIN']."</td>";
			echo "<td>".$pegawai['TGL_CHECKOUT']."</td>";
			echo "<td>".$pegawai['STATUS_BOOKING']."</td>";

			echo "</tr>";
		}
		?>
		</tbody>
		</table>

	<p>Total: <?php echo mysqli_num_rows($query) ?></p>
	</div>

	<div>
		<form action="profil.php" method="get">
		<input type="text" name="id_hotel" placeholder="id_hotel">
		<button type="submit" name="Cek Kamar">Cek Booking</button>
		</form>
	</div>

	<?php
			if( isset($_GET['id_hotel']) ){

			$usern = $_SESSION['username'];

			$query = "SELECT id_pelanggan FROM pelanggan WHERE username_pelanggan='$usern'";

			$results = mysqli_query($db, $query);

			if ($rows = $results->fetch_assoc()) {
				$temp = $rows['id_pelanggan'];
      		}

			// ambil id dari query string
			$id = $_GET['id_hotel'];

			// buat query hapus
			$sql = "SELECT jumlah_booking_hotel('$temp','$id') AS jumlah_book";
			$query = mysqli_query($db, $sql);

			// apakah query hapus berhasil?

			if( $rows = $query->fetch_assoc()){
				echo   "<div> 
							<h3> Jumlah Booking = $rows[jumlah_book]<h3>
						</div>";
			} else {
				die("gagal query...");
			}

			}
		?>

	<a href="transaksi.php" class="tm-banner-link">TRANSAKSI</a>

</body>
</html>