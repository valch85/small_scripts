FROM debian:latest
RUN apt-get update
RUN apt -y install apt-utils
RUN apt -y install python3, python3-pip, gpg
RUN pip3 -y install boto3
COPY plex_backup_script.py /plex_backup_script.py
ENTRYPOINT ["/plex_backup_script.py"]
