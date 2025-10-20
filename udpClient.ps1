$localIP = [System.Net.IPAddress]::Parse("10.10.10.3").ToString();
$Port = 4444;

$data = "payload";
try {
    $udp = [System.Net.Sockets.UdpClient]::new();
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($data);
    $udp.Send($bytes, $bytes.Length, $IP, $Port) | Out-Null;
    Write-Host "Sent '$data' to ${IP}:${Port}";
    $udp.Close();
} catch {
    Write-Error "Failed to send UDP message: $_";
}
