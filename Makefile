install:
	bundle install

dbm:
	rails db:migrate

dbs:
	rails db:seed

rr:
	rails routes

psql:
	rails dbconsole

h-dbm:
	heroku run rake db:migrate

h-dbs:
	heroku run rake db:seed

logs:
	heroku logs --tail
