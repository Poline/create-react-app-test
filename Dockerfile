# pull official base image
FROM node:14.2.0-alpine

# set working directory
WORKDIR /create-react-app-test

# add `/app/node_modules/.bin` to $PATH
ENV PATH /create-react-app-test/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm cache clean --force
RUN npm install --no-package-lock
RUN npm install react-scripts@3.4.1 -g --no-package-lock

# add app
COPY . ./

# start app
RUN npm run build

#COPY --from=build-stage /app/build/ /usr/share/nginx/html
RUN cd build
CMD npm run start


