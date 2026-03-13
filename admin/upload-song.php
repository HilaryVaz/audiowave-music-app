<?php
include("../config/db.php");

if(isset($_POST['upload'])){

$title = mysqli_real_escape_string($conn, $_POST['title']);
$artist = mysqli_real_escape_string($conn, $_POST['artist']);
$genre = mysqli_real_escape_string($conn, $_POST['genre']);
$lyrics = mysqli_real_escape_string($conn, $_POST['lyrics']);

$song = $_FILES['song']['name'];
$cover = $_FILES['cover']['name'];

$tmp_song = $_FILES['song']['tmp_name'];
$tmp_cover = $_FILES['cover']['tmp_name'];

move_uploaded_file($tmp_song,"../assets/uploads/songs/".$song);
move_uploaded_file($tmp_cover,"../assets/uploads/covers/".$cover);

$query = "INSERT INTO songs(title,artist,genre,file_path,cover_image,lyrics)
VALUES('$title','$artist','$genre','$song','$cover','$lyrics')";

mysqli_query($conn,$query);

echo "<script>alert('Song Uploaded Successfully');</script>";

}
?>

<!DOCTYPE html>
<html>
<head>

<title>Upload Song - AudioWave</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
background:#121212;
color:white;
font-family:Arial;
}

.upload-box{
width:500px;
margin:60px auto;
padding:30px;
background:#1e1e1e;
border-radius:10px;
}

.logo{
text-align:center;
font-size:28px;
font-weight:bold;
color:#22c55e;
margin-bottom:20px;
}

</style>

</head>

<body>

<div class="upload-box">

<div class="logo">🎧 AudioWave</div>

<h4 class="text-center mb-4">Upload Song</h4>

<form method="POST" enctype="multipart/form-data">

<div class="mb-3">
<input type="text" name="title" class="form-control" placeholder="Song Title" required>
</div>

<div class="mb-3">
<input type="text" name="artist" class="form-control" placeholder="Artist Name" required>
</div>

<div class="mb-3">
<input type="text" name="genre" class="form-control" placeholder="Genre" required>
</div>

<div class="mb-3">
<input type="file" name="song" class="form-control" required>
</div>

<div class="mb-3">
<input type="file" name="cover" class="form-control" required>
</div>

<div class="mb-3">
<textarea name="lyrics" class="form-control" placeholder="Song Lyrics"></textarea>
</div>

<button class="btn btn-success w-100" name="upload">
Upload Song
</button>

</form>

</div>

</body>
</html>