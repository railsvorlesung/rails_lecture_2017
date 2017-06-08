# Important stuff
 
## Necessary gems

* pg or mongoid (for a database)
* bootstrap-sass (Css Framework)
* devise  (authentication)
* rspec   (test framework)
* paperclip or carrierwave (image upload/file upload)
* letter_opener or letter_opener_web(opens letter into a new windows to debug outgoing mails)


## Pushto anynines /cloudfoundry

define them into manifest.yml

cf push <appname>
cf service (to list all created services)
cf create-server a9s-postgres postgres-single-small <databasename> (to create a postgresserver for example)

cf marketplace (to list all possible services)

cf logs <appname> (to access the log files)
cf ssh <appname> (to connect via ssh to your app instance)

cf env <appname> (prints the OS environment variables)

cf run-task <appname> '<task to execute on server, for example bundle exec rake db:migrate>'


# Optional and further informations

## Usefull links

* http://guides.rubyonrails.org/   # explain all basics of Ruby on Rails
* http://railscasts.com/
* http://afreshcup.com/
* http://rubular.com/

## Usefull optional gems

* envyable (loads yaml file into environment variables for local development)
* better-errors (prints better readable error pages in development)
* rails-i18n (default translations for many languages)

* bootstrap_form (provide FormBuilder for Bootstrap style)
* kaminari (pagination of a list of elements)
* clockwork (to manage tasks like cronjobs)
* activejob (for background processes, pls read the Rails Guide for further information)

### Other Templating Engines

* haml-rails
* typescript-rails

### Test Setup

* factory-girl-rails (creates test models)
* faker (provide Test-Data generation)
* guard (runs different tasks automatically if needed)
  * guard-rspec (runs tests if correspondig files changed)
  * guard-bundler (runs bundle install if Gemfile changed)

* shoulda-matchers (provide matchers for rspec tot est validatiosn for example)

  


