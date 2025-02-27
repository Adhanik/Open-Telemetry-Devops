
## State file

Terraform keeps track of all the resources you created on AWS using state file. 


## Management

To keep consistency in resources you created on AWS, you cannot keep state file locally. Also, State file consists of sensitive information, so you cannot push it to github and share with everyone.

To solve this problem, we have 2 methods

- Remote backend - state file is not saved locally now, but in S3 Bucket which is instructed to TF using backend.tf . Now if somone clones the github repo where we have main.tf, backend.tf, and run terraform apply, TF will see state file, and then proceed to do changes. No one needs to have state file locally now, as we have centralised it using backend.tf. Also not everyone will have access to S3, so our state file does not compramise in security. Using versioning, we can alos have backup of our state file.   


- State locking - to prevent inconsistency in state file if multiple users are working on same state file, we can use locking which ensures a user updates the resources at a time. We can achieve this using DynamoDB.

State locking is more imp when resources take a long amount of time to be created, for eg, creating a EKS cluster might take around 30 min. So state file needs to be locked during this time.

