#!/bin/bash
terraform init
terraform workspace select qa
terraform apply -auto-approve

terraform workspace select pro
terraform apply -auto-approve