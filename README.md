# Demo Backend API and Performance Automation Testing

This repo contains API and Performance Automation code Demo.

## Prerequisities

- Java 1.8 and Maven is installed in system
- Import in preferred IDE as Maven Project

## Running in local

Make sure to run this command to install maven dependencies

`mvn clean install`

Run below command to run tests

`mvn test`

## Running in pipeline

To ship the maven dependencies to the taregt environment. The folder `repo` contains all maven dependencies and it is checked in to VCS.

Below commands are used to create this local maven repository.

```
mvn -Dmaven.repo.local=repo dependency:go-offline
mvn clean install -Dmaven.repo.local=repo
mvn test -Dmaven.repo.local=repo
```

In the deployment pipeline, below command is used to run the automation tests in offline mode.

`mvn test -Dmaven.repo.local=repo -o`
