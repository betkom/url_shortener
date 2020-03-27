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
 * GET `<shortened_url>/stats`
 * GET `/stats`

# Shorten a url
To shorten a url

```shell
curl "https://betkom-shortener.herokuapp.com/url/shorten" \
  -d '{
    "base_url: the url you want to shorten, 
    custom_slug: the custom string you want the url to have"
  }'
```

> The base_url is the url you want to shorten
> custom_slug the custom string you want the url to have if wanted
> The above command will return a response like this:

```response
https://betkom-shortener.herokuapp.com/u/<custom_slug or unique random string>
```
To shorten a url, use

### HTTP Request

`POST https://betkom-shortener.herokuapp.com/url/shorten`

### Query Parameters

Parameter | Description
--------- | -----------
base_url | The url you want to shorten (required)
custom_slug | the string you want to append to end of shortened url (optional)

# Retrieve a shortened url stats
To retrieve a shortened url stats

```shell
curl "https://betkom-shortener.herokuapp.com/u/test"
```
> The above command will return a response like this:

```json
{
    "total_visits": 2,
    "created_at": "2020/03/27"
}
```
To retrieve a single shortened url stats, use

### HTTP Request

`GET https://betkom-shortener.herokuapp.com/u/test`

# Retrieve global stats
To retrieve a global stats

```shell
curl "https://betkom-shortener.herokuapp.com/stats"
```
> The above command will return a response like this:

```json
{
  "total_visits": {
      "https://www.bbc.com/news": 2
  }
}
```
<!--bbc.com/news is one of the urls we shortened-->
To retrieve global stats, use

### HTTP Request

`GET https://betkom-shortener.herokuapp.com/u/test`


### Design Decisions
- Used rails because it's faster to get an api up and running
- Used PostgreSQL because Rails has better out of the box support for it over MySQL
- Because multiple custom short links can map to the same base url, decided to use a 1 to many association to model this
- Used a jsonb structure to save each path's stats because it's easy to work with for aggregation and also makes it easy to store total number of clicks per day for each path

