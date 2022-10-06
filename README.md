# README

## To build this project use:

`docker-compose build`
and to initialize the db
`docker-compose run app rake db:reset`

# in order to run the project

`docker-compose up` and check localhost:3000,

in seeds you have a list of doctors and a patient already created.

# Tests
`docker-compose run --rm -e RAILS_ENV=test app bin/rails spec:system`