# Windows 10 Powershell, ffmpeg required

# Open Powershell
# move to working directory

##### Modify video path
$MAPILLARY_MOVIE="I:\20191117kamakurahiking\R0080368_er.MP4"

#### Specify extraction duration (in seconds)
$DELTA_SECONDS = 10

# Run this script
# And you'll get images

# Append geotags with gis software, for example
# C:\work\exiftool.exe -geotag="I:\track.gpx"  -overwrite_original C:\work\images '-geotime<${createdate}'


$option = "fps=1/" + $DELTA_SECONDS
ffmpeg -i $MAPILLARY_MOVIE -vf $option mapillary%06d.jpg  


$movieinfo=$(ffmpeg -i $MAPILLARY_MOVIE 2>&1)

$a = $movieinfo -match 'creation'
$a[0] -match "[0-9\.:T-]*.$"
$creationtime = Get-Date $matches[0]

$b = $movieinfo -match 'Duration'
$b[0] -match "(\d{2}):(\d{2}):(\d{2})"

$movie_start_time = $creationtime.AddMinutes(-1*$matches[2]).AddSeconds(-1*$matches[3])

$newdatetime = $movie_start_time
for ($i = 1; ;$i++)
{
	$filename = "mapillary" + $i.ToString("000000") + ".jpg"
	if (!(Test-Path $filename)) {break}
	Set-ItemProperty $filename -name CreationTime -value $newdatetime
	Set-ItemProperty $filename -name LastWriteTime -value $newdatetime
	
	$newdatetime = $newdatetime.AddSeconds($DELTA_SECONDS)
}

