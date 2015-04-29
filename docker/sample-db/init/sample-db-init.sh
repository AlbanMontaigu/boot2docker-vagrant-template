#!bin/sh

# -----------------------------------------
# Waiting for DB
# -----------------------------------------

# Prepare user & pass in default args
MYSQL_ARGS="-h$MYSQL_HOST -P$MYSQL_PORT -uroot -p$MYSQL_ROOT_PASSWORD"

# Show env for log
echo "== Showing env"
env

# Checking DB connection
echo "== Checking DB connection !"
for i in `seq 1 10`; do 
    db_online=$(mysql $MYSQL_ARGS -N -s -e 'SELECT "OK";' || echo "KO")
    if [ "$db_online" = "OK" ]
    then
        echo "== DB found !"
        break
    else
        echo "== Waiting for existence of DB !"
        sleep 1
    fi
done

# The end maybe...
if  [ "$db_online" != "OK" ]
then
    echo "== DB not found !"
    exit 1
fi


# -----------------------------------------
# DB initialisation
# -----------------------------------------

# If already init then exit
echo "== Checking if DB is already init"
db_check=$(mysql $MYSQL_ARGS -N -s -e 'SHOW DATABASES LIKE "my_database";' || echo "KO")
if [ "$db_check" = "my_database" ]
then
    echo "== DB already created, nothing to do"
    exit
else
    echo "== No DB created let's do it !"
fi

# DB scripts execution
echo "== Executing 1_sample-db-init.sql"
mysql $MYSQL_ARGS < /tmp/ump-db/init/1_sample-db-init.sql

