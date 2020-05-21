#!/bin/bash
terraform init
terraform workspace select qa
terraform destroy -auto-approve

terraform workspace select pro
terraform destroy -auto-approve