$port = 4444
$listener = [System.Net.Sockets.TcpListener]::new(
    [System.Net.IPAddress]::Any,
    $port
)

$listener.Start()

Write-Host "Listening on port $port..."

while ($true) {
    $client = $listener.AcceptTcpClient()
    Write-Host "`n--- Connection from $($client.Client.RemoteEndPoint) ---"

    $stream = $client.GetStream()
    $reader = New-Object System.IO.StreamReader($stream)

    while (($line = $reader.ReadLine()) -ne $null) {
        Write-Host $line
    }

    $reader.Close()
    $stream.Close()
    $client.Close()

    Write-Host "--- Connection closed ---"
}
