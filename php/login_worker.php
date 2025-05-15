<?php
include "db_connect.php";

$email = $_POST['email'];
$password = sha1($_POST['password']);

$sql = "SELECT * FROM workers WHERE email='$email' AND password='$password'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo json_encode($result->fetch_assoc());
} else {
    echo "Invalid";
}
?>
