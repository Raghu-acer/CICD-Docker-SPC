FROM openjdk:8
# Take the war and copy to webapps of tomcat
ADD target/*.jar spring-petclinic.jar
EXPOSE 8080
CMD [ "java", "-jar", "spring-petclinic.jar" ]
