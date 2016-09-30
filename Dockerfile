FROM ubuntu:14.04

COPY sources.sssp.list /etc/apt/sources.list.d/sssp.list

RUN apt-get update && apt-get install --yes oracle-java8-jdk=8u92


