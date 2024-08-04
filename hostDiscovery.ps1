for ($h = 104; $h -le 254; $h++){
  $ip = "192.168.0." + $h
  if (Test-Connection -ComputerName $ip -Count 1 -ErrorAction SilentlyContinue){
	Write-Host "$ip - UP"
  }
  else{
	Write-Host "$ip - DOWN"
  }
}
