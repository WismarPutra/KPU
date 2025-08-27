<?php
// Konfigurasi koneksi database
$host = "localhost";
$user = "root";
$pass = "";
$db   = "gps_tracker";

// Koneksi ke database
$conn = new mysqli($host, $user, $pass, $db);

// Cek koneksi
if ($conn->connect_error) {
    die(json_encode(["error" => "Koneksi gagal: " . $conn->connect_error]));
}

// Query data lokasi
$sql = "SELECT latitude, longitude, created_at FROM locations ORDER BY id ASC";
$result = $conn->query($sql);

$coordinates = [];
if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $coordinates[] = [
            'lat'  => (float)$row['latitude'],
            'lng'  => (float)$row['longitude'],
            'time' => $row['created_at']
        ];
    }
}

// Set header JSON
header('Content-Type: application/json');
echo json_encode($coordinates);

// Tutup koneksi
$conn->close();
?>
    