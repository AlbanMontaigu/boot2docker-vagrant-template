# ================================================
# Sample database
# ================================================

# ------------------------------------------------
# From mysql img
#
# @see https://github.com/AlbanMontaigu/docker-mysql
# ------------------------------------------------
FROM amontaigu/mysql:5.6

MAINTAINER Alban Montaigu <alban.montaigu@gmail.com>

# ------------------------------------------------
# To be able to autocreate data
# ------------------------------------------------

ADD init/*.sql /entrypoint-initdb.d/
