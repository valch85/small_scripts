#!/bin/bash
#remove unused images in DigitalOcean excapt 2 last one. 
set -eu

# check branch
BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [[ "$BRANCH" != "master" ]]; then
  echo 'Aborting script. You use wrong branch. Should be master.';
  exit 1;
fi

# create vars
COUNTER=0
IMAGE_COUNT=$(( `doctl compute image list --format Name,ID |sort |awk {'print $2'} |wc -l` -2 ))
IMAGE_ID_LIST=`doctl compute image list --format Name,ID |sort |awk {'print $2'} | head -n $IMAGE_COUNT`
IMAGE_NAME_USED=`doctl compute droplet list --format Name,PublicIPv4,Image | awk {'print $4'} |sort |uniq`
ARRAY_IMAGE_ID_LIST=()
ARRAY_IMAGE_USED=()
ARRAY_IMAGE_ID_DELETE=()
ARRAY_IMAGE_LIST_AFTER=()

# convert IMAGE_LIST sting to array
for image_id in $IMAGE_ID_LIST; do 
    ARRAY_IMAGE_ID_LIST+=( `doctl compute image list --format Name,ID |grep $image_id | awk {'print $2'}` )
done

# create array of used images
for image_name in $IMAGE_NAME_USED; do 
    ARRAY_IMAGE_USED+=( `doctl compute image list --format Name,ID |grep $image_name | awk {'print $2'}` )
done

# compare arrays and create array with clear list
for i in "${ARRAY_IMAGE_ID_LIST[@]}"; do
    skip=
    for j in "${ARRAY_IMAGE_USED[@]}"; do
        [[ $i == $j ]] && { skip=1; break; }
    done
    [[ -n $skip ]] || ARRAY_IMAGE_ID_DELETE+=("$i")
done

# deleting procedure
for index in ${ARRAY_IMAGE_ID_DELETE[@]}; do
    echo deleting image $index
    echo "y" | doctl compute image delete $index
    echo image $index deleted 
    echo " "
done      

#check what images are left in DO
echo "Images that are present in DO"
ARRAY_IMAGE_LIST_AFTER+=( `doctl compute image list --format Name,ID |sort ` )

for i in "${ARRAY_IMAGE_LIST_AFTER[@]}"; do
   echo "$i"
done
