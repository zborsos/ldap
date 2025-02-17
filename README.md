Ldap
Install Podman
https://podman.io/docs/installation

Install Podman extension :
- [ ] Docker extension
- [ ] Compose extension

get LDAP server from git by typing

git clone https://github.com/zborsos/ldap.git


After restarting your machine you may ned to run :
podman machine init
 and 
podman machine start

Staring the LDAP server
cd theLdapCloneDirectory podman-compose -f ./docker-compose.yml up

In your browser go to  
localhost:8090
username : cn=admin,dc=jazz,dc=net
Passwd : test1234


Stopping the LDAP podman-compose -f ./docker-compose.yml down
