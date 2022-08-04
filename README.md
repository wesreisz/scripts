NOTE: If you're running local, you need quite a bit of memory. I'm using colima and 
had to adjust my memory with the colima start command: `colima start --cpu 4 --memory 8`

In addition, I'm using an M1 Mac so I needed to tell docker-compose to use linux images. Finally, I also 
had to update the version of my elastic search to: 

Setup Docker
* install docker and docker-compose, see install script

Login to Quay for enterprise jars
NOTE: Setup harbor or acs to store these in a repo for ETC
* login into quay.io: `docker login quay.io`

Start APS
* start aps: `docker-compose -p aps -f ./docker-compose-aps-dev.yml up`
NOTE: you will need `activiti-admin.properties` in the folder. This has sensitive info, so it's not in the repo.
* register aps with an acs instance

Start ACS (if needed)
* bring up acs stack: `docker-compose -p acs -f ./docker-compose-acs-dev.yml up`
* apply license file
TODO: Look to see if there's a why to mount the acs license file into the docker-compose container. This is done in aps so it should be possible.