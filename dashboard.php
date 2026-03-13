<?php
session_start();

if(!isset($_SESSION['user_id'])){
    header("Location: login.php");
    exit();
}
?>

<!DOCTYPE html>
<html>
<head>

<title>AudioWave Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
background:#121212;
color:white;
font-family:Arial;
}

.navbar{
background:#1e1e1e;
padding:15px;
}

.logo{
font-size:24px;
font-weight:bold;
color:#22c55e;
}

</style>

</head>

<body>

<nav class="navbar d-flex justify-content-between">

<div class="logo">
🎧 AudioWave
</div>

<div>
Welcome, <?php echo $_SESSION['username']; ?> |
<a href="logout.php" class="text-danger">Logout</a>
</div>

</nav>

<div class="container mt-5">

<h2>Welcome to AudioWave 🎵</h2>

<p>Your music streaming dashboard is working!</p>

</div>

</body>
</html>