# use a node base image
FROM node:8-onbuild

# set maintainer
LABEL maintainer "weerobert2011@gmail.com"

EXPOSE 8080
COPY server.js .
CMD node server.js
