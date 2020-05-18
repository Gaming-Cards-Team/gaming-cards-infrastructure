#!/bin/bash
terraform workspace select qa
terraform apply

terraform workspace select pro
terraform apply