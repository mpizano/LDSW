<?php
include 'db.php';

$data = json_decode(file_get_contents("php://input"));
$title = $data->title;
$genre = $data->genre;
$release_year = $data->release_year;
$description = $data->description;

$query = "INSERT INTO movies (title, genre, release_year, description) VALUES (:title, :genre, :release_year, :description)";
$stmt = $pdo->prepare($query);

$stmt->bindParam(':title', $title);
$stmt->bindParam(':genre', $genre);
$stmt->bindParam(':release_year', $release_year);
$stmt->bindParam(':description', $description);

if ($stmt->execute()) {
    echo json_encode(['status' => 'success']);
} else {
    echo json_encode(['status' => 'error']);
}
