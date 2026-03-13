<?php
session_start();
include("config/db.php");

if(!isset($_SESSION['user_id'])){
header("Location: login.php");
exit();
}

$user_id = $_SESSION['user_id'];

if(isset($_POST['create_playlist'])){
    
$name = $_POST['playlist_name'];

$query = "INSERT INTO playlists(user_id,playlist_name)
VALUES('$user_id','$name')";

mysqli_query($conn,$query);

}

$result = mysqli_query($conn,"SELECT * FROM playlists WHERE user_id='$user_id'");
?>

<!DOCTYPE html>
<html>
<head>

<title>AudioWave Playlists</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
background:#121212;
color:white;
font-family:Arial;
}

.container{
margin-top:50px;
}

.playlist-card{
background:#1e1e1e;
padding:20px;
border-radius:10px;
margin-bottom:15px;
cursor:pointer;
}

.playlist-card:hover{
background:#2a2a2a;
}

.playlist-link{
text-decoration:none;
color:white;
display:block;
}

</style>

</head>

<body>

<div class="container">

<h2>🎵 Your Playlists</h2>

<form method="POST" class="mb-4">

<input type="text" name="playlist_name" class="form-control" placeholder="Playlist Name" required>

<br>

<button class="btn btn-success" name="create_playlist">
Create Playlist
</button>

</form>

<?php while($row = mysqli_fetch_assoc($result)){ ?>

<a href="view-playlist.php?id=<?php echo $row['id']; ?>" class="playlist-link">

<div class="playlist-card">
<h5><?php echo $row['playlist_name']; ?></h5>
</div>

</a>
<form method="POST" action="delete-playlist.php" 
onsubmit="return confirm('Are you sure you want to delete this playlist?');">

<input type="hidden" name="playlist_id" value="<?php echo $row['id']; ?>">

<button class="btn btn-danger btn-sm">
<i class="bi bi-trash"></i> Delete
</button>

</form>
<?php } ?>

</div>

</body>
</html>
