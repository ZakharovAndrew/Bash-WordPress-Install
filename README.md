# Bash-WordPress-Install

need check

curl --data-urlencode "weblog_title=MY_BLOG_NAME" \
     --data-urlencode "user_name=MYUSERNAME" \
     --data-urlencode "admin_password=MYPASSWORD" \
     --data-urlencode "admin_password2=MYPASSWORD" \
     --data-urlencode "admin_email=MY@EMAIL.COM" \
     --data-urlencode "Submit=Install+WordPress" \
     http://wordpress_host/path_if_any/wp-admin/install.php?step=2
