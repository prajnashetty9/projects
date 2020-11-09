
<?php

     $Server="localhost";
     $username="prajna";
     $psrd="prajna123";
     $dbname = "voting";
     $connection= mysqli_connect($Server,$username,$psrd,$dbname);

?>


<!DOCTYPE html>
<html lang="en">
<head>
  <title>Home Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <script src="bootstrap/js/bootstrap.min.js"></script>

  <style>

body {
   background-color:#2F4F4F;

     font-family: Agency FB;
}


h2 {
  margin-top: 2px;
  margin-bottom: 2px;
}

.container { max-width: 360px; }

.divider {
  text-align: center;
  margin-top: 20px;
  margin-bottom: 5px;
}

.divider hr {
  margin: 7px 0px;
  width: 35%;
}

.left { float: left; }

.right { float: right; }

#heading
{
 text-align:center;
 margin-top:10px;
 font-size:30px;
 color:#228B22;
}
#election
{
 width:400px;
 background-color:#6A5ACD;
 padding:2px;
 height:40px;
 border-radius:5px;
 box-shadow:0px 0px 10px 0px grey;
}

select
{
 width:400px;
 height:40px;
 border:1px solid #20B2AA;
 margin-top:20px;
 padding:2px;
 font-size:20px;
 color:grey;
 border-radius:5px;

}


</style>

<script>
  
  function validform()
  {

   
   if(document.getElementById("election").value == "Select Election")
   {
      alert("Please select Election Title"); // prompt user
     // document.getElementById("election").focus(); //set focus back to control
      return false;
   }
  // return true;
  }

</script>
</head>

<body>

<?php

   
   
if ($_SERVER["REQUEST_METHOD"] == "POST") {

     
     $ec=$_POST['election'];

     session_start();
     $_SESSION['election']=$ec;
      header("Location:Uvote.php");

}
?>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Election.Com</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="UserAccount.php"><b>&nbsp&nbsp&nbsp&nbsp Home</b></a></li>
      <li><a href="UserUpdate.php"><b>Update Profile</b></a></li>
      <li class="active"><a href="UViewElection.php"><b>View Election</b></a></li>
      <li><a href="UViewResult.php"><b>View Result</b></a></li>
    </ul>
	
   <ul class="nav navbar-nav navbar-right">
      <li><a href="UserLogout.php"><span class="glyphicon glyphicon-user"></span> <b>Logout</b></a></li>    
    </ul>
  </div>
</nav>



<p id="heading">Select Election Title</p>
<center>
<form method="POST" name="ElectionForm">
<br><div align="center">

 <select name="election" id="election" onchange="fetch_select(this.value);">
 <option hidden>Select Election</option>
  <?php
    

  $select=mysqli_query($connection,"select Etitle from setec group by Etitle");

  while($row=mysqli_fetch_array($select))
  {
   echo "<option>".$row['Etitle']."</option>";
  }
  
 ?>
 </select><br>

</div>   
</center>
<p style=" margin: -2.7% 10% 10% 68%">
<button type="submit" class="btn btn-primary"  onclick="return validform()">Vote Now</button>
</form>
</p>
</body>
</html>

