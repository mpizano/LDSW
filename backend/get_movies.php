<?php
include 'db.php';

$query = "SELECT * FROM movies";
$stmt = $pdo->query($query);
$movies = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($movies);
