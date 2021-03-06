# tm-editor-docker
First of all, you need to pull the image (https://hub.docker.com/r/aloyan/tm-editor)

```
docker pull  aloyan/tm-editor:0.13.0
```

[1] To use graphics on OSX, make sure XQuarz is installed. After installing, open XQuartz, and go to XQuartz, Preferences, select the Security tab, and tick the box "Allow connections from network clients". Then exit XQuarz. Afterwards, open a terminal and run the following commands:

```
ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
```

This will grab your IP address on the local network. Run echo $ip to make sure it was successfull. If nothing is displayed, replace en0 with en1 or a higher number in the command.

```
xhost + $ip
```
This will start XQuartz and whitelist your local IP address. 


Finally

```
docker run --rm -it -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd)/data:/data -w /data -e DISPLAY=$ip:0 aloyan/tm-editor:0.13.0
```

Note, it will also mount current directory (`pwd`/data) to `/opt/data`.

You will be prompt to console, where you can type `tm-editor <args>`

```
root@c50ac48f7eb1:/# tm-editor 
```

![Alt text](/screenshot.png?raw=true "tm-editor screenshot")

In [run_tm.sh](run_tm.sh) file you can find all commands in one shell script.
Make `run_th.sh` file executable by typing

```
chmod +x run_tm.sh
```

Run the file

```
./run_tm.sh
```

[1] [cern dockerhub account](https://hub.docker.com/r/rootproject/root)
