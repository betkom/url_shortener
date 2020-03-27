# README

This README would normally document whatever steps are necessary to get the
application up and running.

## Getting Started

First, things you will want to install
 ### with homebrew:
 * postgresql (latest version should be fine)
 * ruby (version is `ruby 2.6.4`)
 * rails (version is `rails 6.0.2.2`)

Ensure `config/database.yml` is in place and properly configured. Example can be found in `config/database.example.yml`

Run `rake db:migrate` . The Database will be empty

Run the app with `rails s` and then you can just access the environment at `http://localhost:3000`

## Running tests
Run `rspec`

### URLs
 * POST `/url/shorten`
 * GET `result of the api above`
 * GET `<result of the api above>/stats`
 * GET `/stats`

### Design Decisions
- Used rails because it's faster to get an api up and running
- Used PostgreSQL because Rails has better out of the box support for it over MySQL
- Because multiple custom short links can map to the same base url, decided to use a 1 to many association to model this
- Used a jsonb structure to save each path's stats because it's easy to work with for aggregation and also makes it easy to store total number of clicks per day for each path

