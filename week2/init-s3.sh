echo "Hello, World!" > s3-file.txt

aws s3api create-bucket --bucket pchpsky-week2 --create-bucket-configuration LocationConstraint=us-west-2

aws s3api put-public-access-block \
    --bucket pchpsky-week2 \
    --public-access-block-configuration "BlockPublicAcls=true,BlockPublicPolicy=true,IgnorePublicAcls=true,RestrictPublicBuckets=true"

aws s3api put-bucket-versioning --bucket pchpsky-week2 --versioning-configuration Status=Enabled

aws s3 cp s3-file.txt s3://pchpsky-week2/
