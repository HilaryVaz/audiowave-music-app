<?php
session_start();
include("config/db.php");

if(!isset($_SESSION['user_id'])){
    header("Location: login.php");
    exit();
}

$user_id = $_SESSION['user_id'];

/* SEARCH FUNCTION */
$search = "";

if(isset($_GET['search'])){
    $search = mysqli_real_escape_string($conn,$_GET['search']);
    $query = "SELECT * FROM songs 
              WHERE title LIKE '%$search%' 
              OR artist LIKE '%$search%'";
}else{
    $query = "SELECT * FROM songs";
}

$result = mysqli_query($conn,$query);
?>

<!DOCTYPE html>
<html>
<head>

<title>AudioWave Music</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

<style>

body{
background:#121212;
color:white;
font-family:Arial;
padding-bottom:140px;
}

.logo{
display:flex;
align-items:center;
justify-content:center;
gap:10px;
font-size:24px;
font-weight:bold;
color:#22c55e;
margin:20px 0;
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

.music-player{
position:fixed;
bottom:0;
left:0;
width:100%;
background:#000;
padding:15px;
border-top:2px solid #22c55e;
z-index:1000;
}

.music-player audio{
width:60%;
}

#progress{
width:60%;
margin-top:5px;
}

#lyrics-box{
height:200px;
overflow-y:auto;
white-space:pre-line;
}

</style>

</head>

<body>

<!-- NAVBAR -->

<nav class="navbar navbar-dark bg-dark mb-4">
<div class="container">

<a class="navbar-brand text-success fw-bold">
🎧 AudioWave
</a>

<div>

<a href="music.php" class="btn btn-outline-light btn-sm">Home</a>

<a href="favourites.php" class="btn btn-outline-danger btn-sm">
❤️ Favorites
</a>

<a href="playlist.php" class="btn btn-outline-success btn-sm">
🎵 Playlists
</a>

<a href="admin/upload-song.php" class="btn btn-outline-info btn-sm">
⬆ Upload
</a>

</div>

</div>
</nav>

<div class="container">

<!-- SEARCH BAR -->

<form method="GET" class="mb-4">

<div class="input-group">

<input type="text" name="search" class="form-control"
placeholder="Search songs or artists..."
value="<?php echo htmlspecialchars($search); ?>">

<button class="btn btn-success">
🔍 Search
</button>

</div>

</form>

<div class="logo">

<span>AudioWave</span>

</div>

<h3 class="text-center mb-4">Music Library</h3>

<div class="row">

<?php while($row = mysqli_fetch_assoc($result)){ ?>

<div class="col-md-3">

<div class="song-card">

<img src="assets/uploads/covers/<?php echo $row['cover_image']; ?>">

<h5 class="mt-2"><?php echo $row['title']; ?></h5>

<p><?php echo $row['artist']; ?></p>

<!-- PLAY BUTTON -->

<button 
class="btn btn-primary btn-sm mt-2"

onclick="playSong(
'assets/uploads/songs/<?php echo $row['file_path']; ?>',
`<?php echo $row['title']; ?>`,
`<?php echo $row['artist']; ?>`
)">

▶ Play

</button>

<!-- LIKE SONG -->

<?php
$check = mysqli_query($conn,"SELECT * FROM favorites 
WHERE user_id='$user_id' 
AND song_id='".$row['id']."'");

$isLiked = mysqli_num_rows($check) > 0;
?>

<form method="POST" action="toggle-favorite.php">

<input type="hidden" name="song_id" value="<?php echo $row['id']; ?>">

<button class="btn btn-danger btn-sm mt-2">

<?php if($isLiked){ ?>

<i class="bi bi-heart-fill"></i> Unlike

<?php } else { ?>

<i class="bi bi-heart"></i> Like

<?php } ?>

</button>

</form>

<!-- ADD TO PLAYLIST -->

<form method="POST" action="add-to-playlist.php" class="mt-2">

<input type="hidden" name="song_id" value="<?php echo $row['id']; ?>">

<select name="playlist_id" class="form-control mb-2">

<?php
$playlist_query = mysqli_query($conn,"SELECT * FROM playlists WHERE user_id='$user_id'");

while($p = mysqli_fetch_assoc($playlist_query)){
?>

<option value="<?php echo $p['id']; ?>">
<?php echo $p['playlist_name']; ?>
</option>

<?php } ?>

</select>

<button class="btn btn-success btn-sm">
Add to Playlist
</button>

</form>

</div>

</div>

<?php } ?>

</div>

</div>

<!-- STICKY MUSIC PLAYER -->

<div class="music-player">

<div class="container d-flex justify-content-between align-items-center">

<div>
<strong id="player-title">No song playing</strong><br>
<span id="player-artist"></span>
</div>

<button onclick="prevSong()" class="btn btn-light btn-sm">⏮</button>

<audio id="main-player" controls></audio>

<button onclick="nextSong()" class="btn btn-light btn-sm">⏭</button>

</div>

<input type="range" id="progress" value="0">

</div>

<div class="container mt-4">
<h4>Lyrics</h4>
<div id="lyrics-box" style="background:#1e1e1e;padding:20px;border-radius:10px;">
No lyrics available
</div>
</div>
<!-- SCRIPTS -->

<script>

var songs = [];
var titles = [];
var artists = [];
var lyrics = [];
var currentIndex = 0;

<?php
mysqli_data_seek($result,0);
while($row = mysqli_fetch_assoc($result)){
?>

songs.push("assets/uploads/songs/<?php echo $row['file_path']; ?>");
titles.push(`<?php echo $row['title']; ?>`);
artists.push(`<?php echo $row['artist']; ?>`);
lyrics.push(`<?php echo addslashes($row['lyrics']); ?>`);
<?php } ?>

var player = document.getElementById("main-player");
var progress = document.getElementById("progress");

function playSong(src,title,artist){

currentIndex = songs.indexOf(src);

player.src = src;
player.play();

document.getElementById("player-title").innerText = title;
document.getElementById("player-artist").innerText = artist;

if(lyrics[currentIndex]){
document.getElementById("lyrics-box").innerText = lyrics[currentIndex];
}else{
document.getElementById("lyrics-box").innerText = "No lyrics available";
}
}

function playCurrent(){

player.src = songs[currentIndex];
player.play();

document.getElementById("player-title").innerText = titles[currentIndex];
document.getElementById("player-artist").innerText = artists[currentIndex];

document.getElementById("lyrics-box").innerText = lyrics[currentIndex];

}

function nextSong(){

currentIndex = (currentIndex + 1) % songs.length;
playCurrent();

}

function prevSong(){

currentIndex = (currentIndex - 1 + songs.length) % songs.length;
playCurrent();

}

player.addEventListener("ended", nextSong);

player.addEventListener("timeupdate", function(){

progress.value = (player.currentTime / player.duration) * 100 || 0;

});

progress.addEventListener("input", function(){

player.currentTime = (progress.value / 100) * player.duration;

});

</script>

</body>
</html>