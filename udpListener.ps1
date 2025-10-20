#$data=[System.Net.Sockets.UdpClient]::new([System.Net.IPEndPoint]::new([System.Net.IPAddress]::Any, 5004)).Receive([ref][System.Net.IPEndPoint]::new([System.Net.IPAddress]::Any, 0));
#Write-Host ([System.Text.Encoding]::UTF8.GetString($data))

$localIP = [System.Net.IPAddress]::Parse("0.0.0.0");
$Port = 4444;
$udp = [System.Net.Sockets.UdpClient]::new([System.Net.IPEndPoint]::new($localIP, $Port));

while ($true) {
    $remoteEP = [System.Net.IPEndPoint]::new([System.Net.IPAddress]::Any, 0);
    $data = $udp.Receive([ref]$remoteEP);
    $text = [System.Text.Encoding]::UTF8.GetString($data);
    Write-Host "Received from $($remoteEP.Address): $text";
}
