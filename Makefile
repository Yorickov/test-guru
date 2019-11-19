install:
	bundle install

server:
	rails s

dbm:
	rails db:migrate

dbs:
	rails db:seed
