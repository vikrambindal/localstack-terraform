
## S3 Event Notification Trigger on SQS

Reference: [Localstack AWS S3 Event Trigger on SQS](https://hashnode.localstack.cloud/testing-s3-notifications-locally-with-localstack-terraform)


 - **Prerequisites**
	 - Following software required: docker, terraform, AWS CLI
 -  **About**
	 - Drop a file in simulated S3 resource on AWS Localstack
	 - This will trigger a notification
	 - The notification will send a message on SQS
	 - Content of SQS can be viewed
 - **Instructions**
	 - Local development machine
		 - `aws configure --profile localstack`
		 - `access key, secret key: fake,  region: us-east-1` 
	 - Run the docker compose file which will spin up a Localstack AWS on the development machine
	 - Run the terraform commands to set up SQS, S3 bucket and event notification
		 - `terraform init`
		 - `terraform plan`
		 - `terraform apply --auto-approve`
			 - This will ask you to provide the name of the bucket and the sqs queue to be used
			 - Once the setup is done, it will reveal a queue url which we can use to read messages from
	 - Using AWS CLI:
		 - List bucket contents: `aws s3 ls <bucketName> --endpoint-url=http://localhost:4566 --profile=localstack`
		 - Copy File to S3: `aws s3 cp .\app.txt s3://sample-bucket --endpoint-url=http://localhost:4566 --profile=localstack`
		 - Get Messages from SQS: `aws sqs receive-message --queue-url <urlObtainedFromTerraformOutput> --endpoint-url=http://localhost:4566 --profile=localstack`
  





 