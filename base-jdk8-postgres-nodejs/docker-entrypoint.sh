#!/bin/bash
nohup sudo su - postgres -c '/usr/lib/postgresql/9.5/bin/postgres -D /var/lib/postgresql/9.5/main -c config_file=/etc/postgresql/9.5/main/postgresql.conf' &


echo "Hello World"