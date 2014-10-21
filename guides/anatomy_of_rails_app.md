#Anatomy of Rails App
```
.
├── Gemfile  			<----- SAME AS SINATRA
├── Gemfile.lock
├── README.rdoc
├── Rakefile			
├── app					<----- the directory where most MVC logic lives
│   ├── assets
│   │   ├── images
│   │   │   └── rails.png
│   │   ├── javascripts
│   │   │   └── application.js	 <--- javascript manifest file
│   │   └── stylesheets
│   │       └── application.css		<--- css manifest file
│   ├── controllers
│   │   └── application_controller.rb  <--- controller base class (see note #2)
│   ├── helpers
│   │   └── application_helper.rb		<--- helper functions module base class
│   ├── mailers
│   ├── models						<--- SAME AS SINATRA
│   └── views						<--- SAME AS SINATRA
│       └── layouts					<--- layout file(s) must go here.
│           └── application.html.erb  <--- new ERB filenames (see note #3)
├── config							<--- configuration files (see note #4)
│   ├── application.rb
│   ├── boot.rb
│   ├── database.yml				<--- where database configuration lives
│   ├── environment.rb
│   ├── environments
│   │   ├── development.rb
│   │   ├── production.rb
│   │   └── test.rb
│   ├── initializers
│   │   ├── backtrace_silencers.rb
│   │   ├── inflections.rb
│   │   ├── mime_types.rb
│   │   ├── secret_token.rb
│   │   ├── session_store.rb
│   │   └── wrap_parameters.rb
│   ├── locales
│   │   └── en.yml
│   └── routes.rb 					<--- route-mapping goes here (see note #4b)
├── config.ru
├── db
│   └── seeds.rb 				<--- where rake db:seed logic is defined
├── doc
│   └── README_FOR_APP
├── lib
│   ├── assets
│   └── tasks 					<--- where rake tasks ARE defined
├── log
├── public						<--- same as Sinatra
│   ├── 404.html
│   ├── 422.html
│   ├── 500.html
│   ├── favicon.ico
│   ├── index.html  			<-- default index.html file
│   └── robots.txt
├── script
│   └── rails
├──	test
│   ├── fixtures
│   ├── functional
│   ├── integration
│   ├── performance
│   │   └── browsing_test.rb
│   ├── test_helper.rb
│   └── unit
├── tmp
│   └── cache
│       └── assets
└── vendor
    ├── assets
    │   ├── javascripts
    │   └── stylesheets
    └── plugins

```

#Notes

##1. Models (`./app/models`)

The Models are very simliar to how we used Sinatra. They will inherit from ActiveRecored and communicate with our database.

##2. The Application Controller (`./app/controllers`)

The Application Controller is the base class from which other controllers inherit.

Any controller you create will also go in this folder.

```
class SomeOtherController < ApplicationController

end

class YetAnotherController < ApplicationController

end
```

##3. Views (`./app/views`)

Rails renders ERB templates just like Sinatra does.  However, filenames must now follow a different convention. Instead of ``somefile.erb`` the file must now be named ``somefile.html.erb``

Rails also uses a file called `application.html.erb` in the `app/views/layouts` folder. If you look at the file you will see a piece of code saying `<%= yield %>`. This is really useful because any erb files that you create will automatically be displayed where the 'yield' is.

Overall, this helps you because you don't need to create entire HTML/ERB pages every single time. All you need to do is create teh unique elements that each page will need.

##4. The Config Directory (`./config`)

###A. database.yml

This file is where your database login info is configured.  This is very similar to what you added to configure blocks in your environments.rb file in Sinatra.  By default, the database adaptor selected is SQLite3.  We won't really be using this, but it's one of the instances of Rails' opinionatedness.

###B. routes.rb

This file is where your HTTP routing logic is matched with controller methods.  This in some ways resembles the Sinatra bindings.

But instead of:

```
get '/' do
	#something
end
```

It's now:

```
get '/' => 'home#index'
```

There are also a variety of rails helpers and methods available to us here that we'll be using soon.
