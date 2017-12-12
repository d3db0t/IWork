<html>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/index.css">

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

			<div id='j1' class="jumbotron">
				<h1>#1 Online Recruitment Job Site</h1>
				<p>IWork is a simple website that provides internal systems for companies to facilitate the working process.</p>
				<!--<a href='login.php'><button id='btn1' class='loginbtn'><span>Login</span></button></a>-->
				<form class="form-inline my-2 my-lg-0" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST" id='f1'>
				<input class="form-control mr-sm-2" placeholder="Search" type="text" name="searchbar">
				<select id="dropdownmenu" name="dropdownmenu">                      
					<option value="0">--Search By--</option>
					<option value="1">name</option>
					<option value="2">address</option>
					<option value="3">type</option>
				</select>
				<button class='searchbtn' type='submit'><span>Search</span></button>
				</form>
			</div>
			<!--
			<form>
				<input type="button" value="Go back!" onclick="history.back()"></input>
			</form>
			-->
			<div class="container">
				<div class="row">
					
					<!--<h3 id='h3c1'>Search Results</h3>-->
					
				</div>
			</div>
			
	</body>
		
	<?php
		include('dbconfig.php');
		include('functions.php');
		if(!$conn)
			displayDBError();
		
		if($_SERVER["REQUEST_METHOD"] == "POST")
			include('searchbar.php');
		else
		{
			$query = "EXEC AllCompanies";
			$getResults = sqlsrv_query($conn, $query);
			dieIfFalse($getResults, "<p class='diepar'>No Results are found!</p>");
			dieIfNoRows($getResults, "<p class='diepar'>No Results are found!</p>");
			while ($row = sqlsrv_fetch_array($getResults, SQLSRV_FETCH_ASSOC))
				viewCompanyInfo($row['name'], $row['address'], $row['domain_name'], $row['vision'], $row['email'], $row['field'], $row['type']);				
		}
	?>

</html>
