FROM ubuntu:latest

RUN apt -y update 

# Install slapd and ldap-utils
RUN LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y slapd ldap-utils

# Default configuration: can be overridden at the docker command line or in docker-compose
ENV LDAP_ADMIN_PASSWORD test1234
ENV LDAP_ORGANISATION IBM
ENV LDAP_DOMAIN jazz.net

# Expose default ldap and ldaps ports
EXPOSE 389 636

RUN mkdir -p /etc/service/slapd
ADD slapd.sh /etc/service/slapd/run
RUN chmod +x /etc/service/slapd/run
# To store the data outside the container, mount /var/lib/ldap as a data volume

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Put ldap config and database dir in a volume to persist data.
# VOLUME /etc/ldap/slapd.d /var/lib/ldap

#CMD ["sleep", "infinity"]
CMD ["/etc/service/slapd/run"]
