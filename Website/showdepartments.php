<html>
	<link rel="stylesheet" href="css/bootstrap.min.css">

    <body>
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
    </body>
    <?php
        include('dbconfig.php');
        include('functions.php');
        if (isset($_GET['company']) and isset($_GET['address']))
        {
            showDepartments($_GET['company'], $_GET['address'], $conn);
        }
        else
        {
            echo "<div class='alert alert-dismissible alert-danger'>
            <button type='button' class='close' data-dismiss='alert'>&times;</button>
            <strong>Oh snap!</strong> Failed to show departments! </div>";
        }

    ?>
</html>