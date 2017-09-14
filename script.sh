#!/usr/bin/env bash
echo Установка Squid...
sleep 1.5
apt-get install squid3 -y
echo Очстка файла squid.conf ...
sleep 1.5
cp /dev/null /etc/squid/squid.conf
echo Запись конфигурационный параметров в файл squid.conf ...
sleep 1.5
echo acl SSL_ports port 443 >/etc/squid/squid.conf
echo acl Safe_ports port 8081 >>/etc/squid/squid.conf
echo acl Safe_ports port 21 >>/etc/squid/squid.conf
echo acl Safe_ports port 70 >>/etc/squid/squid.conf
echo acl Safe_ports port 210 >>/etc/squid/squid.conf
echo acl Safe_ports port 1025-65535 >>/etc/squid/squid.conf
echo acl Safe_ports port 280 >>/etc/squid/squid.conf
echo acl Safe_ports port 488 >>/etc/squid/squid.conf
echo acl Safe_ports port 591 >>/etc/squid/squid.conf
echo acl Safe_ports port 777 >>/etc/squid/squid.conf
echo acl Safe_ports port 8888 >>/etc/squid/squid.conf
echo acl CONNECT method CONNECT >>/etc/squid/squid.conf
echo http_access deny CONNECT !SSL_ports >>/etc/squid/squid.conf
echo http_access allow localhost manager >>/etc/squid/squid.conf
echo http_access deny manager >>/etc/squid/squid.conf
echo http_access allow localhost >>/etc/squid/squid.conf
echo auth_param basic program /usr/lib/squid/basic_ncsa_auth /etc/squid/users_group >>/etc/squid/squid.conf
echo auth_param basic children 5 >>/etc/squid/squid.conf
echo auth_param basic realm =PROXY= >>/etc/squid/squid.conf
echo auth_param basic credentialsttl 2 hours >>/etc/squid/squid.conf
echo acl users_group proxy_auth REQUIRED >>/etc/squid/squid.conf
echo http_access allow users_group >>/etc/squid/squid.conf
echo http_access deny all >>/etc/squid/squid.conf
echo http_port 8081 >>/etc/squid/squid.conf

apt-get install apache2-utils -y
echo Будет создан пользователь squiduser. Введите пароль...
htpasswd -c /etc/squid/users_group squiduser
