<?php
    $serverName = "localhost";
    $connectionOptions = array(
        "Database" => "IWork",
        "Uid" => "sa",
        "PWD" => "Th3fuckdude"
    );
    //Establishes the connection
    $conn = sqlsrv_connect($serverName, $connectionOptions);	
?>