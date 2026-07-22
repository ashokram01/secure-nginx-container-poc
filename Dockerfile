
FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
RUN echo "Secure Nginx Container is Running!" > /usr/share/nginx/html/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
