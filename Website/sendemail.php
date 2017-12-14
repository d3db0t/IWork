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
                    <li class="nav-item">
                        <a class="nav-link" href="goback.php">Back to home</a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="logout.php" style='color: #34B3A0'><button type="button" class="btn btn-outline-primary">Logout</button></a>
                    </li>
                </ul>
			</div>
		</nav>
        <form role='form' class='form-signin' action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
               <div class="form-group">
                    <p class='formtitles' >To</p>
                    <input id="to" class="form-control" type="text" name="to" placeholder="To">
                </div>
                <div class="form-group">
                    <p class='formtitles' >Subject</p>
                    <input id="subject" class="form-control" type="text" name="subject" placeholder="Subject">
                </div>               
                <div class="form-group">
                    <p class='formtitles' >Body</p>
                    <input id="body" class="form-control" type="text" name="body" placeholder="Body">
                </div>
                <button class='searchbtn' type='submit' name="apply">Reply</button>
        </form>
    </body>
    
    <?php
        include('dbconfig.php');
        include('functions.php');
        if(!$conn) displayDBError();
        

        $username = $_SESSION["username"];
        $mail = getUserMail($conn, $username);
        if($_SERVER["REQUEST_METHOD"] == "POST")
        {
            $attributes = array(
                "recep" => $_POST["to"],
                "subject" => $_POST["subject"],
                "body" => $_POST["body"]
            );
            if(noEmptyFields($attributes))
            {
                $to = $_POST["to"];
                $subject = $_POST["subject"];
                $body = $_POST["body"];
                $query = "EXEC SendEmails '$mail', '$to', '$subject', '$body'";
                $getResults = sqlsrv_query($conn, $query);
                dieIfFalse($getResults,"<div class='alert alert-dismissible alert-danger'>
                <button type='button' class='close' data-dismiss='alert'>&times;</button>
                <strong>Oh snap!</strong> It looks like you can't send mails at that time </div>");
                if(sqlsrv_rows_affected($getResults) > 0)
                {
                    echo "echo <div class='alert alert-dismissible alert-success'>
                    <button type='button' class='close' data-dismiss='alert'>&times;</button>
                    <strong>Well done!</strong> The Email was sent successfully
                    </div>";
                }
                else
                echo "<div class='alert alert-dismissible alert-danger'>
                <button type='button' class='close' data-dismiss='alert'>&times;</button>
                <strong>Oh snap!</strong> Failed to send mail </div>";
            }
            else
            echo "<div class='alert alert-dismissible alert-danger'>
            <button type='button' class='close' data-dismiss='alert'>&times;</button>
            <strong>Oh snap!</strong> Please fill in all fields </div>";
        }
    ?>
</html>