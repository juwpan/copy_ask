# https://stackoverflow.com/a/14061796/2237879
#
# This hack allows you to run make commands with any set of arguments.
#
# For example, these lines are the same:
#   > make g devise:install
#   > bundle exec rails generate devise:install
# And these:
#   > make add-migration add_deleted_at_to_users deleted_at:datetime
#   > bundle exec rails g migration add_deleted_at_to_users deleted_at:datetime
# And these:
#   > make add-model Order user:references record:references{polymorphic}
#   > bundle exec rails g model Order user:references record:references{polymorphic}
#
s:
	rails s

c:
	rails c

dbm:
	rails db:migrate

db!:
	rails db:drop db:create db:migrate 
	rails db:fixtures:load

bdbm:
	bundle exec rails db:migrate

dbmh:
	heroku run rake db:migrate

b:
	bundle install

key:
	EDITOR=nano rails credentials:edit

drop:
	fuser -k -n tcp 3000

test-g:
	rails generate rspec:install

.PHONY: db test
