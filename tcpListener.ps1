$port=4444
$endpoint = New-Object System.Net.IPEndPoint ([System.Net.IPAddress]::Any, $port)
$listener = New-Object System.Net.Sockets.TcpListener $endpoint
$listener.Start()
$client = $listener.AcceptTcpClient()
