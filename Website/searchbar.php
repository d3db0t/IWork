<?php
    $getSearchBar = $_POST["searchbar"];
    if($_POST["jobsORcompanies"] == "1")
    {    
        if ($_POST["dropdownmenu"] == "1")
        {
            $q = "EXEC CompaniesByName '$getSearchBar'";
            $getResults = sqlsrv_query($conn, $q);
            dieIfFalse($getResults, "<p class='diepar'>No Results are found!</p>");
            dieIfNoRows($getResults, "<p class='diepar'>No Results are found!</p>");
            while ($row = sqlsrv_fetch_array($getResults, SQLSRV_FETCH_ASSOC)) {
                #echo "<h2>" . $row['name'] . "</h2>" . PHP_EOL;
                viewCompanyInfo($row['name'], $row['address'], $row['domain_name'], $row['vision'], $row['email'], $row['field'], $row['type']);
            }
        }

        else if ($_POST["dropdownmenu"] == "2")
        {
            $q = "EXEC CompaniesByAddress '$getSearchBar'";
            $getResults = sqlsrv_query($conn, $q);
            dieIfFalse($getResults, "<p class='diepar'>No Results are found!</p>");
            dieIfNoRows($getResults, "<p class='diepar'>No Results are found!</p>");
            while ($row = sqlsrv_fetch_array($getResults, SQLSRV_FETCH_ASSOC)) {
                #echo "<h2>" . $row['address'] . "</h2>" . PHP_EOL;
                viewCompanyInfo($row['name'], $row['address'], $row['domain_name'], $row['vision'], $row['email'], $row['field'], $row['type']);
            }
        }

        else if ($_POST["dropdownmenu"] == "3")
        {
            $q = "EXEC CompaniesByType '$getSearchBar'";
            $getResults = sqlsrv_query($conn, $q);
            dieIfFalse($getResults, "<p class='diepar'>No Results are found!</p>");
            dieIfNoRows($getResults, "<p class='diepar'>No Results are found!</p>");
            while ($row = sqlsrv_fetch_array($getResults, SQLSRV_FETCH_ASSOC)) {
                #echo "<h2>" . $row['type'] . "</h2>" . PHP_EOL;
                viewCompanyInfo($row['name'], $row['address'], $row['domain_name'], $row['vision'], $row['email'], $row['field'], $row['type']);
            }
        }

        else
        {
            dieIfFalse(false, "<p class='diepar'>No Results are found!</p>");
        }
    }
    else if($_POST["jobsORcompanies"] == "2")
    {
        $query = "EXEC SearchForJobs '$getSearchBar'";
        $getResults = sqlsrv_query($conn, $query);
        dieIfFalse($getResults, "<p class='diepar'>No Results are found!</p>");
        dieIfNoRows($getResults, "<p class='diepar'>No Results are found!</p>");
        while ($row = sqlsrv_fetch_array($getResults, SQLSRV_FETCH_ASSOC))
            viewJobInfo($row["title"], $row["company_name"], $row["company_address"], $row["name"], $row["short_description"], $row["detailed_description"], $row["experience_years"], $row["working_hours"], $row["salary"], $row["vacancies"]);        
    }
    else
        dieIfFalse(false, "<p class='diepar'>No Results are found!</p>");
    
    sqlsrv_free_stmt($getResults);
    sqlsrv_close( $conn );			
?>