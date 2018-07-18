# README
In order to mock server side responses without altering application functionality, was created this Rails local server

## Prerequisites  

1. Install gpg using brew: brew install gpg 
2. Install rails with rvm (https://rvm.io/) with version greater than 5.0. 
NOTE: Use  curl -sSL https://rvm.io/mpapis.asc | gpg --import -
Then use \curl -sSL https://get.rvm.io | bash -s stable --ruby=2.5.1

## Run Server first time

1. Verify if you have installed Bundler with command:  gem which bundler, if not run the command: gem install bundler
2. Once you know that Bundler is installed run the command: bundle install 
3. Then run gem install rails 
4. To make sure the project has the structure needed run 
bundle exec rake rails:update:bin
5. Finally start the server with: rails s -b 0.0.0.0 (by default runs on http://localhost:3000)
