
# Movie_journal

Welcome to Movie Journal! this app will allow you to add a movie you have watched to be able to track it in the future.

## Getting Started

To run this app, clone the repo and run `bundle install`.  The run `shotgun` to start up a server.  You should see the app running on `localhost:9393`.

### Prerequisites

You will need to have Ruby installed on your machine - Linux or Mac.

## Built With

* [Sinatra](http://sinatrarb.com/) - Sinatra, our web framework
* [sinatra-activerecord](https://github.com/bmizerany/sinatra-activerecord) - Our friendly ORM
* [sqlite3](https://rubygems.org/gems/sqlite3/versions/1.3.11) - Our SQL DB gem

## Development


- create a file in the root directory called ```.env```
- inside ```.env```, enter ```SESSION_SECRET=```
- in your terminal, run ```generate_secret```
- copy and paste the output into your ```.env``` file directly after ```SESSION_SECRET=```
- create a file in the root directory called ```.gitignore```
- inside ```.gitignore```, enter ```.env```. This will make sure your ```.env``` file is not tracked in git
- run ```rake db:migrate```
- run ```shotgun``` 
- open up your web browser and enter the local url provided by the shotgun server


Make sure your Gemfile includes these:
source 'http://rubygems.org'
gem 'sinatra'
gem 'activerecord', '~> 4.2', '>= 4.2.6', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'sqlite3', '~> 1.3.6'
gem 'thin'
gem 'shotgun'
gem 'pry'
gem 'bcrypt'
gem 'tux'
gem 'sinatra-flash'
group :development, :test do
gem 'dotenv'
gem 'session_secret_generator'
end
group :test do
gem 'rspec'
gem 'capybara'
gem 'rack-test'
gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end

## Usage

After the page is load clik on Signup to create an account. click in new movie to create a new movie, you will add the name of the movie you want to save and a short description. You will edit and delete any movie you create. if other user add movies you can see it too.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jreyes8631/movie_journal. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/jreyes8631/Movie_journal/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MovieTime project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/Movie_journal/blob/master/CODE_OF_CONDUCT.md).