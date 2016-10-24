#!/bin/bash

if [ ! -d /var/lib/mysql/mysql ]; then
    chown mysql:mysql /var/lib/mysql
    
    #Initiating system tables
    mysql_install_db
fi

#stopping mysql with TERM docker signal
trap "mysqladmin shutdown" TERM

#starting mysqld and accept connections from all interfaces
mysqld_safe --bind-address=0.0.0.0 &

#wait until all processes will be finished
wait
