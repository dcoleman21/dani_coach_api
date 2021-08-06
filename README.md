# CaptainU - CoachAPI
![](https://img.shields.io/badge/Rails-6.1.4-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=4e03fc)
![](https://img.shields.io/badge/Ruby-2.7.2-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=fc0324)

## Overview

The scope of this API was to show how I follow documentation, break it down and my overall approach whe a project is given to me. Here are the sprint details:
```
It’s a new sprint and you have been assigned the task of starting work on a new API which will be feeding a iOS mobile app that college coaches will use to perform assessments of athletes at different events.  A separate front end team will be working on the mobile application, while your task is to build out a Rails 6 API to feed data. 

At its core the mobile application will do the following: 

1. Allow a given coach to see a list of tournaments that are coming up
2. Allow the coach to drill down into the tournament and see the teams attending the tournament
3. Drill down into the teams of each tournament and view the players for that team
4. View details on the players and take an assessment on each of them on their performance at the tournament.

You have been given the initial API design specification to work from.  This is a JSONAPI compliant specification that includes: 

1. JWT Token Authentication
    a. API should accept an email and a password and return a JWT
    b. That JWT should be used to authenticate the user and grant them the ability to access the other endpoints
2. A list of endpoints that the application will require to feed data back to the mobile application(s).
```

## Table of Contents
  - [Setup](#setup)
  - [Schema](#schema)
  - [Testing](#testing)
  - [Endpoints](#endpoints)
  - [Authors](#authors)


## Setup:
These instructions are for Mac OS.

This application requires: 
- Ruby 2.7.2
- Rails 6.1.4

The database was created using:
- PostgreSQL

### Local Reop Setup

1. From your command line `mkdir` to create the directory where you want this application to live.
2. From your command line `cd` into your newly created directory
3. Fork & Clone [this](https://github.com/dcoleman21/dani_coach_api) repository
4. From your command line `cd` into your cloned repository
5. To set up your database, from your command line run:
  ``` 
  rails db:{create,migrate,seed}
  ```
 
### Gems
Upon forking and clonng this repository you should have gotten the necessary gems. However, make sure that the following are in your `Gemfile`:

Within the `:developement, :test do` block:
```
  gem 'rspec-rails'
  gem 'pry'
```   

Within the `:test do` block:
```
  gem 'capybara'
  gem 'shoulda-matchers'
```   


These gems should live outside of any blocks:
```
gem 'rack-cors'
gem 'figaro'
gem 'faraday'
gem 'fast_jsonapi'
gem 'bcrypt'
gem 'jwt'
```

You will need to install the gems by running `bundle install`.
* Install Figaro with `bundle exec figaro install` to create an `application.yml` file locally (this will need to be updated with any needed ENV variables!!!)(example: SOMETHING_API_KEY: 89798273429sadlfj332)

[back to top](#table-of-contents)

