<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>

<?php 

         $Server="localhost";
		 $username="prajna";
		 $psrd="prajna123";
		 $dbname = "voting";
		 $connection= mysqli_connect($Server,$username,$psrd,$dbname);

         $name     =$_POST['Name'];
         $uname    =$_POST['uName'];
         $Password =$_POST['Pass'];
         $email    =$_POST['email'];
         $phone    =$_POST['Phone'];
         $dob      =$_POST['DOB'];
         $gender   =$_POST['gender'];
         $address  =$_POST['Address'];


         $destination = "Photo/".$_FILES['image']['name'];
         $filename    = $_FILES['image']['tmp_name'];  

         move_uploaded_file($filename, $destination);

         $query="insert into voter (VoterName,VoterUserName,Password,Email,Mobile,DOB,Gender,Address,Photo) values('$name','$uname','$Password','$email','$phone','$dob','$gender','$address','$destination')";
         $ret= mysqli_query($connection,$query);
      
        echo '<script language="javascript">';
        echo 'alert("Registration successfully")';
        echo '</script>';
        header("Location:UserLogin.php");

?>

</body>
</html>