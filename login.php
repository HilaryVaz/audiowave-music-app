<?php
session_start();
include("config/db.php");

if(isset($_POST['login'])){

    $username = $_POST['username'];
    $password = $_POST['password'];

    $query = "SELECT * FROM users WHERE username='$username'";
    $result = mysqli_query($conn,$query);

    if(mysqli_num_rows($result) == 1){

        $user = mysqli_fetch_assoc($result);

        if(password_verify($password,$user['password'])){

            $_SESSION['user_id'] = $user['id'];
            $_SESSION['username'] = $user['username'];

            header("Location: dashboard.php");

        }else{
            echo "<script>alert('Incorrect Password');</script>";
        }

    }else{
        echo "<script>alert('User not found');</script>";
    }

}
?>

<!DOCTYPE html>
<html>
<head>

<title>AudioWave Login</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
background:#121212;
color:white;
font-family:Arial;
}

.login-box{
width:400px;
margin:120px auto;
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

<div class="login-box">

<div class="logo">

🎧 <span>AudioWave</span>

</div>

<h4 class="text-center mb-4">Login</h4>

<form method="POST">

<div class="mb-3">
<input type="text" name="username" class="form-control" placeholder="Username" required>
</div>

<div class="mb-3">
<input type="password" name="password" class="form-control" placeholder="Password" required>
</div>

<button class="btn btn-success w-100" name="login">
Login
</button>

<br><br>

<p class="text-center">
Don't have account?
<a href="register.php">Register</a>
</p>

</form>

</div>

</body>
</html>