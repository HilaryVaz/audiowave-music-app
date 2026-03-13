<?php
session_start();
include("config/db.php");

if(!isset($_SESSION['user_id'])){
header("Location: login.php");
exit();
}

$user_id = $_SESSION['user_id'];
$song_id = $_POST['song_id'];

$query = "INSERT INTO favorites(user_id,song_id)
VALUES('$user_id','$song_id')";

mysqli_query($conn,$query);

header("Location: music.php");
?>