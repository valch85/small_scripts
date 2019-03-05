#!/usr/bin/env python3
# backing up plex data to AWS S3
# python3 plex_backup_script.py -p 123password -f /usr/local/test -b plex-backup-srv -r eu-west-1 -k aws_key -sk aws_secret_key
import tarfile
import os
import subprocess
import datetime
from argparse import ArgumentParser
import boto3

print("start backing up")

today = str(datetime.date.today())

# Get arguments from command line
parser = ArgumentParser()
parser.add_argument("-p", "--password", dest="my_password",
                    help="Password for encryption")

parser.add_argument("-f", "--folder", dest="folder_to_backup",
                    help="Path to folder that you what to backup")

parser.add_argument("-b", "--bucket", dest="bucket_to_store",
                    help="S3 bucket name where to store backup")

parser.add_argument("-r", "--region", dest="aws_region",
                    help="AWS region of the bucket")

parser.add_argument("-k", "--awskeyid", dest="aws_key_id",
                    help="AWS access key ID to connect to your bucket")

parser.add_argument("-sk", "--awssecretkey", dest="aws_secret_key",
                    help="AWS secret access key to connect to your bucket")


args = parser.parse_args()
my_password = str(args.my_password)
folder_to_backup = str(args.folder_to_backup)
bucket_to_store = str(args.bucket_to_store)
aws_region = str(args.aws_region)
aws_key_id = str(args.aws_key_id)
aws_secret_key = str(args.aws_secret_key)
temp_arch = str(str(datetime.date.today()) + ' - plex_backup')
file_to_copy = str(temp_arch + ".tar.gz.gpg")

s3_object = boto3.client(
    's3',
    region_name=aws_region,
    aws_access_key_id=aws_key_id,
    aws_secret_access_key=aws_secret_key
)


def compress():
    print("started compression")
    #tar = tarfile.open(temp_arch + ".tar.gz", "w:gz")
    #tar.add(folder_to_backup, arcname=temp_arch)
    #tar.close()

    with open(temp_arch + ".tar.gz", 'w') as f_obj:
        f_obj.write(folder_to_backup)


# to decrypt use this example
# $gpg --output temp_arch.tar.gz --decrypt temp_arch.tar.gz.gpg
# no need to pass the password - will ask for it in terminal in addition
def cypher():
    print("started cypher")
    subprocess.call(["gpg", "--passphrase", my_password, "--batch", "--quiet", "--yes", "--symmetric", temp_arch + ".tar.gz"])


def s3copy():
    print("started copy to s3 bucket")
    bucket_existence = False
    for bucket in s3_object.list_buckets()['Buckets']:
        if str(bucket['Name'].lower()) == str(bucket_to_store.lower()):
            bucket_existence = True
            if os.path.exists(file_to_copy):
                filename = os.path.basename(file_to_copy)
                s3_object.upload_file(file_to_copy, bucket_to_store, filename)
            else:
                print("fail to download")
            break

    if not bucket_existence:
        print('Bucket Named %s DOES NOT exist' % bucket_to_store)


def remove_temp_files():
    print("deleting tmp files")
    os.remove(temp_arch + ".tar.gz")
    os.remove(temp_arch + ".tar.gz.gpg")


def delete_old_s3_files():
    print("file rotation procedure")
    result = s3_object.list_objects(Bucket=bucket_to_store)
    store_items = []
    for obj in result['Contents']:
        store_items.append(obj['Key'])
    if len(store_items) > 6:
        for file in store_items[:-7]:
            s3_object.delete_object(Bucket=bucket_to_store, Key=file)


compress()
cypher()
s3copy()
remove_temp_files()
delete_old_s3_files()
print("finish backing up")

