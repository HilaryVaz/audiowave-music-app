<?php
session_start();
include("config/db.php");

if(isset($_POST['playlist_id']) && isset($_POST['song_id'])){

$playlist_id = $_POST['playlist_id'];
$song_id = $_POST['song_id'];

$query = "INSERT INTO playlist_songs (playlist_id, song_id)
VALUES ('$playlist_id','$song_id')";

mysqli_query($conn,$query);

}

header("Location: music.php");
exit();
?>