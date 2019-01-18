#!/bin/bash

if [ $# = "4" ]
then
  # download and unpack
  wget http://wordpress.org/latest.tar.gz
  tar xzf latest.tar.gz
  rm latest.tar.gz
  cd wordpress
  mv wp-config-sample.php wp-config.php

  # get SALT
  SALT=$(curl -L https://api.wordpress.org/secret-key/1.1/salt/)
  STRING='put your unique phrase here'
  printf '%s\n' "g/$STRING/d" a "$SALT" . w | ed -s wp-config.php
  
  # generate password
  wp_password=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)

  sed -i "s/database_name_here/$2/g" "wp-config.php"
  sed -i "s/username_here/$3/g" "wp-config.php"
  sed -i "s/password_here/$wp_password/g" "wp-config.php"
  
  #move all files
  cd ../
  mv wordpress/* $1
else                                      
   echo Format:   $0 dirname db_name
fi
