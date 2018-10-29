# Consul Test SpringBoot App

## Purpose

This repository is a super simple Java SpringBoot Application to be used as a client to test Hashicorp Consul configurations.

## Usage

Setup the service as per one of the steps below and you will have:
 -  http://localhost:8080 - simple text page
 -  http://localhost:8080/actuator/health - simple text page
 -  http://localhost:8080/actuator/info - details 
 -  http://localhost:8500 - Consul Running (if using docker compose)

## Setup

### Without Consul

Add `enabled: false` in the clould.consul section of the [application.yml](./src/main/resources/application.yml) or invoke the jar with a config file with that in it.

### Natively

```
mvn package
java -jar ./target/consultestapp-0.0.1-SNAPSHOT.jar
```

### Docker Compose

```
sudo docker-compose up
```

note that this can take a while.

### Docker

```
sudo docker build . --tag <NAME>
sudo docker run --rm -d -p 8080:8080 -v /path/to/config:/tmp/ <NAME>
```

Note you will need to modify your configuration to specify the location of consul (application container's localhost hasn't got it)

## Current inclusions/Exclusions

### What this application has

* "Hello World" HTTP endpoint http://localhost:8080
* Spring Actuators with version, application name and health http://localhost:8080/actuator
* consul client registration with tag of appliation version
* Docker containerisation
* Docker Compose with 
 - forementioned application
 - consul server

### What this application doesn't have (... yet)
* KV
* Vault
* any discovery of other services

Happy playing and have fun!
