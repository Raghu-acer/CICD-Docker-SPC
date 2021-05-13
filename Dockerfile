FROM tomcat:8
# Take the war and copy to webapps of tomcat
COPY target/*.jar /usr/local/tomcat/webapps/*.jar
EXPOSE 8080
CMD [ "java", "-jar", "spring-petclinic.jar" ]