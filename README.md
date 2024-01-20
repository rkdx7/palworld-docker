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

Option list:
-   `-players 16`  : Modifiez le nombre maximal de joueurs.
-   `-useperfthreads` 
-   `-NoAsyncLoadingThread` 
-   `-UseMultithreadForDS`  : Optimise pour les environnements CPU multi-threadés.

For generate config server start server and stop the server and setup your config at `./data/Saved/Config/LinuxServer/PalWorldSettings.ini` 
```
Difficulty=None - Doesn't seem to matter for dedicated servers.
DayTimeSpeedRate=1.000000 - Changes how long daytime lasts.
NightTimeSpeedRate=1.000000 - Changes how long night lasts.
ExpRate=1.000000 - Modifies how much experience you get.
PalCaptureRate=1.000000 - How likely you are to capture Pals.
PalSpawnNumRate=1.000000 - How frequently Pals spawn.
PalDamageRateAttack=1.000000 - How much damage Pals do.
PalDamageRateDefense=1.000000 - How much damage Pals take.
PlayerDamageRateAttack=1.000000 - How much damage players do.
PlayerDamageRateDefense=1.000000 - How much damage players take.
PlayerStomachDecreaceRate=1.000000 - Rate at which hunger decreases.
PlayerStaminaDecreaceRate=1.000000 - Rate at which stamina decreases
PlayerAutoHPRegeneRate=1.000000 - How quickly HP will be automatically restored when hurt.
PlayerAutoHpRegeneRateInSleep=1.000000 - How much HP is regenerated while sleeping.
PalStomachDecreaceRate=1.000000 - Rate at which Pal hunger decreases.
PalStaminaDecreaceRate=1.000000 - Rate at which Pal stamina decreases
PalAutoHPRegeneRate=1.000000 - How quickly Pal HP will be automatically restored when hurt.
PalAutoHpRegeneRateInSleep=1.000000 - How much Pal HP is regenerated while sleeping.
BuildObjectDamageRate=1.000000 - Damage to objects.
BuildObjectDeteriorationDamageRate=1.000000 - How much damage built objects will take over time.
CollectionDropRate=1.000000 - Rate at which items are gathered from things like trees or rocks.
CollectionObjectHpRate=1.000000 - How much HP breakable world items have.
CollectionObjectRespawnSpeedRate=1.000000 - How quickly obects like trees respawn.
EnemyDropItemRate=1.000000 - Frequency enemies will drop items.
DeathPenalty=All - Determines what is dropped on death. Can be set to none.
bEnableAimAssistPad=True - Lets you enable or disable aim assist
bEnableAimAssistKeyboard=False - Lets you enable or disable aim assist
DropItemMaxNum=3000 - Max amount of dropped items allowed at one time.
BaseCampMaxNum=128 - Max amount of bases that can be built at once.
BaseCampWorkerMaxNum=15 - Max amount of worker Pals that can be at a camp.
DropItemAliveMaxHours=1.000000 - How long dropped items will stay spawned before disappearing.
bAutoResetGuildNoOnlinePlayers=False - If true, a guild will be disbanded if no players are online.
AutoResetGuildTimeNoOnlinePlayers=72.000000 - How quickly an inactive guild will be disbanded.
GuildPlayerMaxNum=20 - Max guild player number.
PalEggDefaultHatchingTime=72.000000 - How long it takes to hatch Pal eggs.
WorkSpeedRate=1.000000 - How quickly Pals work.
CoopPlayerMaxNum=4 - Max amount of players in a party.
ServerPlayerMaxNum=32 - Max players allowed on a server (caps at 32).
ServerName="Default Palworld Server"
ServerDescription="" - What is shown when selecting the server in the list.
AdminPassword="" - Password used to grant admin access.
ServerPassword="" - Password needed for regular players to join.
```
