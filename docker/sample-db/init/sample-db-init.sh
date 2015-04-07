#!bin/sh

# -----------------------------------------
# Waiting for DB
# -----------------------------------------

# Show env for log
echo "== Showing env"
env

db_online="KO"
echo "== Checking DB connection !"
for i in `seq 1 10`; do 
    db_online=$(mysql -h$MYSQL_HOST -P$MYSQL_PORT -uroot -p$MYSQL_ROOT_PASSWORD -N -s -e 'SELECT "OK";' || echo "KO")
    if [ $db_online = "OK" ]
	then
        echo "== DB found !"
        break
    else
        echo "== Waiting for existence of DB !"
        sleep 1
    fi
done

# The end maybe...
if  [ $db_online != "OK" ]
then
    echo "== DB not found !"
    exit 1
fi

# -----------------------------------------
# DB initialisation
# -----------------------------------------

# DB scripts execution
echo "== Executing 1_ump-db-init-droits.sql"
mysql -h$MYSQL_HOST -P$MYSQL_PORT -uroot -p$MYSQL_ROOT_PASSWORD < /tmp/ump-db/init/1_ump-db-init-droits.sql
echo "== Executing 2_ump-db-init-portail.sql"
mysql -h$MYSQL_HOST -P$MYSQL_PORT -uroot -p$MYSQL_ROOT_PASSWORD < /tmp/ump-db/init/2_ump-db-init-portail.sql
echo "== Executing 3_ump-db-init-user.sql"
mysql -h$MYSQL_HOST -P$MYSQL_PORT -uroot -p$MYSQL_ROOT_PASSWORD < /tmp/ump-db/init/3_ump-db-init-user.sql
