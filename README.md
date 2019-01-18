# Bash-WordPress-Install

need check

curl --data-urlencode "weblog_title=MY_BLOG_NAME" \
     --data-urlencode "user_name=MYUSERNAME" \
     --data-urlencode "admin_password=MYPASSWORD" \
     --data-urlencode "admin_password2=MYPASSWORD" \
     --data-urlencode "admin_email=MY@EMAIL.COM" \
     --data-urlencode "Submit=Install+WordPress" \
     http://wordpress_host/path_if_any/wp-admin/install.php?step=2

USER_DB=$3
MAINDB=$2
echo "Please enter root user MySQL password!"
read rootpasswd
mysql -uroot -p${rootpasswd} -e "CREATE DATABASE ${MAINDB} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
mysql -uroot -p${rootpasswd} -e "CREATE USER ${USER_DB}@localhost IDENTIFIED BY '${PASSWDDB}';"
mysql -uroot -p${rootpasswd} -e "GRANT ALL PRIVILEGES ON ${MAINDB}.* TO '${USER_DB}'@'localhost';"
mysql -uroot -p${rootpasswd} -e "FLUSH PRIVILEGES;"
