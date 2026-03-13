<?php

session_start();
include("config/db.php");

if(isset($_POST['playlist_id'])){

    $playlist_id = $_POST['playlist_id'];

    // delete songs from playlist
    mysqli_query($conn,"DELETE FROM playlist_songs WHERE playlist_id='$playlist_id'");

    // delete playlist
    mysqli_query($conn,"DELETE FROM playlists WHERE id='$playlist_id'");

}

header("Location: playlist.php");
exit();

?>