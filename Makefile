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

hdbm:
	heroku run rake db:migrate

hdbs:
	heroku run rake db:seed

hc:
	heroku run rails console

hlog:
	heroku logs --tail

server:
	rails s

deploy:
	git push heroku $(B):master
