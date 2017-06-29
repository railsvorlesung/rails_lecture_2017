# Important stuff
 
## Necessary gems

* pg or mongoid (for a database)
* bootstrap-sass (Css Framework)
* devise  (authentication)
* rspec   (test framework)
* paperclip or carrierwave (image upload/file upload)
* letter_opener or letter_opener_web(opens letter into a new windows to debug outgoing mails)

## AWS S3 
* Region: eu-west-1
* a9s-railsvorlesung

user hat zugriff darin auf home/$username
railsvorlesung8 auf a9s-railsvorlesung/home/railsvorlesung8/ schreiben

### Environment Variables:

```yaml
AWS_ACCESS_KEY_ID: <key>
AWS_SECRET_ACCESS_KEY: <secret>
AWS_REGION: 'eu-west-1'
AWS_BUCKET: a9s-railsvorlesung
AWS_PATH:  home/<username>
```

### Paperclip config:

```ruby
  config.paperclip_defaults = {
    :storage => :fog,
     :fog_credentials => {
       :provider => "AWS",
       :region => 'eu-west-1',
       :scheme => 'https',
       :aws_access_key_id => ENV['AWS_ACCESS_KEY_ID'],
       :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
     },
     :fog_host => "https://s3-eu-west-1.amazonaws.com/#{ENV['AWS_BUCKET']}/#{ENV['AWS_PATH']}"
  }
```

### Explorer for S3

cyberduck for windows and Mac
https://cyberduck.io/

maybe try muCommander for Linux:
https://wiki.ubuntuusers.de/Dateimanager/#muCommander


## Pushto anynines /cloudfoundry

define them into manifest.yml
The manifest will be generated after the first cf push.

cf login -a https://api.aws.ie.a9s.eu

cf push <appname>
cf service (to list all created services)
cf create-server a9s-postgres postgres-single-small <databasename> (to create a postgresserver for example)

cf marketplace (to list all possible services)

cf logs <appname> (to access the log files)
cf ssh <appname> (to connect via ssh to your app instance)

cf env <appname> (prints the OS environment variables)

cf run-task <appname> '<task to execute on server, for example bundle exec rake db:migrate>'
cf ssh <appname> -t -c "/tmp/lifecycle/launcher /home/vcap/app 'rails c' ''"

# Optional and further informations

## Usefull links

* http://guides.rubyonrails.org/   # explain all basics of Ruby on Rails
  * The Asset Pipeline
  * Layouts and Rendering in Rails
  * Active Record Query Interface
  * Active Record Validations
  * Active Record Associations
* http://railscasts.com/
* http://afreshcup.com/
* http://rubular.com/              # Interactive Regex Helper
* http://rubydoc.info/             # here exists documentation for mostly every ruby gem
* https://zealdocs.org/            # Offline Documentation for Win/Linux
* http://www.imagemagick.org/script/command-line-processing.php#option  # Examples of Paperclip image size properties
* https://12factor.net/            # How to programm a good CloudFoundry / Anynines / Heroku  App

## Usefull optional gems

* envyable or figaro (loads yaml file into environment variables for local development)
* better-errors (prints better readable error pages in development)
* rails-i18n (default translations for many languages)
* jquery-rails (if query is missing by bootstrap)

* bootstrap_form (provide FormBuilder for Bootstrap style)
* kaminari (pagination of a list of elements)
* clockwork (to manage tasks like cronjobs)
* activejob (for background processes, pls read the Rails Guide for further information)

* prawn (PDF generation)



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
* vcr (records web requests for store test conditions)

  


