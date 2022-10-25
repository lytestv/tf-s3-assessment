import boto3
from boto3 import client

s3 = boto3.client('s3')

# Uploading simple text file to existing bucket built with terraform
s3.upload_file('/Users/test/terraform/testfile2.txt','s3-tf-bucketmichael','testfile2.txt')
s3.upload_file('/Users/test/terraform/anothertextfile.txt','s3-tf-bucketmichael','anothertextfile.txt')

# Deleting the first textfile file I just pushed from the bucket
response = s3.delete_object(
    Bucket='s3-tf-bucketmichael',
    Key='testfile2.txt'
)

# Describe Contents in S3 Bucket
conn = client('s3')  # again assumes boto.cfg setup, assume AWS S3
for key in conn.list_objects(Bucket='s3-tf-bucketmichael')['Contents']:
    print(key['Key'])


