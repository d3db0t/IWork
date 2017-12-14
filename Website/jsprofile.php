<!DOCTYPE html>
<html lang="en">

<meta name="viewport" content="width=device-width, initial-scale=1">
<!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->

<script src="css/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">


<?php include('dbconfig.php'); ?>
<style>
#buttons1{
    margin-left : 38%;
    margin-top : 1%;
}
#click3{
    margin-left: 35.2%;
}
</style>

<form  method="POST" >
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="#">IWork</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation" style="">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="mprofile.php">Profile <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="">Requests</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="">Applications<span class="badge badge-success badge-pill" style='background-color: #34B3A0;color: white'>14</span></a>
                    
				</li>
				</ul>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="logout.php" style='color: #34B3A0'><button type="button" class="btn btn-outline-primary">Logout</button></a>
                    </li>
                </ul>
			</div>
		</nav>


<div id=buttons1>
<button type="submit" class="btn btn-primary btn-lg active" name="click">Show All Status</button>
<button type="submit" class="btn btn-danger" name="click2">Delete the applications</button>
<button id="click3"  type="submit" class="btn btn-success" name="click3">Apply for a Job</button>
</div>







<table class="table">
<?php
include('phpfunc.php');
?>
</table>

</body>

</form>
</html>