<?php
session_start();
include("config/db.php");

if(!isset($_SESSION['user_id'])){
header("Location: login.php");
exit();
}

$playlist_id = $_GET['id'];

$query = "SELECT songs.* FROM playlist_songs 
JOIN songs ON playlist_songs.song_id = songs.id 
WHERE playlist_songs.playlist_id = '$playlist_id'";

$result = mysqli_query($conn,$query);
?>

<!DOCTYPE html>
<html>
<head>

<title>Playlist Songs</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
background:#121212;
color:white;
font-family:Arial;
}

.song-card{
background:#1e1e1e;
padding:15px;
border-radius:10px;
margin-bottom:20px;
}

.song-card img{
width:100%;
border-radius:8px;
}

audio{
width:100%;
margin-top:10px;
}

</style>

</head>

<body>

<div class="container mt-5">

<h2>🎧 Playlist Songs</h2>

<div class="row">

<?php while($row = mysqli_fetch_assoc($result)){ ?>

<div class="col-md-3">

<div class="song-card">

<img src="assets/uploads/covers/<?php echo $row['cover_image']; ?>">

<h5 class="mt-2"><?php echo $row['title']; ?></h5>

<p><?php echo $row['artist']; ?></p>

<audio controls>
<source src="assets/uploads/songs/<?php echo $row['file_path']; ?>" type="audio/mpeg">
</audio>

</div>

</div>

<?php } ?>

</div>

</div>

</body>
</html>