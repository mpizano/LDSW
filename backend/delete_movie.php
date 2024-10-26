<?php
include 'db.php';

$data = json_decode(file_get_contents("php://input"));
$id = $data->id;

$query = "DELETE FROM movies WHERE id = :id";
$stmt = $pdo->prepare($query);
$stmt->bindParam(':id', $id);

if ($stmt->execute()) {
    echo json_encode(['status' => 'success']);
} else {
    echo json_encode(['status' => 'error']);
}
