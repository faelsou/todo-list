FROM node:18
WORKDIR /app
EXPOSE 3001
COPY . .
RUN npm install --production
ENTRYPOINT npm start

#RUN npm run build

#FROM nginx:alpine

#COPY --from=build /app/build /usr/share/nginx/html

#EXPOSE 3000

#CMD [ "nginx", "-g", "daemon off;" ]