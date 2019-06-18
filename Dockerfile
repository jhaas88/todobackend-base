FROM ubuntu:bionic
MAINTAINER Jan Haas


ENV TERM=xterm-256color


#Install Python and  Virtualenv
#Do not install recommended or suggested packages -> keep Image small
RUN apt-get update && \
	apt-get install -y \
	-o APT::Install-Recommend=false -o APT::Install-Suggests=false \
	python3 python3-venv python3-pip


#Start and activate virtual env
#. Operator archieves same as bash Source command
RUN python3 -m venv /appenv && \
	. /appenv/bin/activate && \
	python3 -m pip install pip --upgrade


#Add entrypoint script
ADD scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
