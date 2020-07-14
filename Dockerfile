#FROM tomcat:9
# Take the war and copy to webapps of tomcat
#COPY target/*.war /usr/local/tomcat/webapps/
#ADD command wont work it will not deploy


FROM tomcat:8.0-alpine

LABEL maintainer="hegdevijay118@gmail.com"

COPY target/*.war /usr/local/tomcat/webapps/

EXPOSE 8091

CMD ["catalina.sh", "run"]
