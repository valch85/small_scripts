### Change DNS A record in AWS Route53 to your current IP.

#!/bin/bash

# Get vars from config
source ~/ip-changer.conf
# ip-changer.conf format
FQDN="domain.zone.name"
ZONE_ID="Z2K&&&&&F000"
TTL=300

# get ip
myip=$(/usr/bin/curl -sS --max-time 5 https://myip.chubukin.name)
echo "Your IP is $myip"

# Check if myip is empty or unset
if [ -z "$myip" ]; then
  echo "Error: Failed to retrieve IP address. Aborting."
  exit 1
fi

# change ip in aws
aws route53 change-resource-record-sets \
  --hosted-zone-id "$ZONE_ID" \
  --change-batch "{
    \"Changes\": [
      {
        \"Action\": \"UPSERT\",
        \"ResourceRecordSet\": {
          \"Name\": \"$FQDN\",
          \"Type\": \"A\",
          \"TTL\": $TTL,
          \"ResourceRecords\": [{ \"Value\": \"$myip\" }]
        }
      }
    ]
  }"
