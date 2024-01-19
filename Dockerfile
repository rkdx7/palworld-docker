FROM steamcmd/steamcmd:ubuntu-22
MAINTAINER cdognon
EXPOSE 8211
RUN useradd palworld --uid 1001 --create-home
RUN steamcmd +login anonymous +app_update 2394010 validate +quit
RUN mv /root/.steam /home/palworld/.
RUN mv /root/Steam/steamapps/common/PalServer /opt/palworld 
USER 1001
WORKDIR /opt/palworld
ENTRYPOINT ["./PalServer.sh"]
