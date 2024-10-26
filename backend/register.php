<?php
include 'db.php';

$data = json_decode(file_get_contents("php://input"));

$username = $data->username;
$email = $data->email;
$password = password_hash($data->password, PASSWORD_BCRYPT);

$query = "INSERT INTO users (username, email, password) VALUES (:username, :email, :password)";
$stmt = $pdo->prepare($query);

$stmt->bindParam(':username', $username);
$stmt->bindParam(':email', $email);
$stmt->bindParam(':password', $password);

if ($stmt->execute()) {
    echo json_encode(['status' => 'success']);
} else {
    echo json_encode(['status' => 'error']);
}
