#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

# Initial setup
apt update
apt install build-essential unzip wget xinetd telnetd mysql-server -y
ufw disable

# Telnet config
cat > /etc/xinetd.d/telnet <<EOF
service telnet
{
    disable         = no
    flags           = REUSE
    socket_type     = stream
    wait            = no
    user            = root
    server          = /usr/sbin/in.telnetd
    log_on_failure  += USERID
}
EOF
systemctl enable xinetd
systemctl restart xinetd
useradd exploit -m -s /bin/bash
echo 'exploit:123456' | chpasswd

# MySQL config
MYSQL_CONFIG="/etc/mysql/mysql.conf.d/mysqld.cnf"
sed -i 's/^bind-address.*/bind-address = 0.0.0.0/' $MYSQL_CONFIG
systemctl restart mysql
mysql -e "CREATE USER 'hacker'@'%' IDENTIFIED BY 'hacked'; GRANT ALL PRIVILEGES ON *.* TO 'hacker'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"

# vsftpd 2.3.4 setup
cd /tmp
wget https://github.com/pwnwiki/pwnwiki.github.io/raw/master/exploits/vsftpd_2.3.4.tar.gz
tar -xvzf vsftpd_2.3.4.tar.gz
cd vsftpd-2.3.4
make
cat > /tmp/vsftpd.conf <<EOF
anonymous_enable=YES
local_enable=YES
write_enable=YES
listen=YES
EOF
nohup ./vsftpd /tmp/vsftpd.conf &
