# OS
FROM centos:7
# Set version label
LABEL maintainer="github.com/Dofamin"
LABEL image=Jackett
LABEL OS=Centos7
# Update system packages:
RUN yum -y update > /dev/null 2>&1;\
#General required dependencies
    yum -y install epel-release > /dev/null 2>&1;\
    yum -y install jq wget libicu > /dev/null 2>&1;\
    groupadd -g 1000 Jackett > /dev/null 2>&1;\
    useradd -u 1000 -g 1000 Jackett > /dev/null 2>&1;\
    mkdir -p /opt/Jackett > /dev/null 2>&1;\
    JACKETT_RELEASE=$(curl -sX GET "https://api.github.com/repos/Jackett/Jackett/releases/latest" | "/usr/bin/jq" -r .tag_name) && \
    wget -q -O /tmp/jackett.tar.gz  "https://github.com/Jackett/Jackett/releases/download/${JACKETT_RELEASE}/Jackett.Binaries.LinuxAMDx64.tar.gz" > /dev/null 2>&1  ;\
    tar -xf /tmp/jackett.tar.gz -C /opt/Jackett --strip-components=1 > /dev/null 2>&1 ;\
    rm -rf  /tmp/* > /dev/null 2>&1 ;\
# Clean up
    yum -y autoremove > /dev/null 2>&1 ;\
    yum clean all > /dev/null 2>&1;\
    rm -rf /var/cache/yum > /dev/null 2>&1 
# Expose Ports:
EXPOSE 9117/tcp 9117/udp
# CMD
CMD ["su","-","Jackett","-c","/opt/Jackett/jackett"]
