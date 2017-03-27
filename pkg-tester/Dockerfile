FROM centos:7

# Goss
ENV GOSS_VERSION=0.3.1
ENV GOSS_FILE=goss
ENV GOSS_INSTALL_DIR=/opt

# Install Dependancies
WORKDIR ${GRADLE_INSTALL_DIR}
RUN yum -y update
RUN yum -y --nogpgcheck install curl wget

#Install Goss Validation Testing Framework
WORKDIR ${GOSS_INSTALL_DIR}
RUN curl -sSL -o ${GOSS_INSTALL_DIR}/${GOSS_FILE} https://github.com/aelsabbahy/goss/releases/download/v${GOSS_VERSION}/goss-linux-amd64 \
    && chmod +x ${GOSS_INSTALL_DIR}/${GOSS_FILE} \
    && ln -s ${GOSS_INSTALL_DIR}/${GOSS_FILE} /usr/local/bin/goss

# Cleanup
RUN rm -rf *.rpm
RUN rm -rf *.zip
RUN yum -y clean all
