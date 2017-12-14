<?php
	session_start();
	include('mnavbarcounts.php');
?>
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
					<a class="nav-link" href="mhome.php">Home <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="mprofile.php">Profile</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="staffrequests.php">StaffRequests<span class="badge badge-success badge-pill" style='background-color: #34B3A0;color: white'><?php echo $staffRequestsCount ?></span></a>
				</li>
				<li class="nav-item">
				<a class="nav-link" href="jobapplications.php">JobApplications<span class="badge badge-success badge-pill" style='background-color: #34B3A0;color: white'><?php echo $jobApplicationsCount ?></span></a>
				</li>
				<li class="nav-item">
                    <a class="nav-link" href="createproject.php">CreateProject</a>
				</li>
				<li class="nav-item">
                    <a class="nav-link" href="assignemployee.php">AssignEmployee</a>
				</li>
				<li class="nav-item">
                    <a class="nav-link" href="removeemployee.php">RemoveEmployee</a>
				</li>
				<li class="nav-item">
                    <a class="nav-link" href="createtask.php">CreateTask</a>
				</li>
				<li class="nav-item">
                    <a class="nav-link" href="assignemployeetotask.php">AssignEmployeeToTask</a>
				</li>
				<li class="nav-item">
                    <a class="nav-link" href="changeassignedemployee.php">ChangeAssignedEmployee</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="viewtasks.php">ViewTasks</a>
				</li>
				<li class="nav-item">
                    <a class="nav-link" href="sportalhome.php">StaffPortal</a>
                </li>               
				</ul>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="logout.php" style='color: #34B3A0'><button type="button" class="btn btn-outline-primary">Logout</button></a>
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
				<select id="jobsORcompanies" name="jobsORcompanies">                      
					<option value="0">--Search For--</option>
					<option value="1">company</option>
					<option value="2">job</option>
				</select>
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
			$query = "EXEC Companies_with_Highest_Avg_Salaries";
			$getResults = sqlsrv_query($conn, $query);
			dieIfFalse($getResults, "<p class='diepar'>No Results are found!</p>");
			dieIfNoRows($getResults, "<p class='diepar'>No Results are found!</p>");
			while ($row = sqlsrv_fetch_array($getResults, SQLSRV_FETCH_ASSOC))
				viewCompanyWithSalary($row['name'], $row['address'], $row['domain_name'], $row['vision'], $row['email'], $row['field'], $row['type'], $row['Average Salary']);	
			
			sqlsrv_free_stmt($getResults);
			sqlsrv_close($conn);
		}
	?>

</html>
