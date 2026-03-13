<?php
session_start();
include("config/db.php");

if(!isset($_SESSION['user_id'])){
    header("Location: login.php");
    exit();
}

if($_SERVER['REQUEST_METHOD'] !== 'POST' || !isset($_POST['song_id'])){
    header("Location: music.php");
    exit();
}

$user_id = (int)$_SESSION['user_id'];
$song_id = (int)$_POST['song_id'];

if($song_id <= 0){
    header("Location: music.php");
    exit();
}

/* CHECK IF SONG ALREADY LIKED */
$check = mysqli_prepare($conn, "SELECT 1 FROM favorites WHERE user_id = ? AND song_id = ? LIMIT 1");
mysqli_stmt_bind_param($check, "ii", $user_id, $song_id);
mysqli_stmt_execute($check);
mysqli_stmt_store_result($check);

if(mysqli_stmt_num_rows($check) > 0){
    /* UNLIKE SONG */
    $delete = mysqli_prepare($conn, "DELETE FROM favorites WHERE user_id = ? AND song_id = ?");
    mysqli_stmt_bind_param($delete, "ii", $user_id, $song_id);
    mysqli_stmt_execute($delete);
    mysqli_stmt_close($delete);
}else{
    /* LIKE SONG */
    $insert = mysqli_prepare($conn, "INSERT INTO favorites(user_id, song_id) VALUES(?, ?)");
    mysqli_stmt_bind_param($insert, "ii", $user_id, $song_id);
    mysqli_stmt_execute($insert);
    mysqli_stmt_close($insert);
}

mysqli_stmt_close($check);

header("Location: music.php");
exit();
?>
