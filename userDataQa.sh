Content-Type: multipart/mixed; boundary="//"
MIME-Version: 1.0

--//
Content-Type: text/cloud-config; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cloud-config.txt"

#cloud-config
cloud_final_modules:
- [scripts-user, always]

--//
Content-Type: text/x-shellscript; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="userdata.txt"

#!/bin/bash
docker rm -f -v product-gallery-manager
docker rmi -f $(sudo docker images 'jmgorduez/product-gallery-manager' -q)
docker rm -f -v ui-gaming-cards
docker rmi -f $(sudo docker images 'jmgorduez/ui-gaming-cards' -q)

sudo docker run -d -p 8080:8080 --network product-gallery-network --name product-gallery-manager "jmgorduez/product-gallery-manager:QA"
sudo docker run -d -p 80:80 --network product-gallery-network --name ui-gaming-cards "jmgorduez/ui-gaming-cards:QA"
--//