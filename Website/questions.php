<?php include('dbconfig.php') ?>
<?php session_start() ?>


<html>

<link rel="stylesheet" href="css/bootstrap.min.css">
<script src"css/jquery-3.2.1.min.js"></script>

<body>
<form method = "POST">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="#">IWork</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation" style="">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="index.php">Home <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="register.php">Register</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="login.php">Login</a>
				</li>
				</ul>
			</div>
</nav>


<table class="table">
<?php include('questions2Func.php') ?>
</table>


<?php echo("<a href='jsprofile.php?jobtitle=$title_of_job&companyname=$comp_name&companyaddress=$comp_add&dep=$dep' class='card-link' ><button type='submit' name='shofelstatus' class='btn btn-success' style='background: #34B3A0; border-color: #34B3A0' >VIEW the SCORE</button></a>"); ?>

<?php 
if(isset($_POST['shofelstatus'])){
    echo "<script type='text/javascript'>window.location.href = 'jsprofile.php?jobtitle=$title_of_job&companyname=$comp_name&companyaddress=$comp_add&dep=$dep';</script>";
}

?>
</form>
</body>
</html>