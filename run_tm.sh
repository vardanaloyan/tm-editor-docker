# Take the ip address
ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')

# Add ip address to the whitelist
xhost + $ip

# Run the docker image
docker run --rm -it -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd):/opt/data -e DISPLAY=$ip:0 aloyan/tm-editor:0.12.1
 
