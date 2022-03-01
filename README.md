### Microservices

Microservices are the opposite of a monolith. You have small services that can be deployed individually. Each service has a focus on one aspect of the business functionality. The services are loosely coupled. That means, that the services work relatively independent of each other and only communicate with the other services, if necessary.
Each service built independently, loosely couple and can communicate with each service.

## When to use monolith architecture and microservices?
----------

Real life example: 
```
-	Small shop around you (cornershop, tesco express etc), with limited amount of customers/userbase. 
-	Or in a school, they never have more than a specific number of kids. Net neutral. Kids leave and then are replaced. Maybe slight increase or decrease but measurable. 
-	We use the app to make a payment for lunch, or sports activity etc. This app only has to facilitate a certain amount of users, they know they will never have to serve more. School app doesn’t need to scale so it will be costly to use microservices.
-	Monolith is easy to manage, simple, low cost and does the job. Some events here and there.
```
```
-	Sainsbury’s – Service is used to facilitate all users in the country. Some online exclusive items. We’d go with microservices to facilitate all these extra features, such as microservices for clothing which was introduced recently to these major brands. 
```

# eng103a_docker
![image](https://user-images.githubusercontent.com/98178943/155996127-8ad0b29d-2a8f-429d-98c9-33ac6688aebc.png)
### What is docker?
---------
![image](https://user-images.githubusercontent.com/98178943/156005909-eb1546fd-9c71-4928-93f0-a034bf9c083b.png)

A container is a very lightweight form of a virtual machine. Virtual machines take up a lot of resources and are slow because they have a lot of overhead (hypervisor, guest OS).

A docker container, on the other hand, has access directly to host OS resources through the docker engine. What this means is that containers can spin up and spin down very quickly.

![sadfa](https://images.contentstack.io/v3/assets/blt300387d93dabf50e/bltb6200bc085503718/5e1f209a63d1b6503160c6d5/containers-vs-virtual-machines.jpg)

![image](https://user-images.githubusercontent.com/98178943/156009198-aa8a50e5-828e-4fb5-b209-b1e79c26e959.png)

Why would you want this? Well, a developer’s laptop is very different than a production environment. If you want things to be the same in production as in development, you’ll want to use containers. That way, you have full knowledge of the system.

Another important application of containers is with microservices. It used to be that every part of your production was on one giant machine or VM. This is a problem because if your web server has a memory leak, all the sudden it is affecting your database. For the most protection against failure, you want to separate all the services within your app to their own containers, and orchestrate those containers across many machines, so if one or more machines fail, your system is still going.

## Setting up Docker

- Install docker from [here.](https://docs.docker.com/desktop/windows/install/)

- Restart your computer and then follow [here.](https://docs.microsoft.com/en-us/windows/wsl/install-manual#step-4---download-the-linux-kernel-update-package)

- Restart your computer again just in case and then open up
docker desktop to see if it is running. 

- Enter `docker` in the terminal to see if it is installed.

## Commands
------------

`docker pull/push/run`

`docker run [image-name]`

`docker rmi [image-name] -f` to forcefully remove an image

`docker login` - sends request to docker hub and authenticates account.

If you come across an issue with 'None TTY device', enter `alias docker="winpty docker"` in the terminal. Telling the machine that we want to use docker in the TTY environment. 

`docker run -d -p 2368:2368 ghost` to create a container out of that image and run it

`localhost:2368` to enter the site
```
From the docker documentation:

You'll notice a few flags being used. Here's some more info on them

-d - run the container in detached mode (in the background)

-p 80:80 - map port 80 of the host to port 80 in the container

docker/getting-started - the image to use
```

`docker ps` - shows which containers are running

`docker ps -a` - docker image run history

To stop a container in the terminal, enter `docker ps` to obtain id, and then enter docker stop [id] to stop it

To resume the container: `docker start`

`docker rm [id]` to delete the container of the image.

`docker run -d -p 80:80 nginx`

`docker run -d -p 99:80 nginx`This will port forward to port 99, so to enter the site type in on your browser `localhost:99`

`docker run -d -p 4000:4000 docs/docker.github.io` - runs official docker documentation in a container, can be run offline as it is saved to your localhost.

NOTE: All of these commands can be executed from the click of a button inside the docker desktop GUI.

`docker exec -it [id] sh` - ssh into a container. Enter `alias docker="winpty docker"` if you get a non-TTY device error. 

`uname -a` to find information about container

`cd /usr/share/nginx/html`

`apt-get update -y && apt-get upgrade -y` and `apt-get install nano -y` to install nano

nano into the index.html file and make a change to the title. 

![image](https://user-images.githubusercontent.com/98178943/156160260-d2562ca3-0744-47d0-ae2b-76565cd17646.png)

![image](https://user-images.githubusercontent.com/98178943/156160133-571a5a48-c350-4f84-8b45-0586b286a40f.png)

`exit` to go back to the operating system.

### Copying file from localhost to container

- `docker ps` to find the id/name of container

- `docker cp index.html container_id:/index.html`

- In our case, it is `docker cp index.html romantic_jepsen:/usr/share/nginx/html/index.html`. The changes should be on our webpage from the index.html file. 

![image](https://user-images.githubusercontent.com/98178943/156163562-cc982577-bae4-4c33-bc7b-7e12be48c43f.png)

## To push an image to your dockerhub and to be able to pull it the steps are..
----------------
```
- docker commit <containername/id> <nameit>
- docker tag <containername/id> <username>/<reponame>
- docker push <username>/<reponame>
or

- docker build -t <containername/id> <nameit>
- docker tag <containername/id> <username>/<reponame>
- docker push <username>/<reponame>:latest

### Obtaining logs

To obtain logs of a container, enter `docker logs <containername> >& ~/folder/myFile.log`. You can see an example in this repo. 