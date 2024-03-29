# Terraform Beginner Bootcamp 2023 - Week 2


## Working with Ruby

### Bundler

BUndler is a package manager for Ruby.
It is the primary way to install rubi packager (know as gems) for ruby.

#### Install Gems

You nned to create a Gemfile aand define your gems in that file

```rb
source "https://rubygems.org"

gem 'sinatra'
gem 'rake'
gem 'pry'
gem 'puma'
gem 'activerecord'
```
Then you need to run the `bundle install` command

This will install the gems on the system globally (unlike nodejs which install packages in place in a folder called node_modules)

A Gemfile.lock will be created to lock down the gem versions used in this project.

#### Executing ruby scripts in the context of Bundler

We have you use `bundler exec`to tell futury ruby scripts to use the gems we installed. This is the way we set context.

### Sinatra

Sinatra ia micro web-framework for ruby to build web-apps.

It's great for mock or development server or for very simple projects.

you can create a web-server in a single file.

[Sinatra](https://sinatrarb.com/)

## Terratowns Mock Server

### Running the web server

We can run the web server by executing the following commands:

```rb
bundle install
bundle exec ruby server.rv
```

All of the code for our sever is stored in the `server.rb`file.

## CRUD

Terraform Provider resources utilize CRUD.

CRUD stands for Create, Read Update, and Delete

https://en.wikipedia.org/wiki/Create,_read,_update_and_delete