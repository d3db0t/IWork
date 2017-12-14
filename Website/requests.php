<?php session_start() ?>
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
                    <li class="nav-item">
                        <a class="nav-link" href="sportalhome.php">Portal Home<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="requests.php">Requests</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="attendance.php">Attendance</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="emails.php">Emails</a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="logout.php" style='color: #34B3A0'><button type="button" class="btn btn-outline-primary">Logout</button></a>
                    </li>
                </ul>
			</div>
		</nav>
        

    </body>

    <?php
        include('dbconfig.php');
        include('functions.php');
        if(!$conn)
            displayDBError();
        
        $username = $_SESSION["username"];
        $query = "EXEC ViewRequests '$username'";
        $getResults = sqlsrv_query($conn, $query);
        echo "<h1 style='color: #34B3A0'>Requests</h1>";        
        echo "<table class='table table-striped table-hover table-bordered'>
                    <thead class='thead-dark'>
                    <tr>
                    <th>#</th>
                    <th>HR decision</th>
                    <th>Manager decision</th>
                    <th>Type</th>
                    </tr>
                    </thead>
                    <tbody>";
        while($row = sqlsrv_fetch_array($getResults, SQLSRV_FETCH_ASSOC))
        {
            $code = $row["code"];
            $hrdecision = $row["hr_decision"];
            $managerdecision = $row["manager_decision"];
            $type = $row["type"];
            echo"<tr>
                <td>$code</td>
                <td>$managerdecision</td>
                <td>$hrdecision</td>
                <td>$type</td>
                </tr>";
        }

                echo "</tbody></table> ";

    ?>
</html>