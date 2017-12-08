<html>
    <link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/login.css">

    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <a class="navbar-brand" href="#">Navbar</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation" style="">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarColor01">
                    <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.php">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="register.php">Register</a>
                    </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0" action="index.php" method="POST">
                    <input class="form-control mr-sm-2" placeholder="Search" type="text" name="searchbar">
                    <select id="dropdownmenu" name="dropdownmenu">                      
                        <option value="0">--Search By--</option>
                        <option value="1">name</option>
                        <option value="2">address</option>
                        <option value="3">type</option>
                    </select>
                    <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </div>
            </nav>

            <form role='form' class='form-signin' action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
                <div class="form-group">
                    <p class='formtitles' >Enter Username</p>
                    <input id="name" class="form-control" type="text" name="username" placeholder="username">
                </div>
                <div class="form-group">
                    <p class='formtitles' >Enter Password</p>
                    <input class="form-control" type="password" name="password" placeholder="password">
                </div>
                
                <button id='signinbtn' class="btn" type="submit" name='login' >Login</button>
		</form>
		
        </body>

        <?php
		    include('searchbar.php');
	    ?>
</html>