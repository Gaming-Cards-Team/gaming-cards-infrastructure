#!/bin/bash
terraform workspace select qa
terraform destroy

terraform workspace select pro
terraform destroy