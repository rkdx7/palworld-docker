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
      - "./data/Saved:/home/palworld/Steam/steamapps/common/PalServer/Pal/Saved"  
      - "./data/Intermediate:/home/palworld/Steam/steamapps/common/PalServer/Pal/Intermediate"  
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
[/Script/Pal.PalGameWorldSettings]
OptionSettings=(Difficulty=None,DayTimeSpeedRate=1.000000,NightTimeSpeedRate=1.000000,ExpRate=1.000000,PalCaptureRate=1.000000,PalSpawnNumRate=1.000000,PalDamageRateAttack=1.000000,PalDamageRateDefense=1.000000,PlayerDamageRateAttack=1.000000,PlayerDamageRateDefense=1.000000,PlayerStomachDecreaceRate=1.000000,PlayerStaminaDecreaceRate=1.000000,PlayerAutoHPRegeneRate=1.000000,PlayerAutoHpRegeneRateInSleep=1.000000,PalStomachDecreaceRate=1.000000,PalStaminaDecreaceRate=1.000000,PalAutoHPRegeneRate=1.000000,PalAutoHpRegeneRateInSleep=1.000000,BuildObjectDamageRate=1.000000,BuildObjectDeteriorationDamageRate=1.000000,CollectionDropRate=1.000000,CollectionObjectHpRate=1.000000,CollectionObjectRespawnSpeedRate=1.000000,EnemyDropItemRate=1.000000,DeathPenalty=All,bEnablePlayerToPlayerDamage=True,bEnableFriendlyFire=False,bEnableInvaderEnemy=True,bActiveUNKO=False,bEnableAimAssistPad=True,bEnableAimAssistKeyboard=False,DropItemMaxNum=3000,DropItemMaxNum_UNKO=100,BaseCampMaxNum=128,BaseCampWorkerMaxNum=15,DropItemAliveMaxHours=1.000000,bAutoResetGuildNoOnlinePlayers=False,AutoResetGuildTimeNoOnlinePlayers=72.000000,GuildPlayerMaxNum=20,PalEggDefaultHatchingTime=72.000000,WorkSpeedRate=1.000000,bIsMultiplay=True,bIsPvP=True,bCanPickupOtherGuildDeathPenaltyDrop=False,bEnableNonLoginPenalty=True,bEnableFastTravel=True,bIsStartLocationSelectByMap=True,bExistPlayerAfterLogout=False,bEnableDefenseOtherGuildPlayer=False,CoopPlayerMaxNum=4,ServerPlayerMaxNum=32,ServerName="rkdx7-nameserver",ServerDescription="Server by rkdx7",AdminPassword="",ServerPassword="",PublicPort=8211,PublicIP="",RCONEnabled=False,RCONPort=25575,Region="",bUseAuth=True,BanListURL="https://api.palworldgame.com/api/banlist.txt")
```

# Command admin
### basic Mode

In _Basic_ mode, you enter your admin password in your server configuration here:
**Server settings** -> **Admin password**.
Then click on **Save** and restart your server.

###  Advanced mode

In _Advanced_ mode, you enter your administrator password in the **PalWorldSettings.ini** file.  Find the following section:  `AdminPassword=""`  Enter your administrator password between the blank "", for example:  `AdminPassword="MyAdminPW"`  Click on **Save** and restart your server.

## Use administrator password

Open the ingame chat and type:
`/AdminPassword MyAdminPW`
Replace `MyAdminPW` with the administrator password you defined.
By default, you open the chat with the `Enter` key.
You will find a list of available commands below.

## Admincommands

### command

`/Broadcast {Message}`

Send a message to all players on the server

`/KickPlayer {SteamID}`

Kick the player with the specified SteamID

`/BanPlayer {SteamID}`

Ban the player with the specified SteamID

`/TeleportToPlayer {SteamID}`

teleports you to the indicated player

`/TeleportToMe {SteamID}`

Teleport the specified player to you

`/ShowPlayers`

Shows information about all connected players

`/Info`

Show information about your server

`/Save`

Save the game

`/Shutdown {Seconds} {Message}`

Shuts down the server with a message to all players when the selected seconds are up.
`/DoExit`

Shut down the server immediately.

**Information**  : Veuillez utiliser les commandes  `/Shutdown`  et  `/DoExit`  avec prudence.
