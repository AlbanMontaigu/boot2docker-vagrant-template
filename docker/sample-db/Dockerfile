# ================================================
# UMP database
# ================================================

# ------------------------------------------------
# From mysql img
#
# @see https://github.com/mysql/mysql-docker
# @see https://github.com/mysql/mysql-docker/blob/mysql-server/5.6/Dockerfile
# ------------------------------------------------
FROM mysql:5.6

MAINTAINER Alban Montaigu <alban.montaigu@worldline.com>


# ------------------------------------------------
# WORKAROUND to avoid /var/lib/mysql that is in a
# docker volume. So data init will not persist.
# ------------------------------------------------
RUN mkdir /var/lib/mysql-portal && sed -ri 's/var\/lib\/mysql/var\/lib\/mysql-sample/' /etc/mysql/my.cnf


# ------------------------------------------------
# Env var required for the server and init script 
# too
# ------------------------------------------------
ENV MYSQL_ROOT_PASSWORD="pwd" MYSQL_HOST="127.0.0.1" MYSQL_PORT="3306"


# ------------------------------------------------
# Create tables and load data
# @see http://stackoverflow.com/questions/25920029/setting-up-mysql-and-importing-dump-within-dockerfile
# ------------------------------------------------
ADD init/* /tmp/ump-db/init/

RUN /entrypoint.sh mysqld & /tmp/ump-db/init/ump-db-init.sh
