#Here is a sample dockerfile-- Docker can build images automatically by reading the instructions from a Dockerfile; this dockerfile installs a centos on your machine(assuming its a linux); and installs dependent libraries needed for  in this case for oracle;
# RUN is an interesting command; When you use RUN command docker spun up an image; next RUN command will run on the last image ID (previous RUN cmd ); Also has some example to use wget command to download-- here RPMS  from the internet and install; 
#-------------------------------------------------------
FROM centos
#ADD centos-7systemd.tar.xz
#VOLUME /home
MAINTAINER georgeantonytj@hotmail.com

ADD . /app


RUN bash /app/usrfldr.sh
RUN bash /app/yumbin.sh