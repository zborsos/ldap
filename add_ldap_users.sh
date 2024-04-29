#!/bin/bash

# Bulk add users to dev LDAP server 

# the variables below to match your env 
USERNAME="appd"
DIRSRV="127.0.0.1"
PORT="1389"
ROOTDN="cn=admin,dc=jazz,dc=net"
PASSWD="test1234"
LDIF="./usersdata/bulkuser.ldif"


ldapadd -cxD $ROOTDN -f $LDIF -w $PASSWD
# specify the range. For example, 1 - 20  will create 20 users. 
for i in $(seq 1 3); do
        echo "dn: uid=$USERNAME$i,ou=uk,dc=appd,dc=com" > $LDIF
        echo "cn: Drake Smith$i" >> $LDIF
        echo "uid: $USERNAME$i" >> $LDIF
        echo "uidNumber: $i" >> $LDIF
        echo "gidNumber: 10000" >> $LDIF
        echo "sn: Smith$i" >> $LDIF
        echo "givenName: Lucas$i" >> $LDIF
        echo "mail: $USERNAME$i@appd.com" >> $LDIF
        echo "homeDirectory: /home/$USERNAME$i" >> $LDIF
        echo "loginShell: /bin/bash" >> $LDIF
        echo "userPassword: $PASSWD" >> $LDIF
        echo "objectClass: top" >> $LDIF
        echo "objectClass: posixAccount" >> $LDIF
        echo "objectClass: inetOrgPerson" >> $LDIF
        echo "objectClass: organizationalPerson" >> $LDIF
        echo "objectClass: person" >> $LDIF

        /usr/bin/ldapmodify -x -h $DIRSRV -p $PORT -D "$ROOTDN" -w $PASSWD -a -f $LDIF
done

