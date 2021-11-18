ALTER USER 'root'@'localhost' IDENTIFIED BY '"{{ db_password }}"';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEGES;

CREATE USER "{{ db_user }}";
ALTER USER 'backend'@'%' IDENTIFIED BY '"{{ db_password }}"';
CREATE DATABASE "{{ db_name }}";
GRANT ALL PRIVILEGES ON tutorials.* TO 'backend'@'%';
FLUSH PRIVILEGES;
