
<?php 

    
        echo'<tr class="table-success">';
        echo'<th scope="row">';
          echo'ID';
        echo'</th>';
        echo'<th scope="row">';
            echo'Questions';
        echo'</th>';
        echo'</tr>';
    $name            =$_SESSION['username'];
    $title_of_job    =$_GET['jobtitle'];
    $comp_name       =$_GET['companyname'];
    $comp_add        =$_GET['companyaddress'];
    $dep             =$_GET['dep'];
    
    $depcode = '#' . $dep;

    echo($name);
    echo($depcode);
    echo($comp_name);
    echo($comp_add);
    echo($title_of_job);

    $applyforjobs = "EXEC ApplyForJob '$name', '$title_of_job', '$comp_name', '$comp_add', '$depcode' ";
    $applied      = sqlsrv_query($conn,$applyforjobs);

    if(isset($applied)){
    echo('<h1>you have applied for job 5alas</h1>');
    
    }else{
      echo('<h1>query failed</h1>');
      
    }

    //$q = "EXEC ViewInterviewQuestions 'Maro', 'Manager - Marketing Director', 'HP', 'California', '#MK'    ";
    $q ="EXEC ViewInterviewQuestions '$name', '$title_of_job', '$comp_name', '$comp_add', $depcode ";
    
    $result  = sqlsrv_query($conn,$q);
    $id = array();
    $n=0;
    $y=0;
    while($seeker = sqlsrv_fetch_array($result)){
   echo '<tr>';
            echo('<td>'.$seeker['id'].'</td>');
            echo('<td>'.$seeker['question'].'</td>');
            echo('<td>
            <button value="0" name="zero[]" type="submit">NO</button>
            <button value="1" name="one[]" type="submit">YES</button>
            
          </select>
                  </td>');
    echo '</tr>';

    array_push($id ,$seeker['id']);
    }

    print_r($id);
    ?>

    <?php 
    $i=0;
    while($i<10){
        if(isset($_POST['zero'])){
            echo('<h1>'.$_POST['zero'][$i].'</h1>') ;
        
        $get_id = $id[$i];
        $value_in = $_POST['zero'][$i];
        $q2 = "EXEC Add_Jobs_Interview_Questions_Proc  '$name' , '$get_id' , '$value_in' ";

        }
        $i++;
    }
    
    ?>
    <?php
    $t=0;
    while($t<10){
        if(isset($_POST['one'])){
            echo('<h1>'.$_POST['one'][$t].'</h1>') ;
        
        $get_id = $id[$t];
        $value_in = $_POST['one'][$t];
        $q2 = "EXEC Add_Jobs_Interview_Questions_Proc  '$name' , '$get_id' , '$value_in' ";
        $ok = sqlsrv_query($conn,$q2);

        if(isset($ok)){
            echo("tmam keda");
        }

        }
        $t++;
    }
     ?>
