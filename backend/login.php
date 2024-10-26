<?php
include 'db.php';

$data = json_decode(file_get_contents("php://input"));
$email = $data->email;
$password = $data->password;

$query = "SELECT * FROM users WHERE email = :email";
$stmt = $pdo->prepare($query);
$stmt->bindParam(':email', $email);
$stmt->execute();

$user = $stmt->fetch(PDO::FETCH_ASSOC);

if ($user && password_verify($password, $user['password'])) {
    echo json_encode(['status' => 'success', 'user_id' => $user['id']]);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid credentials']);
}
