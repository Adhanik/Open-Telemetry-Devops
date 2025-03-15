

So now we will finally create the EKS and VPC module. we will create a remote backend first, and store our files in S3 Bucket.


- The s3 bucket we have already created, so we will use the same bucket name to store our state file, which will be part of required_provider block

- Next we have the provider block of aws in which region we want to create our resources.
- Lastly we will invoke the EKS and VPC code using name of the module, and give the source where it is present. Along with it, we will pass the necessary variable values that are defined in the module

- for EKS, we need to retrieve the vpc id and subnet id, so we will retrieve these values from vpc module


## Errors

The dynamo db lock is case sensistive, it should be `lockID`
we missed a Elastic ip resource, which is needed in vpc main.tf

```
│ Error: Reference to undeclared resource
│ 
│   on modules/VPC/main.tf line 75, in resource "aws_nat_gateway" "main":
│   75:   allocation_id = aws_eip.nat[count.index].id
│ 
│ A managed resource "aws_eip" "nat" has not been declared in module.vpc.
```