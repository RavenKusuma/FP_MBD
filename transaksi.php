<?php 

	include('server.php');

	include('login_req.php');
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
	<?php


			$usern = $_SESSION['username'];
			$query1 = "SELECT id_pelanggan FROM pelanggan WHERE pelanggan.`username_pelanggan` = '$usern'";
			$results = $db->query($query1);
			#mysqli_query($db, $query1) or die(mysqli_error($db)); 
			if($row = $results->fetch_assoc()){
				$userid = $row['id_pelanggan'];
			}

			$query = "SELECT transaksi.* FROM transaksi JOIN bookings ON transaksi.`ID_BOOKING` = bookings.`ID_BOOKING` AND bookings.`ID_PELANGGAN` = '$userid'";
	        $result = $db->query($query);
	        while($row = $result->fetch_assoc()){
				echo "<div class='transaction' style='margin: auto;'>
						<h1 style='font-size: 20px'  class='tm-red-text'>ID <span style='font-size: 20px' class='tm-red-text'>Transaksi : $row[ID_TRANSAKSI]</span></h1>
						<h1 style='font-size: 20px'  class='tm-red-text'>ID <span style='font-size: 20px'  class='tm-red-text'>Booking : $row[ID_BOOKING]</span></h1>
						<h1 style='font-size: 20px'  class='tm-red-text'>ID <span style='font-size: 20px'  class='tm-red-text'>Pegawai : $row[ID_PEGAWAI]</span></h1>
						<h1 style='font-size: 20px'  class='tm-red-text'>Cara <span style='font-size: 20px'  class='tm-red-text'>Bayar : $row[CARA_PEMBAYARAN]</span></h1>
						<h1 style='font-size: 20px'  class='tm-red-text'>Total <span style='font-size: 20px'  class='tm-red-text'>Harga : $row[TOTAL_HARGA]</span></h1>	
						<h1 style='font-size: 20px'  class='tm-red-text'>Tanggal <span style='font-size: 20px'  class='tm-red-text'>Transaksi : $row[TGL_TRANSAKSI]</span></h1>
						<a href='bayar.php?=' class='tm-banner-link'>BAYAR</a>
						<a href='cekdiskon.php?id_book=$row[ID_BOOKING]' class='tm-banner-link'>CEK DISKON</a>
					</div>";
			}
	?>
	
</body>
</html>