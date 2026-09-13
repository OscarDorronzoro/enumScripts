$ip = "192.168.1.6"
$port = 4444

$text = [Console]::In.ReadToEnd()

$client = [System.Net.Sockets.TcpClient]::new()
$client.Connect($ip, $port)

$stream = $client.GetStream()

$data = [System.Text.Encoding]::UTF8.GetBytes($text)
$stream.Write($data, 0, $data.Length)

$stream.Close()
$client.Close()
