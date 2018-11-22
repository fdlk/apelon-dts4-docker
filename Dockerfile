FROM jboss/wildfly:10.1.0.Final
RUN /opt/jboss/wildfly/bin/add-user.sh apelonadmin apelon --silent
RUN /opt/jboss/wildfly/bin/add-user.sh dtsadminuser dtsadmin -a --silent
RUN /opt/jboss/wildfly/bin/add-user.sh dtsuser dts -a --silent

# DTS_HOME
#ENV DTS_HOME /usr/local/apelon
#RUN mkdir ${DTS_HOME}
#ADD files/dts-linux_4.6.1-838.tar.gz ${DTS_HOME}/
#RUN sh ${DTS_HOME}/bin/makeScriptsExecutable.sh

ADD files/server/wildfly-10/standalone/configuration/standalone-apelondts.xml /opt/jboss/wildfly/standalone/configuration
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "-c", "standalone-apelondts.xml"]
