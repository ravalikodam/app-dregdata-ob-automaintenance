
#!/bin/bash
set -evx

# Source variables
source ./automaintenance/logcleanup/inventory/servers/env.conf

# Define variables
#ROLE_ARN="arn:aws:iam::"$ACCOUNT_ID":role/cuscal-role-obdeveloperuser"
ROLE_ARN="arn:aws:iam::"$ACCOUNT_ID":role/aws-reserved/sso.amazonaws.com/ap-southeast-2/AWSReservedSSO_cuscal-role-obdeveloperuser_ccaa5e3f1f873f6c"
instance_name="$INSTANCE_NAME"
region="$REGION"
profile="$PROFILE"  # AWS CLI profile name

# Assume role to get temporary credentials
echo "Assuming role $ROLE_ARN..."
TEMP_CREDENTIALS=$(aws sts assume-role --role-arn $ROLE_ARN --role-session-name "session" --profile $profile)

# Extracting temporary credentials
export AWS_ACCESS_KEY_ID=$(echo $TEMP_CREDENTIALS | jq -r '.Credentials.AccessKeyId')
export AWS_SECRET_ACCESS_KEY=$(echo $TEMP_CREDENTIALS | jq -r '.Credentials.SecretAccessKey')
export AWS_SESSION_TOKEN=$(echo $TEMP_CREDENTIALS | jq -r '.Credentials.SessionToken')

# Use Session Manager to connect to EC2 instance
echo "Connecting to EC2 instance using Session Manager..."
aws ssm start-session --target $instance_name --region $region --profile $profile <<'EOF'
  #set -evx
  # Commands to execute inside EC2 instance

  # List active containers
  #sudo docker ps

  # Change directory
  #cd /ConsumerDataRight/mock-register/Source/

  # Stop mock-register and wait 1 more minute after all the container is shutdown
  #sudo /usr/local/bin/docker-compose -f docker-compose.Ecosystem.yml down

  # Start Mock-register and wait until all the containers started
  #sudo /usr/local/bin/docker-compose -f docker-compose.Ecosystem.yml up -d

  # Verify all containers are up - verify they are ‘healthy’ and not ‘healthy:starting
  #sudo docker ps

  # Copy certificates from S3
  #aws s3 cp s3://ob-nonprod-acc-mock-register-mtls/mtls_mycdr.zip /tmp && cd /tmp

  # Unzip
  #unzip mtls_mycdr.zip

  # Get the container ID for the specified image
  #container_id=$(sudo docker ps -qf "ancestor=consumerdataright/mock-register-4")

  # Make a directory
  #sudo docker exec -it "$container_id" mkdir -p /app/idsvr/Certificates/

  # Copy certificates
  #sudo docker cp /tmp/mtls_mycdr/ca.crt "$container_id":/app/gateway-mtls/Certificates/
  #sudo docker cp /tmp/mtls_mycdr/ca.pem "$container_id":/app/gateway-mtls/Certificates/
  #sudo docker cp /tmp/mtls_mycdr/register.pfx "$container_id":/app/gateway-mtls/Certificates/
  #sudo docker cp /tmp/mtls_mycdr/ca.pem "$container_id":/app/idsvr/Certificates/
  #sudo docker cp /tmp/mtls_mycdr/register.pfx "$container_id":/app/idsvr/Certificates/
  #sudo docker cp /tmp/mtls_mycdr/client.pem "$container_id":/app/admin/Certificates/
  #sudo docker cp /tmp/mtls_mycdr/client.key "$container_id":/app/admin/Certificates/
  #sudo docker cp /tmp/mtls_mycdr/ssa.pfx "$container_id":/app/ssa/Certificates/
  #sudo docker cp /tmp/mtls_mycdr/ssa.pfx "$container_id":/app/admin/Certificates/

  # Restart the container
  #sudo docker container restart "$container_id"

#EOF

# Unset temporary credentials
#unset AWS_ACCESS_KEY_ID
#unset AWS_SECRET_ACCESS_KEY
#unset AWS_SESSION_TOKEN

#echo "Session terminated."
