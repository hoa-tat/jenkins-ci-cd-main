FROM openjdk:17

WORKDIR /appContainer

COPY ./target/jenkinscicd-app.jar /appContainer

EXPOSE 8181

CMD ["java", "-jar", "jenkinscicd-app.jar"]