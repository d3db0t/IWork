<?php
    function dieIfFalse($query, $msg)
    {
        if($query == FALSE) die($msg);
    }

    function dieIfNoRows($query, $msg)
    {
        if(!sqlsrv_has_rows($query)) die($msg);
    }

    function viewCompanyInfo($name, $address, $domain_name, $vision, $email, $field, $type)
    {
        echo "
            <div class='card mb-3'>
            <h3 class='card-header'>$name</h3>
            <div class='card-body'>
            <h5 class='card-title'>$domain_name</h5>
            <h6 class='card-subtitle' style='color: #34B3A0'>$email</h6>
            </div>
            <div class='card-body'>
            <p class='card-text' style='color: white'>$address</p>
            </div>
            <ul class='list-group list-group-flush'>
            <li class='list-group-item'>Vision: $vision</li>
            <li class='list-group-item'>Field: $field</li>
            <li class='list-group-item'>Type: $type</li>
            </ul>
            <div class='card-body'>
            <a href='showdepartments.php?company=$name&address=$address' class='card-link'>Departments</a>
            </div>
        </div>";
        /*
        echo "<div id='viewCompany' class='list-group'>
        <div class='list-group-item'>
          <a href='showdepartments.php?company=$name&address=$address' ><h2 class='list-group-item-heading'>$name</h2></a>
          <p class='list-group-item-text'><h5 style='color: #34B3A0'>Address: </h5>$address</p>
          <p class='list-group-item-text'><h5 style='color: #34B3A0'>DomainName: </h5>$domain_name</p>
          <p class='list-group-item-text'><h5 style='color: #34B3A0'>Vision: </h5>$vision</p>
          <p class='list-group-item-text'><h5 style='color: #34B3A0'>Email: </h5>$email</p>
          <p class='list-group-item-text'><h5 style='color: #34B3A0'>Field: </h5>$field</p>
          <p class='list-group-item-text'><h5 style='color: #34B3A0'>Type: </h5>$type</p>
        </div></div>";
        */
    }

    function displayDBError(){
        die
        (
            "<div class='alert alert-dismissible alert-danger'>
            <button type='button' class='close' data-dismiss='alert'>&times;</button>
            <strong>Oh snap!</strong> Failed to connect to the Database! 
            <a href='index.php' class='alert-link'>Click here to try again</a></div>"
        );
    }

    function noEmptyFields($attributes)
    {
        foreach($attributes as $key => $value)
            if(empty($value)) 
                if($key == "experience" && $value == 0) continue;
                else
                {
                    die
                    (
                        "<div class='alert alert-dismissible alert-warning'>
                        <button type='button' class='close' data-dismiss='alert'>&times;</button>
                        <strong>Oh snap!</strong> Please fill in all fields! </div>"
                    );
                }
            else
            {
                if(($key == "birthday" && $value == "birthday") 
                    || ($key == "birthmonth" && $value == "birthmonth") 
                    || ($key == "birthyear" && $value == "birthyear"))
                {
                    die
                    (
                        "<div class='alert alert-dismissible alert-warning'>
                        <button type='button' class='close' data-dismiss='alert'>&times;</button>
                        <strong>Oh snap!</strong> Please fill in all fields! </div>"
                    );  
                }
            }
        
        return TRUE;
    }

    function uniqueUsername($username, $conn)
    {
        $query = "SELECT * FROM Users WHERE username = '$username'";
        $getResults = sqlsrv_query($conn, $query);  
        if(!sqlsrv_has_rows($getResults)) return TRUE;
        else
        {
            die
            (
                "<div class='alert alert-dismissible alert-danger'>
                <button type='button' class='close' data-dismiss='alert'>&times;</button>
                <strong>Oh snap!</strong> Please choose another username! </div>"
            );
        }    
    }

    function uniqueEmail($email, $conn)
    {
        $query = "SELECT * FROM Users WHERE email = '$email'";
        $getResults = sqlsrv_query($conn, $query);  
        if(!sqlsrv_has_rows($getResults)) return TRUE;
        else
        {
            die
            (
                "<div class='alert alert-dismissible alert-danger'>
                <button type='button' class='close' data-dismiss='alert'>&times;</button>
                <strong>Oh snap!</strong> Cannot sign with the same email twice! </div>"
            );
        }  
    }

    function redirectUserByRole($username, $conn)
    {
        $ifJobSeeker        = "SELECT username FROM Users WHERE dbo.Check_User_Role('$username') = 'JobSeeker' AND username = '$username'";
        $ifRegularEmployee  = "SELECT username FROM Users WHERE dbo.Check_User_Role('$username') = 'RegularEmployee' AND username = '$username'";
        $ifManager          = "SELECT username FROM Users WHERE dbo.Check_User_Role('$username') = 'Manager' AND username = '$username'";
        $getJobSeeker       = sqlsrv_query($conn, $ifJobSeeker);
        $getRegularEmployee = sqlsrv_query($conn, $ifRegularEmployee);
        $getManager         = sqlsrv_query($conn, $ifManager);
        $jobSeeker          = sqlsrv_fetch_array($getJobSeeker, SQLSRV_FETCH_ASSOC)['username'];
        $regularEmployee    = sqlsrv_fetch_array($getRegularEmployee, SQLSRV_FETCH_ASSOC)['username'];
        $manager            = sqlsrv_fetch_array($getManager, SQLSRV_FETCH_ASSOC)['username'];
        if (!empty($jobSeeker))
        {
            header("Location: jsprofile.php");
        }
        else if (!empty($regularEmployee))
        {
            header("Location: reprofile.php");
        }
        else if (!empty($manager))
        {
            header("Location: mprofile.php");
        }
        else
        {
            header("Location: index.php");
        }
    }

    function showDepartments($companyname, $companyaddress, $conn)
    {
        $q          = "EXEC CompanyWithDepartments '$companyname'";
        $getResults = sqlsrv_query($conn, $q);
        dieIfFalse($getResults, "<p class='diepar'>No Results are found!</p>");
        dieIfNoRows($getResults, "<p class='diepar'>No Results are found!</p>");
        echo "<div id='viewCompany' class='list-group'>
        <div class='list-group-item'>
        <h2 class='list-group-item-heading'>$companyname</h2>
        <p class='list-group-item-text'><h5 style='color: #34B3A0'>Address: </h5>$companyaddress</p>
        <h3 class='list-group-item-heading'>Departments:</h3>";
          
          while ($row = sqlsrv_fetch_array($getResults, SQLSRV_FETCH_ASSOC))
          {
              $depname = $row['name'];
              $code = substr($row['code'], -2); 
              echo "<h5 style='color: #34B3A0'>Name: </h5><a href='showdepartmentinfo.php?company=$companyname&address=$companyaddress&code=$code&depname=$depname'><p class='list-group-item-text'>" . 
              $row['name'] . "</p></a><p class='list-group-item-text'><h5 style='color: #34B3A0'>Code: </h5>" . 
              $row['code'] . "</p>";
          }

          echo "</div></div>";
    }

    function showDepartmentInfo($companyname, $companyaddress, $depcode, $depname, $conn)
    {
        $depcode = '#' . $depcode;
        $q = "EXEC DepartmentVacancies '$companyname', '$companyaddress', '$depcode'";
        $getResults = sqlsrv_query($conn, $q);
        dieIfFalse($getResults, "<p class='diepar'>No Results are found!</p>");
        dieIfNoRows($getResults, "<p class='diepar'>No Results are found!</p>");
        echo "<div id='viewCompany' class='list-group'>
        <div class='list-group-item'>
        <h2 class='list-group-item-heading'>$depname</h2>
        <p class='list-group-item-text'><h5 style='color: #34B3A0'>Code: </h5>$depcode</p>
        <p class='list-group-item-text'><h5 style='color: #34B3A0'>Address: </h5>$companyaddress</p>
        <h3 class='list-group-item-heading'>Jobs Available:</h3>";
        while ($row = sqlsrv_fetch_array($getResults, SQLSRV_FETCH_ASSOC))
        {
            echo "<h4>[Title] </h4><p class='list-group-item-text'>" . 
            $row['title'];
            echo "</p><p class='list-group-item-text'><h5 style='color: #34B3A0'>Short Description: </h5>" . 
            $row['short_description'];
            echo "</p><p class='list-group-item-text'><h5 style='color: #34B3A0'>Detailed Description: </h5>" . 
            $row['detailed_description'];
            echo "</p><p class='list-group-item-text'><h5 style='color: #34B3A0'>Experience Years: </h5>" . 
            $row['experience_years'];
            echo "</p><p class='list-group-item-text'><h5 style='color: #34B3A0'>Working Hours: </h5>" . 
            $row['working_hours'];
            echo "</p><p class='list-group-item-text'><h5 style='color: #34B3A0'>Salary: </h5>" . 
            $row['salary'];
            //echo "</p><p class='list-group-item-text'><h5 style='color: #34B3A0'>Application Deadline: </h5>" . 
            //$row['application_deadline'];
            echo "</p><p class='list-group-item-text'><h5 style='color: #34B3A0'>Vacancies: </h5>" . 
            $row['vacancies'] . "</p>";
        }

        echo "</div></div>";
    }

?>