<?php
    function dieIfFalse($query, $msg)
    {
        if ($query == FALSE or !sqlsrv_has_rows($query))
        {
            die($msg);
        }
    }

    function viewCompanyInfo($name, $address, $domain_name, $vision, $email, $field, $type)
    {
        echo "<div id='viewCompany' class='list-group'>
        <div class='list-group-item'>
          <a href='#' ><h2 class='list-group-item-heading'>$name</h2></a>
          <p class='list-group-item-text'><h5 style='color: #34B3A0'>Address: </h5>$address</p>
          <p class='list-group-item-text'><h5 style='color: #34B3A0'>DomainName: </h5>$domain_name</p>
          <p class='list-group-item-text'><h5 style='color: #34B3A0'>Vision: </h5>$vision</p>
          <p class='list-group-item-text'><h5 style='color: #34B3A0'>Email: </h5>$email</p>
          <p class='list-group-item-text'><h5 style='color: #34B3A0'>Field: </h5>$field</p>
          <p class='list-group-item-text'><h5 style='color: #34B3A0'>Type: </h5>$type</p>
        </div></div>";
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
                        "<div class='alert alert-dismissible alert-danger'>
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
                        "<div class='alert alert-dismissible alert-danger'>
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

?>