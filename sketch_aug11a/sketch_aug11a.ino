#include <WiFi.h>
#include <HTTPClient.h>
#include <TinyGPSPlus.h>
#include <HardwareSerial.h>

#define WIFI_SSID "UHUUY"
#define WIFI_PASSWORD "skutskut"

// IP laptop/server di jaringan WiFi
String serverName = "http://172.27.41.3/gps_tracker/save_gps.php";

HardwareSerial GPSserial(1);
TinyGPSPlus gps;

// Variabel waktu kirim
unsigned long lastSendTime = 0; 
const unsigned long sendInterval = 30000; // 1 menit

void connectWiFi() {
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to WiFi");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(500);
  }
  Serial.println("\nConnected! IP: " + WiFi.localIP().toString());
}

void setup() {
  Serial.begin(115200);
  GPSserial.begin(9600, SERIAL_8N1, 12, 14); // RX=12, TX=14
  connectWiFi();
}

void loop() {
  while (GPSserial.available() > 0) {
    gps.encode(GPSserial.read());
  }

  if (gps.location.isValid() && gps.location.isUpdated()) {
    float latitude = gps.location.lat();
    float longitude = gps.location.lng();
    Serial.printf("Lat: %.6f, Lng: %.6f\n", latitude, longitude);

    unsigned long now = millis();
    if (now - lastSendTime >= sendInterval) {

      if (WiFi.status() != WL_CONNECTED) {
        Serial.println("WiFi lost, reconnecting...");
        connectWiFi();
      }

      HTTPClient http;
      http.begin(serverName);
      http.addHeader("Content-Type", "application/x-www-form-urlencoded");

      String httpRequestData = "latitude=" + String(latitude, 6) + "&longitude=" + String(longitude, 6);

      int httpResponseCode = http.POST(httpRequestData);

      if (httpResponseCode > 0) {
        Serial.println("Server response: " + http.getString());
      } else {
        Serial.printf("HTTP Error code: %d\n", httpResponseCode);
      }
      http.end();

      lastSendTime = now;
    }
  }
}
