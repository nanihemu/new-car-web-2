FROM tomcat:9-jdk8
RUN rm -rf /usr/local/tomcat/webapps/ROOT
COPY target/carhub.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080

