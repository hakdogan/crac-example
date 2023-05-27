# CRaC

The [CRaC](https://openjdk.org/projects/crac/) is an `OpenJDK` project which provides a mechanism to create a checkpoint and restore from the checkpoint for Java applications while it is executing. The project is intended to improve the start-up and warm-up times and fix some issues with it.

This repository shows you how to create a checkpoint and restore from  it using CRaC.

## Build and Run on Shell

Details on finding and installing the current release can be found [here](https://github.com/CRaC/docs#jdk).
```shell
javac -cp org-crac-0.1.3.jar org/jugistanbul/crac/Greetings.java
jar -cfm greetings.jar manifest.txt org/jugistanbul/crac/Greetings.class

java -XX:CRaCCheckpointTo=image greetings.jar
1th greetings from İstanbul
2th greetings from İstanbul
3th greetings from İstanbul
4th greetings from İstanbul
5th greetings from İstanbul
6th greetings from İstanbul
7th greetings from İstanbul
8th greetings from İstanbul
9th greetings from İstanbul
10th greetings from İstanbul
May 25, 2023 3:35:03 PM jdk.internal.util.jar.PersistentJarFile beforeCheckpoint
INFO: /home/ubuntu/greetings/greetings.jar is recorded as always available on restore
May 25, 2023 3:35:03 PM jdk.internal.util.jar.PersistentJarFile beforeCheckpoint
INFO: /home/ubuntu/greetings/org-crac-0.1.3.jar is recorded as always available on restore
CR: Checkpoint ...
Killed

java -XX:CRaCRestoreFrom=image
Done...
```
## With Docker

```shell
docker build -f ./.Dockerfile -t crac_example .
```

```shell
docker run -it --privileged --rm --name crac_example crac_example
/home/greetings# java -XX:CRaCCheckpointTo=image -jar greetings.jar

#for restore
/home/greetings# java -XX:CRaCRestoreFrom=image
```

