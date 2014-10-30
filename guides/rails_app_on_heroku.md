#Hosting a Rails Application on Heroku

####Prior Information
- What is the asset pipeline in Rails?
	- Answer: [Rails Guides - The Asset Pipeline](http://guides.rubyonrails.org/asset_pipeline.html)
	- Additonal information: [RailsCast on the Rails Asset Pipeline](http://railscasts.com/episodes/279-understanding-the-asset-pipeline)
- Heroku's [Rails Guide](https://devcenter.heroku.com/articles/getting-started-with-rails4)


####Push to Heroku
- Add the `rails_12factor` gem to your Gemfile.
	- `bundle install`
- Start with your basic Terminal and Heroku commands, you should know these from pushing Sinatra appications to Heroku
	- `git init`
	- `git add -A`
	- `git commit -m "my first commit"`
	- `heroku create`
-  Something to consider ***if you are having an asset precompile issue***
	- Run `rake assets:clean` in your Terminal to get rid of any previously precompiled assets
	- In your config/application.rb put the following: `config.assets.initialize_on_precompile = false`
	- This will change how your Rails application precompiles its assets.  It can be helpful because Heroku will attempt to precompile your assets and not having the above line in your code can conflict with how Heroku wants to do the precompile.
- How do we get our tables into our database on Heroku?
	- `heroku run rake db:migrate`
- How do we populate our tables from a seed file?
	- `heroku run rake db:seed`
- Helpful commands:
	- `heroku run rails console` will allow you to use a rails console with the application on Heroku
	- `heroku pg:psql` will launch your Terminal into your Heroku application's Postgres database
