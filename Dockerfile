FROM tomcat:9.0.48-jdk11-openjdk-slim

ADD ./target/app.war /usr/local/tomcat/webapps/

EXPOSE 8080:80

CMD ["catalina.sh", "run"]