FROM debian:latest
RUN apt-get update
RUN apt-get -y install apt-utils
RUN apt-get -y install python3-pip
RUN pip3 -y install boto3
COPY plex_backup_script.py /plex_backup_script.py
ENTRYPOINT ["/plex_backup_script.py"]
