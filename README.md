### Microservices

Microservices are the opposite of a monolith. You have small services that can be deployed individually. Each service has a focus on one aspect of the business functionality. The services are loosely coupled. That means, that the services work relatively independent of each other and only communicate with the other services, if necessary.
Each service built independently, loosely couple and can communicate with each service.


# eng103a_docker
![image](https://user-images.githubusercontent.com/98178943/155996127-8ad0b29d-2a8f-429d-98c9-33ac6688aebc.png)
### Commands

docker pull/push/run

docker run [image-name]

`docker rmi [image-name] -f` to forcefully remove an image

`docker login` - sends request to docker hub and authenticates account.

If you come across an issue with 'None TTY device', enter `alias docker="winpty docker"` in the terminal. Telling the machine that we want to use docker in the TTY environment. 

`docker run -d -p 2368:2368 ghost` to create a container out of that image and run it

```
From the docker documentation:

You'll notice a few flags being used. Here's some more info on them

-d - run the container in detached mode (in the background)

-p 80:80 - map port 80 of the host to port 80 in the container

docker/getting-started - the image to use
```

`localhost:2368` to enter the site

docker ps - shows which containers are running

docker ps -a - docker image run history

To stop a container in the terminal, enter `docker ps` to obtain id, and then enter docker stop [id] to stop it

To resume then container: `docker start`

`docker rm [id]` to delete the container

`docker run -d -p 80:80 nginx`

`docker run -d -p 99:80 nginx`This will port forward to port 99, so to enter the site type in on your browser `localhost:99`

`docker run -d -p 4000:4000 docs/docker.github.io` - runs official docker documentation in a container, can be run offline