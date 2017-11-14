# RubySkeleton - Ruby Sinatra Base

### Just a small project to server as a baseline for things goign forward.

You will have had to had installed at least Ruby, and MySQL for this to work. The intention of this is to create a small bootstrap framework to be able to get going quickly. This includes an asset pipeline, testing and Active Record.

### Bundle
    ```shell
# Bundle install all the things
bundle install
```
### Rake
```shell
# To see the ActiveRecord options
bundle exec rake -T

# When starting off you might want to create the DB
bundle exec rake db:create

# Running migrations
bundle exec rake db:migrate

# You might also want to seed the database with some data
bundle exec rake db:seed

# You can also run a test with a rake task
rake test
```

### Tests

```shell
# Running tests (Automatically with notifications)
autotest --style=rspec
```