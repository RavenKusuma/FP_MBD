<?php include('server.php') ?>
<!DOCTYPE html>
<html>
<head>
	<title>REGISTRATION</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="header">
		<h2>Register</h2>
	</div>
	
	<form method="post" action="register.php">

		<?php include('errors.php'); ?>

		<div class="input-group">
			<label>Username</label>
			<input type="text" name="username" placeholder="Username">
		</div>
		<div class="input-group">
			<label>Password</label>
			<input type="password" name="password_1">
		</div>
		<div class="input-group">
			<label>Confirm password</label>
			<input type="password" name="password_2">
		</div>
		<div class="input-group">
			<label>Nama</label>
			<input type="text" name="nama" placeholder="Nama">
		</div>
		<div class="input-group">
			<label>Alamat</label>
			<input type="text" name="alamat" placeholder="Alamat"">
		</div>
		<div class="input-group">
			<label>NO_TELP</label>
			<input type="text" name="no_tlp" placeholder="NO_TELP">
		</div>
		<div class="input-group">
			<label>Tanggal_lahir</label>
			<input type="date" name="tgl_lahir" placeholder="Tanggal_lahir"">
		</div>
		<div class="input-group">
			<button type="submit" class="btn" name="reg_user">Register</button>
		</div>
		<p>
			Already a member? <a href="login.php">Sign in</a>
		</p>
	</form>
</body>
</html>