FROM ubuntu as builder
RUN apt update
RUN apt install git
RUN apt install maven
RUN apt install default-jre
RUN git clone https://www.github.javarepo.git
RUN cd javarepo/
RUN mvn clean install

FORM tomcat
COPY --from=builder javarepo/target/*.war /webapps
EXPOSE 8080
ENTRYPOINT ./bin/startup.sh
