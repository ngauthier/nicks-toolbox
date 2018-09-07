# watch for changes recursively and execute arguments as command
# example:
#   live ls -File

$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = get-location
$watcher.IncludeSubdirectories = $true
$watcher.EnableRaisingEvents = $false
$watcher.NotifyFilter = [System.IO.NotifyFilters]::LastWrite

while($TRUE){
	$result = $watcher.WaitForChanged([System.IO.WatcherChangeTypes]::Changed -bor [System.IO.WatcherChangeTypes]::Created, 1000);
	if($result.TimedOut){
		continue;
	}
	Invoke-Expression "$args"
}
