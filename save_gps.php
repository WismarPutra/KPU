<?php
$servername = "localhost";
$username   = "root"; // default XAMPP
$password   = "";
$dbname     = "gps_tracker";

$conn = new mysqli($servername, $username, $password, $dbname);

// Cek koneksi
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if (isset($_POST['latitude']) && isset($_POST['longitude'])) {
    $latitude = $_POST['latitude'];
    $longitude = $_POST['longitude'];

    $sql = "INSERT INTO locations (latitude, longitude) VALUES ('$latitude', '$longitude')";

    if ($conn->query($sql) === TRUE) {
        echo "Data saved successfully";
    } else {
        echo "Error: " . $conn->error;
    }
} else {
    echo "Invalid data";
}

$conn->close();
?>
