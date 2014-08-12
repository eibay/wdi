 ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'
 # DNS Server- takes the internet site you typed in and outputs/redirects you to the IP address for the website