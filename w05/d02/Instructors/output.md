```bash
jeff ~/dev/wdi/rosencrantz/w05/d02/Instructors on master
$ psql
psql (9.3.2)
Type "help" for help.

jeff=# create database wdumblr;
CREATE DATABASE
jeff=# \c wdumblr ;
You are now connected to database "wdumblr" as user "jeff".
wdumblr=# CREATE TABLE authors(
wdumblr(#   name varchar(255),
wdumblr(#   id serial primary key,
wdumblr(#   email varchar(255)
wdumblr(# );
CREATE TABLE
wdumblr=# 
wdumblr=# CREATE TABLE posts(
wdumblr(#   content text,
wdumblr(#   author_id integer,
wdumblr(#   title varchar(255),
wdumblr(#   keyword varchar(50),
wdumblr(#   id serial primary key,
wdumblr(#   created_at timestamp
wdumblr(# );
CREATE TABLE
wdumblr=# \q
jeff ~/dev/wdi/rosencrantz/w05/d02/Instructors on master[!?]
$ 
jeff ~/dev/wdi/rosencrantz/w05/d02/Instructors on master[!?]
$ ruby review.rb 

From: /Users/jeff/dev/wdi/rosencrantz/w05/d02/Instructors/review.rb @ line 19 :

    14: end
    15: 
    16: class Post < ActiveRecord::Base
    17: end
    18: 
 => 19: binding.pry

[1] pry(main)> Post.all()
D, [2014-09-02T09:56:35.088624 #19527] DEBUG -- :   Post Load (0.5ms)  SELECT "posts".* FROM "posts"
=> []
[2] pry(main)> Active
ActiveModel   ActiveRecord  ActiveSupport
[2] pry(main)> ActiveSupport::Inflector
ActiveSupport::Inflector
[2] pry(main)> ActiveSupport::Inflector.
Display all 170 possibilities? (y or n) 
ActiveSupport::Inflector.__binding__                           
ActiveSupport::Inflector.__id__                                
ActiveSupport::Inflector.__send__                              
ActiveSupport::Inflector.acts_like?                            
ActiveSupport::Inflector.alias_attribute                       
ActiveSupport::Inflector.alias_method_chain                    
ActiveSupport::Inflector.ancestors                             
ActiveSupport::Inflector.anonymous?                            
ActiveSupport::Inflector.as_json                               
ActiveSupport::Inflector.autoload                              
ActiveSupport::Inflector.autoload?                             
ActiveSupport::Inflector.blank?                                
ActiveSupport::Inflector.camelize                              
ActiveSupport::Inflector.capture                               
ActiveSupport::Inflector.cattr_accessor                        
ActiveSupport::Inflector.cattr_reader                          
ActiveSupport::Inflector.cattr_writer                          
ActiveSupport::Inflector.class                                 
ActiveSupport::Inflector.class_eval                            
ActiveSupport::Inflector.class_exec                            
ActiveSupport::Inflector.class_variable_defined?               
ActiveSupport::Inflector.class_variable_get                    
ActiveSupport::Inflector.class_variable_set                    
ActiveSupport::Inflector.class_variables                       
ActiveSupport::Inflector.classify                              
ActiveSupport::Inflector.clone                                 
ActiveSupport::Inflector.const_defined?                        
ActiveSupport::Inflector.const_get                             
ActiveSupport::Inflector.const_missing                         
ActiveSupport::Inflector.const_set                             
ActiveSupport::Inflector.constantize                           
ActiveSupport::Inflector.constants                             
ActiveSupport::Inflector.dasherize                             
ActiveSupport::Inflector.deconstantize                         
ActiveSupport::Inflector.deep_dup                              
ActiveSupport::Inflector.define_singleton_method               
ActiveSupport::Inflector.delegate                              
ActiveSupport::Inflector.demodulize                            
ActiveSupport::Inflector.deprecate                             
ActiveSupport::Inflector.display                               
ActiveSupport::Inflector.dup                                   
ActiveSupport::Inflector.duplicable?                           
ActiveSupport::Inflector.enable_warnings                       
ActiveSupport::Inflector.enum_for                              
ActiveSupport::Inflector.eql?                                  
ActiveSupport::Inflector.equal?                                
ActiveSupport::Inflector.extend                                
ActiveSupport::Inflector.foreign_key                           
ActiveSupport::Inflector.freeze                                
ActiveSupport::Inflector.frozen?                               
ActiveSupport::Inflector.guess_for_anonymous                   
ActiveSupport::Inflector.hash                                  
ActiveSupport::Inflector.humanize                              
ActiveSupport::Inflector.include                               
ActiveSupport::Inflector.include?                              
ActiveSupport::Inflector.included_modules                      
ActiveSupport::Inflector.inflections                           
ActiveSupport::Inflector.inspect                               
ActiveSupport::Inflector.instance_eval                         
ActiveSupport::Inflector.instance_exec                         
ActiveSupport::Inflector.instance_method                       
ActiveSupport::Inflector.instance_methods                      
ActiveSupport::Inflector.instance_of?                          
ActiveSupport::Inflector.instance_values                       
ActiveSupport::Inflector.instance_variable_defined?            
ActiveSupport::Inflector.instance_variable_get                 
ActiveSupport::Inflector.instance_variable_names               
ActiveSupport::Inflector.instance_variable_set                 
ActiveSupport::Inflector.instance_variables                    
ActiveSupport::Inflector.is_a?                                 
ActiveSupport::Inflector.kind_of?                              
ActiveSupport::Inflector.load                                  
ActiveSupport::Inflector.load_dependency                       
ActiveSupport::Inflector.local_constants                       
ActiveSupport::Inflector.mattr_accessor                        
ActiveSupport::Inflector.mattr_reader                          
ActiveSupport::Inflector.mattr_writer                          
ActiveSupport::Inflector.method                                
ActiveSupport::Inflector.method_defined?                       
ActiveSupport::Inflector.methods                               
ActiveSupport::Inflector.methods_transplantable?               
ActiveSupport::Inflector.module_eval                           
ActiveSupport::Inflector.module_exec                           
ActiveSupport::Inflector.name                                  
ActiveSupport::Inflector.nil?                                  
ActiveSupport::Inflector.object_id                             
ActiveSupport::Inflector.ordinal                               
ActiveSupport::Inflector.ordinalize                            
ActiveSupport::Inflector.parameterize                          
ActiveSupport::Inflector.parent                                
ActiveSupport::Inflector.parent_name                           
ActiveSupport::Inflector.parents                               
ActiveSupport::Inflector.pluralize                             
ActiveSupport::Inflector.prepend                               
ActiveSupport::Inflector.presence                              
ActiveSupport::Inflector.present?                              
ActiveSupport::Inflector.pretty_inspect                        
ActiveSupport::Inflector.pretty_print                          
ActiveSupport::Inflector.pretty_print_cycle                    
ActiveSupport::Inflector.pretty_print_inspect                  
ActiveSupport::Inflector.pretty_print_instance_variables       
ActiveSupport::Inflector.private_class_method                  
ActiveSupport::Inflector.private_constant                      
ActiveSupport::Inflector.private_instance_methods              
ActiveSupport::Inflector.private_method_defined?               
ActiveSupport::Inflector.private_methods                       
ActiveSupport::Inflector.protected_instance_methods            
ActiveSupport::Inflector.protected_method_defined?             
ActiveSupport::Inflector.protected_methods                     
ActiveSupport::Inflector.pry                                   
ActiveSupport::Inflector.psych_to_yaml                         
ActiveSupport::Inflector.psych_yaml_as                         
ActiveSupport::Inflector.public_class_method                   
ActiveSupport::Inflector.public_constant                       
ActiveSupport::Inflector.public_instance_method                
ActiveSupport::Inflector.public_instance_methods               
ActiveSupport::Inflector.public_method                         
ActiveSupport::Inflector.public_method_defined?                
ActiveSupport::Inflector.public_methods                        
ActiveSupport::Inflector.public_send                           
ActiveSupport::Inflector.qualified_const_defined?              
ActiveSupport::Inflector.qualified_const_get                   
ActiveSupport::Inflector.qualified_const_set                   
ActiveSupport::Inflector.quietly                               
ActiveSupport::Inflector.reachable?                            
ActiveSupport::Inflector.redefine_method                       
ActiveSupport::Inflector.remove_class_variable                 
ActiveSupport::Inflector.remove_instance_variable              
ActiveSupport::Inflector.remove_possible_method                
ActiveSupport::Inflector.require                               
ActiveSupport::Inflector.require_dependency                    
ActiveSupport::Inflector.require_or_load                       
ActiveSupport::Inflector.respond_to?                           
ActiveSupport::Inflector.safe_constantize                      
ActiveSupport::Inflector.send                                  
ActiveSupport::Inflector.silence                               
ActiveSupport::Inflector.silence_stderr                        
ActiveSupport::Inflector.silence_stream                        
ActiveSupport::Inflector.silence_warnings                      
ActiveSupport::Inflector.singleton_class                       
ActiveSupport::Inflector.singleton_class?                      
ActiveSupport::Inflector.singleton_method                      
ActiveSupport::Inflector.singleton_methods                     
ActiveSupport::Inflector.singularize                           
ActiveSupport::Inflector.suppress                              
ActiveSupport::Inflector.tableize                              
ActiveSupport::Inflector.taint                                 
ActiveSupport::Inflector.tainted?                              
ActiveSupport::Inflector.tap                                   
ActiveSupport::Inflector.titleize                              
ActiveSupport::Inflector.to_enum                               
ActiveSupport::Inflector.to_json                               
ActiveSupport::Inflector.to_json_with_active_support_encoder   
ActiveSupport::Inflector.to_json_without_active_support_encoder
ActiveSupport::Inflector.to_param                              
ActiveSupport::Inflector.to_query                              
ActiveSupport::Inflector.to_s                                  
ActiveSupport::Inflector.to_yaml                               
ActiveSupport::Inflector.to_yaml_properties                    
ActiveSupport::Inflector.transliterate                         
ActiveSupport::Inflector.trust                                 
ActiveSupport::Inflector.try                                   
ActiveSupport::Inflector.try!                                  
ActiveSupport::Inflector.underscore                            
ActiveSupport::Inflector.unloadable                            
ActiveSupport::Inflector.untaint                               
ActiveSupport::Inflector.untrust                               
ActiveSupport::Inflector.untrusted?                            
ActiveSupport::Inflector.with_warnings                         
ActiveSupport::Inflector.yaml_as                               
[2] pry(main)> ls ActiveSupport::Inflector
constants: Inflections
ActiveSupport::Inflector#methods: 
  camelize     deconstantize  inflections   pluralize         titleize     
  classify     demodulize     ordinal       safe_constantize  transliterate
  constantize  foreign_key    ordinalize    singularize       underscore   
  dasherize    humanize       parameterize  tableize        
ActiveSupport::Inflector#methods: 
  camelize     deconstantize  inflections   pluralize         titleize     
  classify     demodulize     ordinal       safe_constantize  transliterate
  constantize  foreign_key    ordinalize    singularize       underscore   
  dasherize    humanize       parameterize  tableize        
[3] pry(main)> ActiveSupport::Inflector.pluralize("ox")
=> "oxen"
[4] pry(main)> ActiveSupport::Inflector.pluralize("octupus")
=> "octupus"
[5] pry(main)> ActiveSupport::Inflector.pluralize("octopus")
=> "octopi"
[6] pry(main)> 
[6] pry(main)> Author.all()
D, [2014-09-02T09:58:49.997850 #19527] DEBUG -- :   Author Load (1.3ms)  SELECT "authors".* FROM "authors"
=> []
[7] pry(main)> post = Post.new({content: "Shmee blah", author_id: nil, title: "10 ways to increase linkzzz to your web$ite.", keyword: "monkey"})

=> #<Post content: "Shmee blah", author_id: nil, title: "10 ways to increase linkzzz to your web$ite.", keyword: "monkey", id: nil, created_at: nil>
[8] pry(main)> post
=> #<Post content: "Shmee blah", author_id: nil, title: "10 ways to increase linkzzz to your web$ite.", keyword: "monkey", id: nil, created_at: nil>
[9] pry(main)> post
=> #<Post content: "Shmee blah", author_id: nil, title: "10 ways to increase linkzzz to your web$ite.", keyword: "monkey", id: nil, created_at: nil>
[10] pry(main)> post.save
D, [2014-09-02T10:00:55.106316 #19527] DEBUG -- :    (0.2ms)  BEGIN
D, [2014-09-02T10:00:55.132751 #19527] DEBUG -- :   SQL (13.1ms)  INSERT INTO "posts" ("content", "created_at", "keyword", "title") VALUES ($1, $2, $3, $4) RETURNING "id"  [["content", "Shmee blah"], ["created_at", "2014-09-02 14:00:55.109542"], ["keyword", "monkey"], ["title", "10 ways to increase linkzzz to your web$ite."]]
D, [2014-09-02T10:00:55.139406 #19527] DEBUG -- :    (6.2ms)  COMMIT
=> true
[11] pry(main)> post.attributes["id"]
=> 1
[12] pry(main)> [].save
NoMethodError: undefined method `save' for []:Array
from (pry):11:in `<main>'
[13] pry(main)> {}.attributes
NoMethodError: undefined method `attributes' for {}:Hash
from (pry):12:in `<main>'
[14] pry(main)> 
[14] pry(main)> post.id
=> 1
[15] pry(main)> post.content
=> "Shmee blah"
[16] pry(main)> post.created_at
=> 2014-09-02 14:00:55 UTC
[17] pry(main)> post.title
=> "10 ways to increase linkzzz to your web$ite."
[18] pry(main)> post.title=("10 wayzzz to gets the moneys")
=> "10 wayzzz to gets the moneys"
[19] pry(main)> post.title
=> "10 wayzzz to gets the moneys"
[20] pry(main)> post.save
D, [2014-09-02T10:08:56.570899 #19527] DEBUG -- :    (0.2ms)  BEGIN
D, [2014-09-02T10:08:56.574218 #19527] DEBUG -- :   SQL (0.5ms)  UPDATE "posts" SET "title" = $1 WHERE "posts"."id" = 1  [["title", "10 wayzzz to gets the moneys"]]
D, [2014-09-02T10:08:56.575172 #19527] DEBUG -- :    (0.7ms)  COMMIT
=> true
[21] pry(main)> 




[21] pry(main)> Post.find_by("id", 1)
D, [2014-09-02T10:09:40.135061 #19527] DEBUG -- :   Post Load (1.5ms)  SELECT  "posts".* FROM "posts"  WHERE (id) LIMIT 1
E, [2014-09-02T10:09:40.135132 #19527] ERROR -- : PG::DatatypeMismatch: ERROR:  argument of WHERE must be type boolean, not type integer
LINE 1: SELECT  "posts".* FROM "posts"  WHERE (id) LIMIT 1
                                               ^
: SELECT  "posts".* FROM "posts"  WHERE (id) LIMIT 1
ActiveRecord::StatementInvalid: PG::DatatypeMismatch: ERROR:  argument of WHERE must be type boolean, not type integer
LINE 1: SELECT  "posts".* FROM "posts"  WHERE (id) LIMIT 1
                                               ^
: SELECT  "posts".* FROM "posts"  WHERE (id) LIMIT 1
from /Users/jeff/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/activerecord-4.1.4/lib/active_record/connection_adapters/postgresql_adapter.rb:822:in `async_exec'
[22] pry(main)> Post.find_by({ id: 1 })
D, [2014-09-02T10:10:07.502163 #19527] DEBUG -- :   Post Load (0.5ms)  SELECT  "posts".* FROM "posts"  WHERE "posts"."id" = 1 LIMIT 1
=> #<Post content: "Shmee blah", author_id: nil, title: "10 wayzzz to gets the moneys", keyword: "monkey", id: 1, created_at: "2014-09-02 14:00:55">
[23] pry(main)> Post.find_by(id: 1)t.find_by(id: 1)
D, [2014-09-02T10:10:35.350052 #19527] DEBUG -- :   Post Load (0.4ms)  SELECT  "posts".* FROM "posts"  WHERE "posts"."id" = 1 LIMIT 1
=> #<Post content: "Shmee blah", author_id: nil, title: "10 wayzzz to gets the moneys", keyword: "monkey", id: 1, created_at: "2014-09-02 14:00:55">
[24] pry(main)> Post.find_by(id: 1, content: "Shmee blah")
D, [2014-09-02T10:11:04.706275 #19527] DEBUG -- :   Post Load (0.6ms)  SELECT  "posts".* FROM "posts"  WHERE "posts"."id" = 1 AND "posts"."content" = 'Shmee blah' LIMIT 1
=> #<Post content: "Shmee blah", author_id: nil, title: "10 wayzzz to gets the moneys", keyword: "monkey", id: 1, created_at: "2014-09-02 14:00:55">
[25] pry(main)> Post.find_by({id: 1, content: "Shmee blah"}, "ASDASD")
D, [2014-09-02T10:11:25.640506 #19527] DEBUG -- :   Post Load (0.5ms)  SELECT  "posts".* FROM "posts"  WHERE "posts"."id" = 1 AND "posts"."content" = 'Shmee blah' LIMIT 1
=> #<Post content: "Shmee blah", author_id: nil, title: "10 wayzzz to gets the moneys", keyword: "monkey", id: 1, created_at: "2014-09-02 14:00:55">
[26] pry(main)> found_post = Post.find_by({id: 1, content: "Shmee blah"})
D, [2014-09-02T10:12:28.485345 #19527] DEBUG -- :   Post Load (0.5ms)  SELECT  "posts".* FROM "posts"  WHERE "posts"."id" = 1 AND "posts"."content" = 'Shmee blah' LIMIT 1
=> #<Post content: "Shmee blah", author_id: nil, title: "10 wayzzz to gets the moneys", keyword: "monkey", id: 1, created_at: "2014-09-02 14:00:55">
[27] pry(main)> found_post.class
=> Post(content: text, author_id: integer, title: string, keyword: string, id: integer, created_at: datetime)
[28] pry(main)> found_post = Post.find_by({id: 1})
D, [2014-09-02T10:13:06.539373 #19527] DEBUG -- :   Post Load (0.5ms)  SELECT  "posts".* FROM "posts"  WHERE "posts"."id" = 1 LIMIT 1
=> #<Post content: "Shmee blah", author_id: nil, title: "10 wayzzz to gets the moneys", keyword: "monkey", id: 1, created_at: "2014-09-02 14:00:55">
[29] pry(main)> 
[29] pry(main)> post.author_id = 1
=> 1
[30] pry(main)> post.save
D, [2014-09-02T10:14:54.247240 #19527] DEBUG -- :    (0.4ms)  BEGIN
D, [2014-09-02T10:14:54.249227 #19527] DEBUG -- :   SQL (0.5ms)  UPDATE "posts" SET "author_id" = $1 WHERE "posts"."id" = 1  [["author_id", 1]]
D, [2014-09-02T10:14:54.250404 #19527] DEBUG -- :    (1.0ms)  COMMIT
=> true
[31] pry(main)> Author.all
D, [2014-09-02T10:15:00.140091 #19527] DEBUG -- :   Author Load (0.5ms)  SELECT "authors".* FROM "authors"
=> []
[32] pry(main)> 











[32] pry(main)> Author.new({name: "Hemingway", email: "eway@hotmail.com"})
=> #<Author name: "Hemingway", id: nil, email: "eway@hotmail.com">
[33] pry(main)> a = Author.new({name: "Hemingway", email: "eway@hotmail.com"})
=> #<Author name: "Hemingway", id: nil, email: "eway@hotmail.com">
[34] pry(main)> a.save
D, [2014-09-02T10:15:34.199585 #19527] DEBUG -- :    (0.4ms)  BEGIN
D, [2014-09-02T10:15:34.202129 #19527] DEBUG -- :   SQL (0.7ms)  INSERT INTO "authors" ("email", "name") VALUES ($1, $2) RETURNING "id"  [["email", "eway@hotmail.com"], ["name", "Hemingway"]]
D, [2014-09-02T10:15:34.202898 #19527] DEBUG -- :    (0.4ms)  COMMIT
=> true
[35] pry(main)> a.id
=> 1
[36] pry(main)> post
=> #<Post content: "Shmee blah", author_id: 1, title: "10 wayzzz to gets the moneys", keyword: "monkey", id: 1, created_at: "2014-09-02 14:00:55">
[37] pry(main)> another_post = Post.new({content: "BASD", title: "All the things", author_id: a.id, keyword: "bananas"})

=> #<Post content: "BASD", author_id: 1, title: "All the things", keyword: "bananas", id: nil, created_at: nil>
[38] pry(main)> another_post.save
D, [2014-09-02T10:16:28.567100 #19527] DEBUG -- :    (0.2ms)  BEGIN
D, [2014-09-02T10:16:28.568238 #19527] DEBUG -- :   SQL (0.2ms)  INSERT INTO "posts" ("author_id", "content", "created_at", "keyword", "title") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["author_id", 1], ["content", "BASD"], ["created_at", "2014-09-02 14:16:28.567301"], ["keyword", "bananas"], ["title", "All the things"]]
D, [2014-09-02T10:16:28.569562 #19527] DEBUG -- :    (1.0ms)  COMMIT
=> true
[39] pry(main)> 
[39] pry(main)> Post.where({ author_id: 1 })
D, [2014-09-02T10:17:09.590264 #19527] DEBUG -- :   Post Load (0.4ms)  SELECT "posts".* FROM "posts"  WHERE "posts"."author_id" = 1
=> [#<Post content: "Shmee blah", author_id: 1, title: "10 wayzzz to gets the moneys", keyword: "monkey", id: 1, created_at: "2014-09-02 14:00:55">,
 #<Post content: "BASD", author_id: 1, title: "All the things", keyword: "bananas", id: 2, created_at: "2014-09-02 14:16:28">]
[40] pry(main)> the_posts = Post.where({ author_id: 1 })
D, [2014-09-02T10:17:15.545483 #19527] DEBUG -- :   Post Load (0.4ms)  SELECT "posts".* FROM "posts"  WHERE "posts"."author_id" = 1
=> [#<Post content: "Shmee blah", author_id: 1, title: "10 wayzzz to gets the moneys", keyword: "monkey", id: 1, created_at: "2014-09-02 14:00:55">,
 #<Post content: "BASD", author_id: 1, title: "All the things", keyword: "bananas", id: 2, created_at: "2014-09-02 14:16:28">]
[41] pry(main)> the_posts.class
=> Post::ActiveRecord_Relation
[42] pry(main)> the_posts.each do |post|
[42] pry(main)*   puts post
[42] pry(main)* end  
#<Post:0x007fbb03837af0>
#<Post:0x007fbb03837820>
=> [#<Post content: "Shmee blah", author_id: 1, title: "10 wayzzz to gets the moneys", keyword: "monkey", id: 1, created_at: "2014-09-02 14:00:55">,
 #<Post content: "BASD", author_id: 1, title: "All the things", keyword: "bananas", id: 2, created_at: "2014-09-02 14:16:28">]
[43] pry(main)> the_posts[1]
=> #<Post content: "BASD", author_id: 1, title: "All the things", keyword: "bananas", id: 2, created_at: "2014-09-02 14:16:28">
[44] pry(main)> the_posts[1]
[44] pry(main)> the_posts[1].id
=> 2
[45] pry(main)> ^D
jeff ~/dev/wdi/rosencrantz/w05/d02/Instructors on master[!?]
$ 



















jeff ~/dev/wdi/rosencrantz/w05/d02/Instructors on master[!?]
$ ruby review.rb 

From: /Users/jeff/dev/wdi/rosencrantz/w05/d02/Instructors/review.rb @ line 22 :

    17:   def whatever
    18:     return "HEY this post is titled #{self.title}"
    19:   end
    20: end
    21: 
 => 22: binding.pry

[1] pry(main)> post = Post.first
D, [2014-09-02T10:19:54.505969 #20069] DEBUG -- :   Post Load (0.6ms)  SELECT  "posts".* FROM "posts"   ORDER BY "posts"."id" ASC LIMIT 1
=> #<Post content: "Shmee blah", author_id: 1, title: "10 wayzzz to gets the moneys", keyword: "monkey", id: 1, created_at: "2014-09-02 14:00:55">
[2] pry(main)> post
=> #<Post content: "Shmee blah", author_id: 1, title: "10 wayzzz to gets the moneys", keyword: "monkey", id: 1, created_at: "2014-09-02 14:00:55">
[3] pry(main)> post.whatever
=> "HEY this post is titled 10 wayzzz to gets the moneys"
[4] pry(main)> ^D
jeff ~/dev/wdi/rosencrantz/w05/d02/Instructors on master[!?]
$ 
jeff ~/dev/wdi/rosencrantz/w05/d02/Instructors on master[!?]
$ ruby review.rb 

From: /Users/jeff/dev/wdi/rosencrantz/w05/d02/Instructors/review.rb @ line 26 :

    21:   def author
    22:     Author.find_by({id: self.author_id})
    23:   end
    24: end
    25: 
 => 26: binding.pry

[1] pry(main)> post = Post.first
D, [2014-09-02T10:21:02.417222 #20202] DEBUG -- :   Post Load (0.6ms)  SELECT  "posts".* FROM "posts"   ORDER BY "posts"."id" ASC LIMIT 1
=> #<Post content: "Shmee blah", author_id: 1, title: "10 wayzzz to gets the moneys", keyword: "monkey", id: 1, created_at: "2014-09-02 14:00:55">
[2] pry(main)> post.author
D, [2014-09-02T10:21:16.323659 #20202] DEBUG -- :   Author Load (0.6ms)  SELECT  "authors".* FROM "authors"  WHERE "authors"."id" = 1 LIMIT 1
=> #<Author name: "Hemingway", id: 1, email: "eway@hotmail.com">
[3] pry(main)> post.author_id
=> 1
[4] pry(main)> post
=> #<Post content: "Shmee blah", author_id: 1, title: "10 wayzzz to gets the moneys", keyword: "monkey", id: 1, created_at: "2014-09-02 14:00:55">
[5] pry(main)> post.author_id
=> 1
[6] pry(main)> ^D
jeff ~/dev/wdi/rosencrantz/w05/d02/Instructors on master[!?]
$ 
jeff ~/dev/wdi/rosencrantz/w05/d02/Instructors on master[!?]
$ ruby review.rb 

From: /Users/jeff/dev/wdi/rosencrantz/w05/d02/Instructors/review.rb @ line 29 :

    24:   def author
    25:     Author.find_by({id: self.author_id})
    26:   end
    27: end
    28: 
 => 29: binding.pry

[1] pry(main)> heming = Author.first
D, [2014-09-02T10:28:11.342563 #20367] DEBUG -- :   Author Load (0.6ms)  SELECT  "authors".* FROM "authors"   ORDER BY "authors"."id" ASC LIMIT 1
=> #<Author name: "Hemingway", id: 1, email: "eway@hotmail.com">
[2] pry(main)> heming.posts
D, [2014-09-02T10:28:14.441881 #20367] DEBUG -- :   Post Load (0.9ms)  SELECT "posts".* FROM "posts"  WHERE "posts"."author_id" = 1
=> [#<Post content: "Shmee blah", author_id: 1, title: "10 wayzzz to gets the moneys", keyword: "monkey", id: 1, created_at: "2014-09-02 14:00:55">,
 #<Post content: "BASD", author_id: 1, title: "All the things", keyword: "bananas", id: 2, created_at: "2014-09-02 14:16:28">]
[3] pry(main)> ^D
jeff ~/dev/wdi/rosencrantz/w05/d02/Instructors on master[!?]
$ 
```