<?php
    session_start();
    include('dbconfig.php');
    include('functions.php');
    if(!$conn) displayDBError();
    redirectUserByRole($_SESSION["username"], $conn);
?>