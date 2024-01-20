Source: https://github.com/rkdx7/palworld-docker  

# Docker-compose

Startup command: 
```
apt update \
&& apt install -y docker.io docker-compose \
&& wget https://github.com/rkdx7/palworld-docker/blob/main/compose.yml \
&& useradd palworld --uid 1001 \
&& mkdir -p data/Saved  data/Intermediate \
&& chown -R palworld: data
&& docker-compose up -d
```

Docker-compose file
```
version: "3.8"  
services:  
  palworld-server:  
    image: rkdx7/palworld-server:v1  
    ports:    
      - "8211:8211"  
    volumes:  
      - "/home/palworld/Steam/steamapps/common/PalServer/Pal/Saved:./data/Saved"  
      - "/home/palworld/Steam/steamapps/common/PalServer/Pal/Intermediate:./data/Intermediate"  
  # entrypoint:  
```
Create folder : `./data/Saved` and `./data/Intermediate`
# Options: 

Possible configuration:
`Entrypoint: ./PalServer.sh -players 34 -NoAsyncLoadingThread -UseMultithreadForDS`

By default :
`Entrypoint: ./PalServer.sh`

For generate config serveur start server and stop the server and setup your config at `./data/Saved/Config/LinuxServer/PalWorldSettings.ini` 

Option list:
-   `-players 16`  : Modifiez le nombre maximal de joueurs.
-   `-useperfthreads` 
-   `-NoAsyncLoadingThread` 
-   `-UseMultithreadForDS`  : Optimise pour les environnements CPU multi-threadés.
