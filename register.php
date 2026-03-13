<?php
include("config/db.php");

if(isset($_POST['register'])){

    $name = $_POST['name'];
    $email = $_POST['email'];
    $username = $_POST['username'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

    $query = "INSERT INTO users(name,email,username,password)
              VALUES('$name','$email','$username','$password')";

    if(mysqli_query($conn,$query)){
        echo "<script>alert('Registration Successful!');</script>";
    }else{
        echo "<script>alert('Error occurred');</script>";
    }
}
?>

<!DOCTYPE html>
<html>
<head>

<title>AudioWave Register</title>

<link rel="stylesheet" href="assets/css/style.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
background:#121212;
color:white;
font-family:Arial;
}

.register-box{
width:400px;
margin:100px auto;
padding:30px;
background:#1e1e1e;
border-radius:10px;
}

.logo{
display:flex;
align-items:center;
justify-content:center;
gap:10px;
font-size:30px;
font-weight:bold;
color:#22c55e;
margin-bottom:20px;
}

</style>

</head>

<body>

<div class="register-box">

<div class="logo">

<svg width="40" height="40" viewBox="0 0 24 24" fill="none">
<path d="M12 3C7 3 3 7 3 12v6h3v-6a6 6 0 0112 0v6h3v-6c0-5-4-9-9-9z" fill="#22c55e"/>
<rect x="7" y="13" width="2" height="5" fill="#22c55e"/>
<rect x="11" y="11" width="2" height="7" fill="#22c55e"/>
<rect x="15" y="13" width="2" height="5" fill="#22c55e"/>
</svg>

<span>AudioWave</span>

</div>

<h4 class="text-center mb-4">Create Account</h4>

<form method="POST">

<div class="mb-3">
<input type="text" name="name" class="form-control" placeholder="Full Name" required>
</div>

<div class="mb-3">
<input type="email" name="email" class="form-control" placeholder="Email" required>
</div>

<div class="mb-3">
<input type="text" name="username" class="form-control" placeholder="Username" required>
</div>

<div class="mb-3">
<input type="password" name="password" class="form-control" placeholder="Password" required>
</div>

<button class="btn btn-success w-100" name="register">
Register
</button>

<br><br>

<p class="text-center">
Already have account?
<a href="login.php">Login</a>
</p>

</form>

</div>

</body>
</html>