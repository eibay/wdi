```sh

Last login: Sun Oct 19 23:34:35 on ttys001
DarthNeel ~
$ ls
Applications/              Documents/                 Movies/                    Public/
Comics/                    Downloads/                 Music/                     code/
Desktop/                   Library/                   Pictures/                  simple_sinatra_for_heroku/
DarthNeel ~
$ cds 12 1
DarthNeel ~/code/wdi/rosencrantz/w12/d01
$ ls
Classwork/   Homework/    Instructors/
DarthNeel ~/code/wdi/rosencrantz/w12/d01
$ cd Instructors/
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors
$ ls
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors
$ mkdir rake
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors
$ cd rake/
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ clear

DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ ls
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ touch Rakefile
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ subl .
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ ls
Rakefile
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ gem list rake

*** LOCAL GEMS ***

rake (10.3.2, 10.3.1, 10.1.1, 10.1.0)
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ rake -T
rake open_door  # opens the car door
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ rake open_door
Car door has been opened
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ cd ..
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors
$ rake -T
rake aborted!
No Rakefile found (looking for: rakefile, Rakefile, rakefile.rb, Rakefile.rb)

(See full trace by running task with --trace)
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors
$ cd rake/
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ ls
Rakefile
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ mkdir test
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ cd test/
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake/test
$ rake -T
(in /Users/DarthNeel/code/wdi/rosencrantz/w12/d01/Instructors/rake)
rake open_door  # opens the car door
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake/test
$ cd ..
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ rm -rf test/
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ rake -T
rake driving:open_door  # opens the car door
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ rake driving:open_door
Car door has been opened
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ rake open_door
rake aborted!
Don't know how to build task 'open_door'

(See full trace by running task with --trace)
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ rake -T
rake driving:open_door  # opens the car door
rake driving:seatbelt   # put on my seatbelt
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ rake driving:seatbelt
Seatbelt has been put on
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ rake driving:destination PLACE=brooklyn
brooklyn
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ rake driving:destination PLACE=NJ
Entering NJ into the GPS
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ rake -T
rake driving:destination  # enter destination into GPS
rake driving:open_door    # opens the car door
rake driving:seatbelt     # put on my seatbelt
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ rake -T
rake driving:destination  # enter destination into GPS
rake driving:open_door    # opens the car door
rake driving:seatbelt     # put on my seatbelt
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ rake -T
rake driving:destination  # enter destination into GPS - enter the name of the place as such 'PLACE=destination'
rake driving:open_door    # opens the car door
rake driving:seatbelt     # put on my seatbelt
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ rake -T
rake driving:destination  # enter destination into GPS - enter the name of the place as such 'PLACE=destination'
rake driving:driver       # creates driver file
rake driving:open_door    # opens the car door
rake driving:seatbelt     # put on my seatbelt
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ rake driving:driver
touch driver.md
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ ls
Rakefile   driver.md
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ ls
Rakefile   driver.md
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ echo "neel" >> driver.md
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ rake -T
rake driving:destination  # enter destination into GPS - enter the name of the place as such 'PLACE=destination'
rake driving:driver       # creates driver file with a drivers name written to it
rake driving:open_door    # opens the car door
rake driving:seatbelt     # put on my seatbelt
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ rm driver.md 
remove driver.md? y
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ rake driving:driver NAME=tim
touch driver.md
echo tim >> driver.md
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/rake
$ cd ..
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors
$ ls
rake/
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors
$ rails new hero_tracker --database=postgresql
      create  
      create  README.rdoc
      create  Rakefile
      create  config.ru
      create  .gitignore
      create  Gemfile
      create  app
      create  app/assets/javascripts/application.js
      create  app/assets/stylesheets/application.css
      create  app/controllers/application_controller.rb
      create  app/helpers/application_helper.rb
      create  app/views/layouts/application.html.erb
      create  app/assets/images/.keep
      create  app/mailers/.keep
      create  app/models/.keep
      create  app/controllers/concerns/.keep
      create  app/models/concerns/.keep
      create  bin
      create  bin/bundle
      create  bin/rails
      create  bin/rake
      create  config
      create  config/routes.rb
      create  config/application.rb
      create  config/environment.rb
      create  config/secrets.yml
      create  config/environments
      create  config/environments/development.rb
      create  config/environments/production.rb
      create  config/environments/test.rb
      create  config/initializers
      create  config/initializers/backtrace_silencers.rb
      create  config/initializers/cookies_serializer.rb
      create  config/initializers/filter_parameter_logging.rb
      create  config/initializers/inflections.rb
      create  config/initializers/mime_types.rb
      create  config/initializers/session_store.rb
      create  config/initializers/wrap_parameters.rb
      create  config/locales
      create  config/locales/en.yml
      create  config/boot.rb
      create  config/database.yml
      create  db
      create  db/seeds.rb
      create  lib
      create  lib/tasks
      create  lib/tasks/.keep
      create  lib/assets
      create  lib/assets/.keep
      create  log
      create  log/.keep
      create  public
      create  public/404.html
      create  public/422.html
      create  public/500.html
      create  public/favicon.ico
      create  public/robots.txt
      create  test/fixtures
      create  test/fixtures/.keep
      create  test/controllers
      create  test/controllers/.keep
      create  test/mailers
      create  test/mailers/.keep
      create  test/models
      create  test/models/.keep
      create  test/helpers
      create  test/helpers/.keep
      create  test/integration
      create  test/integration/.keep
      create  test/test_helper.rb
      create  tmp/cache
      create  tmp/cache/assets
      create  vendor/assets/javascripts
      create  vendor/assets/javascripts/.keep
      create  vendor/assets/stylesheets
      create  vendor/assets/stylesheets/.keep
         run  bundle install
Fetching gem metadata from https://rubygems.org/...........
Resolving dependencies...
Using rake 10.3.2
Using i18n 0.6.11
Using json 1.8.1
Using minitest 5.4.2
Using thread_safe 0.3.4
Using tzinfo 1.2.2
Using activesupport 4.1.1
Using builder 3.2.2
Using erubis 2.7.0
Using actionview 4.1.1
Using rack 1.5.2
Using rack-test 0.6.2
Using actionpack 4.1.1
Using mime-types 1.25.1
Using polyglot 0.3.5
Using treetop 1.4.15
Using mail 2.5.4
Using actionmailer 4.1.1
Using activemodel 4.1.1
Using arel 5.0.1.20140414130214
Using activerecord 4.1.1
Using bundler 1.6.2
Using coffee-script-source 1.8.0
Using execjs 2.2.2
Using coffee-script 2.3.0
Using thor 0.19.1
Using railties 4.1.1
Using coffee-rails 4.0.1
Using hike 1.2.3
Using multi_json 1.10.1
Using jbuilder 2.2.3
Using jquery-rails 3.1.2
Using pg 0.17.1
Using tilt 1.4.1
Using sprockets 2.11.0
Using sprockets-rails 2.2.0
Using rails 4.1.1
Using rdoc 4.1.2
Using sass 3.2.19
Using sass-rails 4.0.3
Using sdoc 0.4.1
Using spring 1.1.3
Using turbolinks 2.4.0
Using uglifier 2.5.3
Your bundle is complete!
Use `bundle show [gemname]` to see where a bundled gem is installed.
         run  bundle exec spring binstub --all
* bin/rake: spring inserted
* bin/rails: spring inserted
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors
$ subl .
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors
$ cd hero_tracker/
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/hero_tracker
$ ls
Gemfile       README.rdoc   app/          config/       db/           log/          test/         vendor/
Gemfile.lock  Rakefile      bin/          config.ru     lib/          public/       tmp/
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/hero_tracker
$ cd app/models/
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/hero_tracker/app/models
$ ls
concerns/
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/hero_tracker/app/models
$ touch superhero.rb
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/hero_tracker/app/models
$ ls
concerns/     superhero.rb
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/hero_tracker/app/models
$ cd ../..
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/hero_tracker
$ rake -T
rake about                              # List versions of all Rails frameworks and the environment
rake assets:clean[keep]                 # Remove old compiled assets
rake assets:clobber                     # Remove compiled assets
rake assets:environment                 # Load asset compile environment
rake assets:precompile                  # Compile all the assets named in config.assets.precompile
rake cache_digests:dependencies         # Lookup first-level dependencies for TEMPLATE (like messages/show or comm...
rake cache_digests:nested_dependencies  # Lookup nested dependencies for TEMPLATE (like messages/show or comments/...
rake db:create                          # Creates the database from DATABASE_URL or config/database.yml for the cu...
rake db:drop                            # Drops the database from DATABASE_URL or config/database.yml for the curr...
rake db:fixtures:load                   # Load fixtures into the current environment's database
rake db:migrate                         # Migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)
rake db:migrate:status                  # Display status of migrations
rake db:rollback                        # Rolls the schema back to the previous version (specify steps w/ STEP=n)
rake db:schema:cache:clear              # Clear a db/schema_cache.dump file
rake db:schema:cache:dump               # Create a db/schema_cache.dump file
rake db:schema:dump                     # Create a db/schema.rb file that is portable against any DB supported by AR
rake db:schema:load                     # Load a schema.rb file into the database
rake db:seed                            # Load the seed data from db/seeds.rb
rake db:setup                           # Create the database, load the schema, and initialize with the seed data ...
rake db:structure:dump                  # Dump the database structure to db/structure.sql
rake db:version                         # Retrieves the current schema version number
rake doc:app                            # Generate docs for the app -- also available doc:rails, doc:guides (optio...
rake log:clear                          # Truncates all *.log files in log/ to zero bytes (specify which logs with...
rake middleware                         # Prints out your Rack middleware stack
rake notes                              # Enumerate all annotations (use notes:optimize, :fixme, :todo for focus)
rake notes:custom                       # Enumerate a custom annotation, specify with ANNOTATION=CUSTOM
rake rails:template                     # Applies the template supplied by LOCATION=(/path/to/template) or URL
rake rails:update                       # Update configs and some other initially generated files (or use just upd...
rake routes                             # Print out all defined routes in match order, with names
rake secret                             # Generate a cryptographically secure secret key (this is typically used t...
rake stats                              # Report code statistics (KLOCs, etc) from the application
rake test                               # Runs test:units, test:functionals, test:generators, test:integration tog...
rake test:all                           # Run tests quickly by merging all types and not resetting db
rake test:all:db                        # Run tests quickly, but also reset db
rake time:zones:all                     # Displays all time zones, also available: time:zones:us, time:zones:local...
rake tmp:clear                          # Clear session, cache, and socket files from tmp/ (narrow w/ tmp:sessions...
rake tmp:create                         # Creates tmp directories for sessions, cache, sockets, and pids
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/hero_tracker
$ rake db:create
hero_tracker_development already exists
hero_tracker_test already exists
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/hero_tracker
$ rake db:drop
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/hero_tracker
$ rake db:create
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/hero_tracker
$ psql
psql (9.3.4)
Type "help" for help.

DarthNeel=# \l
                                            List of databases
            Name             |   Owner   | Encoding |   Collate   |    Ctype    |    Access privileges    
-----------------------------+-----------+----------+-------------+-------------+-------------------------
 DarthNeel                   | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 ajax_with_rails_development | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 ajax_with_rails_test        | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 autobody                    | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 backbone_rails_development  | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 backbone_rails_test         | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 contact_list                | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 cookly_development          | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 cookly_test                 | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 garage                      | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 hero_tracker_development    | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 hero_tracker_test           | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 jungle                      | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
DarthNeel=# 
DarthNeel=# \q
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/hero_tracker
$ rake -T
rake about                              # List versions of all Rails frameworks and the environment
rake assets:clean[keep]                 # Remove old compiled assets
rake assets:clobber                     # Remove compiled assets
rake assets:environment                 # Load asset compile environment
rake assets:precompile                  # Compile all the assets named in config.assets.precompile
rake cache_digests:dependencies         # Lookup first-level dependencies for TEMPLATE (like messages/show or comm...
rake cache_digests:nested_dependencies  # Lookup nested dependencies for TEMPLATE (like messages/show or comments/...
rake db:create                          # Creates the database from DATABASE_URL or config/database.yml for the cu...
rake db:drop                            # Drops the database from DATABASE_URL or config/database.yml for the curr...
rake db:fixtures:load                   # Load fixtures into the current environment's database
rake db:migrate                         # Migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)
rake db:migrate:status                  # Display status of migrations
rake db:rollback                        # Rolls the schema back to the previous version (specify steps w/ STEP=n)
rake db:schema:cache:clear              # Clear a db/schema_cache.dump file
rake db:schema:cache:dump               # Create a db/schema_cache.dump file
rake db:schema:dump                     # Create a db/schema.rb file that is portable against any DB supported by AR
rake db:schema:load                     # Load a schema.rb file into the database
rake db:seed                            # Load the seed data from db/seeds.rb
rake db:setup                           # Create the database, load the schema, and initialize with the seed data ...
rake db:structure:dump                  # Dump the database structure to db/structure.sql
rake db:version                         # Retrieves the current schema version number
rake doc:app                            # Generate docs for the app -- also available doc:rails, doc:guides (optio...
rake log:clear                          # Truncates all *.log files in log/ to zero bytes (specify which logs with...
rake middleware                         # Prints out your Rack middleware stack
rake notes                              # Enumerate all annotations (use notes:optimize, :fixme, :todo for focus)
rake notes:custom                       # Enumerate a custom annotation, specify with ANNOTATION=CUSTOM
rake rails:template                     # Applies the template supplied by LOCATION=(/path/to/template) or URL
rake rails:update                       # Update configs and some other initially generated files (or use just upd...
rake routes                             # Print out all defined routes in match order, with names
rake secret                             # Generate a cryptographically secure secret key (this is typically used t...
rake stats                              # Report code statistics (KLOCs, etc) from the application
rake test                               # Runs test:units, test:functionals, test:generators, test:integration tog...
rake test:all                           # Run tests quickly by merging all types and not resetting db
rake test:all:db                        # Run tests quickly, but also reset db
rake time:zones:all                     # Displays all time zones, also available: time:zones:us, time:zones:local...
rake tmp:clear                          # Clear session, cache, and socket files from tmp/ (narrow w/ tmp:sessions...
rake tmp:create                         # Creates tmp directories for sessions, cache, sockets, and pids
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/hero_tracker
$ rails g migration CreateSuperheroesTable
      invoke  active_record
      create    db/migrate/20141020151240_create_superheroes_table.rb
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/hero_tracker
$ rails g migration CreateSuperheroes
      invoke  active_record
      create    db/migrate/20141020151449_create_superheroes.rb
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/hero_tracker
$ rake db:migrate:status
Schema migrations table does not exist yet.
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/hero_tracker
$ rake db:migrate
== 20141020151449 CreateSuperheroes: migrating ================================
-- create_table(:superheroes)
   -> 0.0039s
== 20141020151449 CreateSuperheroes: migrated (0.0040s) =======================

DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/hero_tracker
$ psql
psql (9.3.4)
Type "help" for help.

DarthNeel=# \c heroes_tracker_development
FATAL:  database "heroes_tracker_development" does not exist
Previous connection kept
DarthNeel=# \c heros_tracker_development
FATAL:  database "heros_tracker_development" does not exist
Previous connection kept
DarthNeel=# \l
                                            List of databases
            Name             |   Owner   | Encoding |   Collate   |    Ctype    |    Access privileges    
-----------------------------+-----------+----------+-------------+-------------+-------------------------
 DarthNeel                   | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 ajax_with_rails_development | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 ajax_with_rails_test        | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 autobody                    | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 backbone_rails_development  | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 backbone_rails_test         | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 backbone_rails_test         | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 contact_list                | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 cookly_development          | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 cookly_test                 | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 garage                      | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 hero_tracker_development    | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 hero_tracker_test           | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 jungle                      | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 jungle_tree_development     | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 jungle_tree_test            | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 movies_ajax_app_development | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 musicians                   | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 penguin_pals_development    | DarthNeel | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
DarthNeel=# \c hero_tracker_development
You are now connected to database "hero_tracker_development" as user "DarthNeel".
hero_tracker_development=# \d
                 List of relations
 Schema |        Name        |   Type   |   Owner   
--------+--------------------+----------+-----------
 public | schema_migrations  | table    | DarthNeel
 public | superheroes        | table    | DarthNeel
 public | superheroes_id_seq | sequence | DarthNeel
(3 rows)

hero_tracker_development=# \q
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/hero_tracker
$ rails c
Loading development environment (Rails 4.1.1)
irb(main):001:0> Superhero.all
  Superhero Load (0.4ms)  SELECT "superheros".* FROM "superheros"
PG::UndefinedTable: ERROR:  relation "superheros" does not exist
LINE 1: SELECT "superheros".* FROM "superheros"
                                   ^
: SELECT "superheros".* FROM "superheros"
ActiveRecord::StatementInvalid: PG::UndefinedTable: ERROR:  relation "superheros" does not exist
LINE 1: SELECT "superheros".* FROM "superheros"
                                   ^
: SELECT "superheros".* FROM "superheros"
	from /Users/DarthNeel/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/activerecord-4.1.1/lib/active_record/connection_adapters/postgresql_adapter.rb:815:in `async_exec'
	from /Users/DarthNeel/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/activerecord-4.1.1/lib/active_record/connection_adapters/postgresql_adapter.rb:815:in `block in exec_no_cache'
	from /Users/DarthNeel/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/activerecord-4.1.1/lib/active_record/connection_adapters/abstract_adapter.rb:373:in `block in log'
	from /Users/DarthNeel/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/activesupport-4.1.1/lib/active_support/notifications/instrumenter.rb:20:in `instrument'
	from /Users/DarthNeel/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/activerecord-4.1.1/lib/active_record/connection_adapters/abstract_adapter.rb:367:in `log'
	from /Users/DarthNeel/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/activerecord-4.1.1/lib/active_record/connection_adapters/postgresql_adapter.rb:815:in `exec_no_cache'
	from /Users/DarthNeel/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/activerecord-4.1.1/lib/active_record/connection_adapters/postgresql/database_statements.rb:137:in `exec_query'
	from /Users/DarthNeel/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/activerecord-4.1.1/lib/active_record/connection_adapters/postgresql_adapter.rb:947:in `select'
	from /Users/DarthNeel/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/activerecord-4.1.1/lib/active_record/connection_adapters/abstract/database_statements.rb:31:in `select_all'
	from /Users/DarthNeel/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/activerecord-4.1.1/lib/active_record/connection_adapters/abstract/query_cache.rb:69:in `select_all'
	from /Users/DarthNeel/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/activerecord-4.1.1/lib/active_record/querying.rb:39:in `find_by_sql'
	from /Users/DarthNeel/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/activerecord-4.1.1/lib/active_record/relation.rb:603:in `exec_queries'
	from /Users/DarthNeel/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/activerecord-4.1.1/lib/active_record/relation.rb:487:in `load'
	from /Users/DarthNeel/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/activerecord-4.1.1/lib/active_record/relation.rb:231:in `to_a'
	from /Users/DarthNeel/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/activerecord-4.1.1/lib/active_record/relation.rb:594:in `inspect'
	from /Users/DarthNeel/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/railties-4.1.1/lib/rails/commands/console.rb:90:in `start'
	from /Users/DarthNeel/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/railties-4.1.1/lib/rails/commands/console.rb:9:in `start'
	from /Users/DarthNeel/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/railties-4.1.1/lib/rails/commands/commands_tasks.rb:69:in `console'
	from /Users/DarthNeel/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/railties-4.1.1/lib/rails/commands/commands_tasks.rb:40:in `run_command!'
	from /Users/DarthNeel/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/railties-4.1.1/lib/rails/commands.rb:17:in `<top (required)>'
	from /Users/DarthNeel/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/activesupport-4.1.1/lib/active_support/dependencies.rb:247:in `require'
	from /Users/DarthNeel/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/activesupport-4.1.1/lib/active_support/dependencies.rb:247:in `block in require'
	from /Users/DarthNeel/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/activesupport-4.1.1/lib/active_support/dependencies.rb:232:in `load_dependency'
	from /Users/DarthNeel/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/activesupport-4.1.1/lib/active_support/dependencies.rb:247:in `require'
	from /Users/DarthNeel/code/wdi/rosencrantz/w12/d01/Instructors/hero_tracker/bin/rails:8:in `<top (required)>'
	from /Users/DarthNeel/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/activesupport-4.1.1/lib/active_support/dependencies.rb:241:in `load'
	from /Users/DarthNeel/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/activesupport-4.1.1/lib/active_support/dependencies.rb:241:in `block in load'
	from /Users/DarthNeel/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/activesupport-4.1.1/lib/active_support/dependencies.rb:232:in `load_dependency'
	from /Users/DarthNeel/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/activesupport-4.1.1/lib/active_support/dependencies.rb:241:in `load'
	from /Users/DarthNeel/.rbenv/versions/2.1.0/lib/ruby/site_ruby/2.1.0/rubygems/core_ext/kernel_require.rb:55:in `require'
	from /Users/DarthNeel/.rbenv/versions/2.1.0/lib/ruby/site_ruby/2.1.0/rubygems/core_ext/kernel_require.rb:55:in `require'
	from -e:1:in `<main>'irb(main):002:0> 
irb(main):003:0* exit
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/hero_tracker
$ rails g migration RenameSupheroesTableToSuperheros
      invoke  active_record
      create    db/migrate/20141020152152_rename_supheroes_table_to_superheros.rb
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/hero_tracker
$ rake db:migrate
== 20141020152152 RenameSupheroesTableToSuperheros: migrating =================
-- rename_table(:superheroes, :superheros)
   -> 0.0040s
== 20141020152152 RenameSupheroesTableToSuperheros: migrated (0.0040s) ========

DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/hero_tracker
$ rails c
Loading development environment (Rails 4.1.1)
irb(main):001:0> Superhero.all
  Superhero Load (0.5ms)  SELECT "superheros".* FROM "superheros"
=> #<ActiveRecord::Relation []>
irb(main):002:0> exit
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/hero_tracker
$ rails g migration AddPowersColumntoSuperheros
      invoke  active_record
      create    db/migrate/20141020153131_add_powers_columnto_superheros.rb
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/hero_tracker
$ rake db:migrate
== 20141020153131 AddPowersColumntoSuperheros: migrating ======================
-- add_column(:superheros, :powers, :string)
   -> 0.0007s
== 20141020153131 AddPowersColumntoSuperheros: migrated (0.0008s) =============

DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/hero_tracker
$ rake db:migrate:status

database: hero_tracker_development

 Status   Migration ID    Migration Name
--------------------------------------------------
   up     20141020151449  Create superheroes
   up     20141020152152  Rename supheroes table to superheros
   up     20141020153131  Add powers columnto superheros

DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors/hero_tracker
$ cd ..
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors
$ git add -A .
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors
$ git commit -m "heros and rake"
[master 523e167] heros and rake
 63 files changed, 1079 insertions(+)
 create mode 100644 w12/d01/Instructors/hero_tracker/.gitignore
 create mode 100644 w12/d01/Instructors/hero_tracker/Gemfile
 create mode 100644 w12/d01/Instructors/hero_tracker/Gemfile.lock
 create mode 100644 w12/d01/Instructors/hero_tracker/README.rdoc
 create mode 100644 w12/d01/Instructors/hero_tracker/Rakefile
 create mode 100644 w12/d01/Instructors/hero_tracker/app/assets/images/.keep
 create mode 100644 w12/d01/Instructors/hero_tracker/app/assets/javascripts/application.js
 create mode 100644 w12/d01/Instructors/hero_tracker/app/assets/stylesheets/application.css
 create mode 100644 w12/d01/Instructors/hero_tracker/app/controllers/application_controller.rb
 create mode 100644 w12/d01/Instructors/hero_tracker/app/controllers/concerns/.keep
 create mode 100644 w12/d01/Instructors/hero_tracker/app/helpers/application_helper.rb
 create mode 100644 w12/d01/Instructors/hero_tracker/app/mailers/.keep
 create mode 100644 w12/d01/Instructors/hero_tracker/app/models/.keep
 create mode 100644 w12/d01/Instructors/hero_tracker/app/models/concerns/.keep
 create mode 100644 w12/d01/Instructors/hero_tracker/app/models/superhero.rb
 create mode 100644 w12/d01/Instructors/hero_tracker/app/views/layouts/application.html.erb
 create mode 100755 w12/d01/Instructors/hero_tracker/bin/bundle
 create mode 100755 w12/d01/Instructors/hero_tracker/bin/rails
 create mode 100755 w12/d01/Instructors/hero_tracker/bin/rake
 create mode 100755 w12/d01/Instructors/hero_tracker/bin/spring
 create mode 100644 w12/d01/Instructors/hero_tracker/config.ru
 create mode 100644 w12/d01/Instructors/hero_tracker/config/application.rb
 create mode 100644 w12/d01/Instructors/hero_tracker/config/boot.rb
 create mode 100644 w12/d01/Instructors/hero_tracker/config/database.yml
 create mode 100644 w12/d01/Instructors/hero_tracker/config/environment.rb
 create mode 100644 w12/d01/Instructors/hero_tracker/config/environments/development.rb
 create mode 100644 w12/d01/Instructors/hero_tracker/config/environments/production.rb
 create mode 100644 w12/d01/Instructors/hero_tracker/config/environments/test.rb
 create mode 100644 w12/d01/Instructors/hero_tracker/config/initializers/backtrace_silencers.rb
 create mode 100644 w12/d01/Instructors/hero_tracker/config/initializers/cookies_serializer.rb
 create mode 100644 w12/d01/Instructors/hero_tracker/config/initializers/filter_parameter_logging.rb
 create mode 100644 w12/d01/Instructors/hero_tracker/config/initializers/inflections.rb
 create mode 100644 w12/d01/Instructors/hero_tracker/config/initializers/mime_types.rb
 create mode 100644 w12/d01/Instructors/hero_tracker/config/initializers/session_store.rb
 create mode 100644 w12/d01/Instructors/hero_tracker/config/initializers/wrap_parameters.rb
 create mode 100644 w12/d01/Instructors/hero_tracker/config/locales/en.yml
 create mode 100644 w12/d01/Instructors/hero_tracker/config/routes.rb
 create mode 100644 w12/d01/Instructors/hero_tracker/config/secrets.yml
 create mode 100644 w12/d01/Instructors/hero_tracker/db/migrate/20141020151449_create_superheroes.rb
 create mode 100644 w12/d01/Instructors/hero_tracker/db/migrate/20141020152152_rename_supheroes_table_to_superheros.rb
 create mode 100644 w12/d01/Instructors/hero_tracker/db/migrate/20141020153131_add_powers_columnto_superheros.rb
 create mode 100644 w12/d01/Instructors/hero_tracker/db/schema.rb
 create mode 100644 w12/d01/Instructors/hero_tracker/db/seeds.rb
 create mode 100644 w12/d01/Instructors/hero_tracker/lib/assets/.keep
 create mode 100644 w12/d01/Instructors/hero_tracker/lib/tasks/.keep
 create mode 100644 w12/d01/Instructors/hero_tracker/log/.keep
 create mode 100644 w12/d01/Instructors/hero_tracker/public/404.html
 create mode 100644 w12/d01/Instructors/hero_tracker/public/422.html
 create mode 100644 w12/d01/Instructors/hero_tracker/public/500.html
 create mode 100644 w12/d01/Instructors/hero_tracker/public/favicon.ico
 create mode 100644 w12/d01/Instructors/hero_tracker/public/robots.txt
 create mode 100644 w12/d01/Instructors/hero_tracker/test/controllers/.keep
 create mode 100644 w12/d01/Instructors/hero_tracker/test/fixtures/.keep
 create mode 100644 w12/d01/Instructors/hero_tracker/test/helpers/.keep
 create mode 100644 w12/d01/Instructors/hero_tracker/test/integration/.keep
 create mode 100644 w12/d01/Instructors/hero_tracker/test/mailers/.keep
 create mode 100644 w12/d01/Instructors/hero_tracker/test/models/.keep
 create mode 100644 w12/d01/Instructors/hero_tracker/test/test_helper.rb
 create mode 100644 w12/d01/Instructors/hero_tracker/vendor/assets/javascripts/.keep
 create mode 100644 w12/d01/Instructors/hero_tracker/vendor/assets/stylesheets/.keep
 create mode 100644 w12/d01/Instructors/rails_rake_exercise.md
 create mode 100644 w12/d01/Instructors/rake/Rakefile
 create mode 100644 w12/d01/Instructors/rake/driver.md
DarthNeel ~/code/wdi/rosencrantz/w12/d01/Instructors
$ git push origin master
Counting objects: 35, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (25/25), done.
Writing objects: 100% (30/30), 8.40 KiB | 0 bytes/s, done.
Total 30 (delta 2), reused 0 (delta 0)
To git@github.com:ga-students/rosencrantz.git
   2a1357c..523e167  master -> master

```

