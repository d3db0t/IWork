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
                    <li class="nav-item">
                        <a class="nav-link" href="requests.php">Requests</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="attendance.php">Attendance</a>
                    </li>
                    <li class="nav-item active">
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
        if(!$conn) displayDBError();
        

        $username = $_SESSION["username"];
        $mail = getUserMail($conn, $username);
        
        $query = "EXEC ViewRecievedEmails '$mail'";
        $getResults = sqlsrv_query($conn, $query);
        while($row = sqlsrv_fetch_array($getResults, SQLSRV_FETCH_ASSOC))
        {
            $sender = $row["sender_email"];
            $reciever = $row["recepient_email"];
            $subject = $row["subject"];
            $body = $row["body"];
            echo "<div class='card mb-3' style='width: 21%; display: inline-block; align-items: center'>
            <h3 class='card-header'>$subject</h3>
            <ul class='list-group list-group-flush'>
            <li class='list-group-item'>From: $sender</li>
            <li class='list-group-item'>To: $reciever</li>
            </ul>
            <div class='card-body'>
            <p class='card-text' style='color: white'>$body</p>
            </div>     
            <div class='card-body'>
            <a href='reply.php' class='card-link'><button type='submit' class='btn btn-success' style='background: #34B3A0; border-color: #34B3A0' >Reply</button></a>
            </div>
            </div>";
        }
    ?>
</html>