# from which image - image we used as our base image
FROM nginx

# label to communicate with team members
LABEL MAINTAINER=YPereira@spartaglobal.com

# copy data from localhost to container
COPY index.html /usr/share/nginx/html

# expose port 80
EXPOSE 80

# launch/create a container
CMD ["nginx", "-g", "daemon off;"]