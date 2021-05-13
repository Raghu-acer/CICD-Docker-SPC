FROM tomcat:8
# Take the war and copy to webapps of tomcat
COPY target/spring-petclinic-2.4.2.jar /usr/local/tomcat/webapps/spring-petclinic-2.4.2.jar
EXPOSE 8080
CMD [ "java", "-jar", "spring-petclinic-2.4.2.jar" ]
