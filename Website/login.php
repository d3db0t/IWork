<html>
    <link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/login.css">

    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <a class="navbar-brand" href="#">IWork</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation" style="">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarColor01">
                    <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.php">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="register.php">Register</a>
                    </li>
                    <li class="nav-item active">
					    <a class="nav-link" href="login.php">Login <span class="sr-only">(current)</span></a>
				    </li>
                    </ul>
                </div>
            </nav>

            <form role='form' class='form-signin' action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
                <div class="form-group">
                    <p class='formtitles' >Username</p>
                    <input id="name" class="form-control" type="text" name="username" placeholder="username">
                </div>
                <div class="form-group">
                    <p class='formtitles' >Password</p>
                    <input class="form-control" type="password" name="password" placeholder="password">
                </div>
                
                <button id='signinbtn' class="btn" type="submit" name='login' >Login</button>
		</form>
		
        </body>

        <?php
            include('dbconfig.php');
            include('functions.php');
            if($conn === false) {
                displayDBError();
            }
            if ($_SERVER["REQUEST_METHOD"] == "POST") 
            {
                $getUsername = $_POST["username"];
                $getPassword = $_POST["password"];
                $q = "SELECT username FROM Users WHERE dbo.Check_User_Credentials('$getUsername' , '$getPassword') = 1 AND username = '$getUsername'";
                $getResults = sqlsrv_query($conn, $q);
                $user = sqlsrv_fetch_array($getResults, SQLSRV_FETCH_ASSOC)['username'];
                if (empty($getUsername) or empty($getPassword))
                {
                    die
                    (
                        "<div class='alert alert-dismissible alert-warning'>
                        <button type='button' class='close' data-dismiss='alert'>&times;</button>
                        <strong>Oh snap!</strong> Please fill in all fields! </div>"
                    );
                }
                else if (!empty($user))
                {
                    session_start();
                    $_SESSION['username'] = $getUsername;
                    // The redirect function
                    redirectUserByRole($_SESSION['username'], $conn);
                }
                else
                {
                    die
                    (
                        "<div class='alert alert-dismissible alert-danger'>
                        <button type='button' class='close' data-dismiss='alert'>&times;</button>
                        <strong>Oh snap!</strong> Wrong username or password!</div>"
                    );
                }
                echo $_SESSION['username'];
            }
        ?>
</html>