FROM mysql:5.6
# note: tax import & test database not working for 5.6 (?!)
# use mysql:5.7 by default
ADD data.sql /docker-entrypoint-initdb.d
ADD test-db.sh /docker-entrypoint-initdb.d