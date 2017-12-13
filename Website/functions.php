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
            <div class='card mb-3' style='width: 21%; display: inline-block; align-items: center'>
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
        $getUserInfo = sqlsrv_query($conn, $query);  
        if(!sqlsrv_has_rows($getUserInfo)) return TRUE;
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
        $getUserInfo = sqlsrv_query($conn, $query);  
        if(!sqlsrv_has_rows($getUserInfo)) return TRUE;
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
        $getUserInfo = sqlsrv_query($conn, $q);
        dieIfFalse($getUserInfo, "<p class='diepar'>No Results are found!</p>");
        dieIfNoRows($getUserInfo, "<p class='diepar'>No Results are found!</p>");
        echo "<div id='viewCompany' class='list-group' style='width: 21%; margin: auto'>
        <div class='list-group-item'>
        <h2 class='list-group-item-heading'>$companyname</h2>
        <p class='list-group-item-text'><h5 style='color: #34B3A0'>Address: </h5>$companyaddress</p>
        <h3 class='list-group-item-heading'>Departments:</h3>";
          
          while ($row = sqlsrv_fetch_array($getUserInfo, SQLSRV_FETCH_ASSOC))
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
        $getUserInfo = sqlsrv_query($conn, $q);
        dieIfFalse($getUserInfo, "<p class='diepar'>No Results are found!</p>");
        dieIfNoRows($getUserInfo, "<p class='diepar'>No Results are found!</p>");
        echo "<div id='viewCompany' class='list-group' style='width: 21%; margin: auto'>
        <div class='list-group-item'>
        <h2 class='list-group-item-heading'>$depname</h2>
        <p class='list-group-item-text'><h5 style='color: #34B3A0'>Code: </h5>$depcode</p>
        <p class='list-group-item-text'><h5 style='color: #34B3A0'>Address: </h5>$companyaddress</p>
        <h3 class='list-group-item-heading'>Jobs Available:</h3>";
        while ($row = sqlsrv_fetch_array($getUserInfo, SQLSRV_FETCH_ASSOC))
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

    function viewUserProfile($username, $conn)
    {
        $q = "EXEC ViewUserInfo '$username'";
        $q2 = "SELECT username FROM StaffMembers WHERE username = '$username'";
        $getUserInfo = sqlsrv_query($conn, $q);
        $checkIfStaffMember = sqlsrv_query($conn, $q2);
        dieIfFalse($getUserInfo, "<p class='diepar'>Error, Can not view user profile</p>");
        dieIfNoRows($getUserInfo, "<p class='diepar'>Error, Can not view user profile</p>");
        $ifJobSeeker        = "SELECT username FROM Users WHERE dbo.Check_User_Role('$username') = 'JobSeeker' AND username = '$username'";
        $ifRegularEmployee  = "SELECT username FROM Users WHERE dbo.Check_User_Role('$username') = 'RegularEmployee' AND username = '$username'";
        $ifManager          = "SELECT username FROM Users WHERE dbo.Check_User_Role('$username') = 'Manager' AND username = '$username'";
        $getJobSeeker       = sqlsrv_query($conn, $ifJobSeeker);
        $getRegularEmployee = sqlsrv_query($conn, $ifRegularEmployee);
        $getManager         = sqlsrv_query($conn, $ifManager);
        $jobSeeker          = sqlsrv_fetch_array($getJobSeeker, SQLSRV_FETCH_ASSOC)['username'];
        $regularEmployee    = sqlsrv_fetch_array($getRegularEmployee, SQLSRV_FETCH_ASSOC)['username'];
        $manager            = sqlsrv_fetch_array($getManager, SQLSRV_FETCH_ASSOC)['username'];
        if (isset($checkIfStaffMember)) // StaffMember
        {
            while ($row = sqlsrv_fetch_array($getUserInfo, SQLSRV_FETCH_ASSOC))
            {
                $experience_years    = $row['experience_years'];
                $email               = $row['email'];
                $birth_date          = $row['birth_date'];
                $first_name          = $row['first_name'];
                $middle_name         = $row['middle_name'];
                $last_name           = $row['last_name'];
                $age                 = $row['age'];
                // StaffMember attributes
                $salary              = $row['salary'];
                $annual_leaves       = $row['annual_leaves'];
                $day_off             = $row['day_off'];
                $staff_company_email = $row['staff_company_email'];
                $company_name        = $row['company_name'];
                $company_address     = $row['company_address'];
                $department_code     = $row['department_code'];
                $job_title           = $row['job_title'];
                echo "
                <div class='card mb-3' style='width: 21%; margin: auto'>
                <h3 class='card-header'>$username</h3>
                <div class='card-body'>
                <h5 class='card-title'>$job_title</h5>
                <h6 class='card-subtitle' style='color: #34B3A0'>$staff_company_email</h6>
                </div>
                <div class='card-body'>
                <p class='card-text' style='color: white'>$email</p>
                </div>
                <ul class='list-group list-group-flush'>
                <li class='list-group-item'>First Name: $first_name</li>
                <li class='list-group-item'>Middle Name: $middle_name</li>
                <li class='list-group-item'>Last Name: $last_name</li>
                <li class='list-group-item'>Personal Email: $email</li>
                <li class='list-group-item'>Company Name: $company_name</li>
                <li class='list-group-item'>Company Address: $company_address</li>
                <li class='list-group-item'>Department Code: $department_code</li>
                <li class='list-group-item'>Salary: $salary</li>
                <li class='list-group-item'>Day Off: $day_off</li>
                <li class='list-group-item'>Annual Leaves: $annual_leaves</li>
                <li class='list-group-item'>Experience Years: $experience_years</li>
                <li class='list-group-item'>Age: $age</li>
                </ul>
                <div class='card-body'>";
                if (!empty(manager))
                {
                    echo "<a href='editmprofile.php' class='card-link'>Edit Profile</a>";
                }
                else if (!empty(regularEmployee))
                {
                    echo "<a href='editreprofile.php' class='card-link'>Edit Profile</a>";
                }
                else if(!empty(jobSeeker))
                {
                    echo "<a href='editjsprofile.php' class='card-link'>Edit Profile</a>";
                }
                echo"</div></div>";
            }
        }
        else // JobSeeker only
        {
            while ($row = sqlsrv_fetch_array($getUserInfo, SQLSRV_FETCH_ASSOC))
            {
                $experience_years = $row['experience_years'];
                $email            = $row['email'];
                $birth_date       = $row['birth_date'];
                $first_name       = $row['first_name'];
                $middle_name      = $row['middle_name'];
                $last_name        = $row['last_name'];
                $age              = $row['age'];
                echo "
                <div class='card mb-3' style='width: 21%; display: inline-block; align-items: center'>
                <h3 class='card-header'>$username</h3>
                <div class='card-body'>
                <h5 class='card-title'>$email</h5>
                <h6 class='card-subtitle' style='color: #34B3A0'>ExperienceYears: $experience_years</h6>
                </div>
                <div class='card-body'>
                <p class='card-text' style='color: white'>Birthdate: $birth_date</p>
                </div>
                <ul class='list-group list-group-flush'>
                <li class='list-group-item'>First Name: $first_name</li>
                <li class='list-group-item'>Middle Name: $middle_name</li>
                <li class='list-group-item'>Last Name: $last_name</li>
                </ul>
                <div class='card-body'>
                <a href='editprofile.php' class='card-link'>Edit Profile</a>
                </div>
                </div>";
            }
        }
        
    }

    function viewJobInfo($title, $companyname, $companyaddress, $depname, $shortdes, $detaileddes, $exp, $hrs, $salary, $vacancies)
    {
        echo "
        <div class='card mb-3' style='width: 21%; display: inline-block; align-items: center'>
        <h3 class='card-header'>$title</h3>
        <div class='card-body'>
        <p class='card-text' style='color: white'>$companyname</p>        
        <p class='card-text' style='color: white'>$companyaddress</p>
        <p class='card-text' style='color: white'>$depname</p>
        </div>
        <ul class='list-group list-group-flush'>
        <li class='list-group-item'>Short Description: $shortdes</li>
        <li class='list-group-item'>Detailed Description: $detaileddes</li>
        <li class='list-group-item'>Experience Years: $exp</li>
        <li class='list-group-item'>Working Hours: $hrs</li>
        <li class='list-group-item'>Salary: $salary</li>
        <li class='list-group-item'>Vacancies: $vacancies</li>
        </ul>
        </div>";
    }

    function viewCompanyWithSalary($name, $address, $domain_name, $vision, $email, $field, $type, $avgSalary)
    {
        $avgSalary = number_format($avgSalary);
        echo "
        <div class='card mb-3' style='width: 21%; display: inline-block; align-items: center'>
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
        <li class='list-group-item'>Average Salaries: $avgSalary </li>
        </ul>
        <div class='card-body'>
        <a href='showdepartments.php?company=$name&address=$address' class='card-link'>Departments</a>
        </div>
    </div>"; 
    }

    function editUserProfile($username, $conn)
    {
        $phpself = $_SERVER['PHP_SELF'];
        echo "<form role='form' class='form-signin' action='$phpself' method='POST'>
            <div class='form-group'>
                <p class='formtitles' >Password</p>
                <input class='form-control' type='text' name='password' placeholder='password'>
            </div>
            <div class='form-group'>
                <p class='formtitles' >Experience Years</p>
                <input id='exyears' class='form-control' type='text' name='experience_years' placeholder='experience years'>
            </div>
            <div class='form-group'>
                <p class='formtitles' >First Name</p>
                <input id='firstname' class='form-control' type='text' name='first_name' placeholder='first name'>
            </div>
            <div class='form-group'>
                <p class='formtitles' >Middle Name</p>
                <input id='middlename' class='form-control' type='text' name='middle_name' placeholder='middle name'>
            </div>
            <div class='form-group'>
                <p class='formtitles' >Last Name</p>
                <input id='lastname' class='form-control' type='text' name='last_name' placeholder='last name'>
            </div>
        
            <button id='editbtn' class='btn' type='submit' name='edit' >Save</button>
        </form>";
    }

?>