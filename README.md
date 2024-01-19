# Docker-compose
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

Option list:
-   `-players 16`  : Modifiez le nombre maximal de joueurs.
-   `-useperfthreads` 
-   `-NoAsyncLoadingThread` 
-   `-UseMultithreadForDS`  : Optimise pour les environnements CPU multi-threadés.
