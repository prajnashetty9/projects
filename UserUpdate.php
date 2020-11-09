
<?php session_start(); ?>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Home Page</title>
  <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <script src="bootstrap/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="CSS/UserUpdate.css">
  <style type="text/css">
    
body {
  
font-family: Agency FB;
}


  </style>


<script>
  
function ValidateContactForm()
{

 
    var Name=ContactForm.Name;
    var Pass=ContactForm.Password;
    var Email=ContactForm.Email;
    var Phone=ContactForm.Phone;
    var Address=ContactForm.Address


    if (Name.value=="") 
    {
      window.alert("Enter Your Name");
      Email.focus();
      return false;
    }

   if (Pass.value=="") 
    {
      window.alert("Enter Password");
      Pass.focus();
      return false;
    }


    if (Email.value=="") 
    {
      window.alert("Enter Your Email");
      Email.focus();
      return false;
    }

   if (!validateCaseSensitiveEmail(Email.value))
    {
        window.alert("Please enter a valid e-mail address.");
        email.focus();
        return false;
    }
   if (Phone.value=="") 
    {
      window.alert("Enter Your Phone Number");
      Email.focus();
      return false;
    }
    
    return true;

}
function validateCaseSensitiveEmail(email) 
{ 
 var reg = /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/;
 if (reg.test(email)){
 return true; 
}
 else{
 return false;
 } 
} 

</script>

</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Election.Com</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="UserAccount.php"><b>&nbsp&nbsp&nbsp&nbsp Home</b></a></li>
      <li  class="active"><a href="UserUpdate.php"><b>Update Profile</b></a></li>
      <li><a href="UViewElection.php"><b>View Election</b></a></li>
      <li><a href="UViewResult.php"><b>View Result</b></a></li>
    </ul>
  
   <ul class="nav navbar-nav navbar-right">

      <li><a href="UserLogout.php"><span class="glyphicon glyphicon-user"></span> <b>Logout</b></a></li>
      
    </ul>
  </div>
</nav>


<?php
    $uName= $_SESSION['uName'];
     $Pass= $_SESSION['Pass'];

     $Server="localhost";
     $username="prajna";
     $psrd="prajna123";
     $dbname = "voting";
     $connection= mysqli_connect($Server,$username,$psrd,$dbname);
     
     
    
       $query="select * from voter where VoterUserName='$uName' and Password='$Pass'";
    
    
     
      $Complete=mysqli_query($connection,$query) or die("unable to connect");
         
    
    $Rows=mysqli_fetch_array($Complete);

    $name=$Rows['VoterName'];
    $email=$Rows['Email'];
    $phone=$Rows['Mobile'];
    $address=$Rows['Address'];;

?>


<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") 
{
    $uName= $_SESSION['uName'];
    

     $Server="localhost";
     $username="prajna";
     $psrd="prajna123";
     $dbname = "voting";
     $connection= mysqli_connect($Server,$username,$psrd,$dbname);
     
     $name=$_POST['Name'];
     $Password=$_POST['Password'];
     $Email=$_POST['Email'];
     $Phone=$_POST['Phone'];
     $Address=$_POST['Address'];
    
       $query="update voter set VoterName='$name',Password='$Password',Email='$Email',Mobile='$Phone', Address='$Address' where VoterUserName='$uName'";
    
    
     
      $Complete=mysqli_query($connection,$query) or die("unable to connect");
         
}
?>




<div class="container">
    <div class="row">
        <div class="login">
  <div class="login-triangle"></div>
  
  <h2 class="login-header">Update Profile</h2>
  <form class="login-container" method="post" action="" name="ContactForm" onsubmit="return ValidateContactForm();">

     <p><input type="text" name="Name" placeholder="Your Name"value="<?php echo $name;?>"></p>
    <p><input type="password" placeholder="New Password" name="Password"></p>
    <p><input type="Email" name="Email" placeholder="Your Email" value="<?php echo $email;?>"></p>
    <p><input type="text" name="Phone" placeholder="Your Phone Number"value="<?php echo $phone;?>"></p>
    <p><input type="text" name="Address" placeholder="Your Address" value="<?php echo $address;?>"></p>

    <p><input type="submit" value="Update Now"></p>
  </form>
</div>>
    </div>
</div>


</body>
</html>

