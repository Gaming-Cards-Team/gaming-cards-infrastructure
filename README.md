# gaming-cards-infrastructure

Build the infrastructure of the gaming cards project which includes ec2 instances for QA and PRO environments.

## Available Scripts

In the project directory, you can run:

##### `terraform workspace select <profile>`

for selecting the profile where you want to work which can be qa (QA) or pro (production).

Then you can run:

##### `terraform apply`

for building all the infrastructure or instead of this can run:

##### `terraform destroy`

for termitating all the infrastructure.
