FROM ubuntu:20.04
RUN DEBIAN_FRONTEND=noninteractive apt update
RUN DEBIAN_FRONTEND=noninteractive apt upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt install -y curl
RUN DEBIAN_FRONTEND=noninteractive apt install -y openjdk-11-jre
RUN curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
RUN echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | tee /etc/apt/sources.list.d/jenkins.list > /dev/null
RUN apt update && apt install -y jenkins
RUN service jenkins start

CMD service jenkins start && tail -F /var/log/jenkins/error.log
