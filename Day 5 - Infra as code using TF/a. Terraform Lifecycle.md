

## Lifecycle of TF

TF lifecycle consist of 3 stages -

1. Terraform init
2. Terraform plan
3. Terraform apply


for terraform to create resources on AWS, it needs authentication with your cloud, which we can do by using IAM user, and then store these credentials in .aws/credentials

If you have not setup the creds, you can do using `aws configure`