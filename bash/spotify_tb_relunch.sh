#relunch Spotify and Touch Bar icon processes in MacOS
#!/bin/bash

#kill spotify process
kill $(ps aux |grep Spotify |grep -v grep | awk '{print $2}' | grep -v grep |sort |head -1)

#kill touch bar process
kill $(ps aux |grep NowPlayingTouchUI |grep -v grep | awk '{print $2}')

#run spotify app
open -a Spotify
