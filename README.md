# ExtractImagesFromMovie

Windows 10 Powershell script, ffmpeg required

This script is created mainly for Mapillary use.
Mapillary_tools supports video files. But in my PC, it doesn't works.

This script
1. Extracts images from video file
1. Appends captured time to each images

## How to use
1. Open Powershell
1. move to working directory
1. Modify video path $MAPILLARY_MOVIE in the script
1. Specify extraction duration $DELTA_SECONDS in the script
1. Run this script, and you'll get images with captured time
1. Append geotags with other software, for example `C:\work\exiftool.exe -geotag="I:\track.gpx"  -overwrite_original C:\work\images '-geotime<${createdate}'`
