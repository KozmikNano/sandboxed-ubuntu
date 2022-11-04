FROM arm64v8/ubuntu

#Base
# Set the locale

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Password for ssh
ENV PSWD=password

#Copy to image
COPY scripts /

#Update and upgrade packages
RUN apt update && apt upgrade -y \
#Install the dev tools (Not including Node)
	&& apt install curl nano neofetch git python3-pip build-essential openssh-server sudo m4 unzip clang -y \
#Remove uneeded stuff
	&& rm -rf /var/lib/{cache,log}/ \
	&& rm -rf /var/lib/apt/lists/*.lz4 \	
	&& rm -rf /var/log/* \	
	&& rm -rf /tmp/* /var/tmp/* \	
	&& rm -rf /usr/share/doc/ \
	&& rm -rf /usr/share/man/ \	
	&& rm -rf /var/cache/apt/* \	
#Give Permsions and generate ssh-key
	&& chmod +x /entrypoint.sh \
	&& ssh-keygen -A
	
VOLUME /data

#Open SSH Port
EXPOSE 22/tcp

#Setup SSH and install latest nodejs from nvm
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/sbin/sshd", "-D"]