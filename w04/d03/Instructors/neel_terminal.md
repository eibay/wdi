```bash
Last login: Tue Aug 26 11:44:16 on ttys003
DarthNeel ~
$ pry
[1] pry(main)> students = []
[]
[2] pry(main)> students.class
Array < Object
[3] pry(main)> students.dorm
NoMethodError: undefined method `dorm' for []:Array
from (pry):3:in `__pry__'
[4] pry(main)> dorms = []
[]
[5] pry(main)> lunch = Array.new
[]
[6] pry(main)> lunch
[]
[7] pry(main)> Array.each do |x|
[7] pry(main)*   puts "hello Array!"
[7] pry(main)* end  
NoMethodError: undefined method `each' for Array:Class
from (pry):7:in `__pry__'
[8] pry(main)> students.new
NoMethodError: undefined method `new' for []:Array
from (pry):10:in `__pry__'
[9] pry(main)> class Dog
[9] pry(main)*   
[9] pry(main)* end  
nil
[10] pry(main)> Dog.new
#<Dog:0x007faa7ba42310>
[11] pry(main)> fido = Dog.new
#<Dog:0x007faa7b17aa98>
[12] pry(main)> fido
#<Dog:0x007faa7b17aa98>
[13] pry(main)> benji = Dog.new
#<Dog:0x007faa7b9e5f98>
[14] pry(main)> fido.class
Dog < Object
[15] pry(main)> class Dog
[15] pry(main)*   
[15] pry(main)*   def self.bark
[15] pry(main)*     puts "WOOOOF!"
[15] pry(main)*   end  
[15] pry(main)*   
[15] pry(main)* end  
:bark
[16] pry(main)> fido = Dog.new
#<Dog:0x007faa7b3e2948>
[17] pry(main)> fido.bark
NoMethodError: undefined method `bark' for #<Dog:0x007faa7b3e2948>
from (pry):27:in `__pry__'
[18] pry(main)> class Dog
[18] pry(main)*   
[18] pry(main)*   def bark
[18] pry(main)*     puts "WOOOOF!"
[18] pry(main)*   end  
[18] pry(main)*   
[18] pry(main)* end  
:bark
[19] pry(main)> fido = Dog.new
#<Dog:0x007faa7ba1e050>
[20] pry(main)> fido.bark
WOOOOF!
nil
[21] pry(main)> # - Create a class called `Comedian`
[22] pry(main)> # - Give it a joke method that will puts your favorite joke
[23] pry(main)> 
[24] pry(main)> class Comedian 
[24] pry(main)*   
[24] pry(main)*   def tell_joke
[24] pry(main)*     puts "What did the buffalo say on the first day of school?"
[24] pry(main)*     puts "Bison."
[24] pry(main)*   end  
[24] pry(main)*   
[24] pry(main)* end  
:tell_joke
[25] pry(main)> sean = Comedian.new
#<Comedian:0x007faa7b258a78>
[26] pry(main)> sean.tell_joke
What did the buffalo say on the first day of school?
Bison.
nil
[27] pry(main)> class Comedian 
[27] pry(main)*   
[27] pry(main)*   def tell_joke(joke)
[27] pry(main)*     # puts "What did the buffalo say on the first day of school?"
[27] pry(main)*     # puts "Bison."
[27] pry(main)*     puts joke
[27] pry(main)*   end  
[27] pry(main)*   
[27] pry(main)* end  
:tell_joke
[28] pry(main)> sean = Comedian.new
#<Comedian:0x007faa7c053bc8>
[29] pry(main)> sean.tell_joke
ArgumentError: wrong number of arguments (0 for 1)
from (pry):51:in `tell_joke'
[30] pry(main)> sean.tell_joke("What does a nosey pepper do? Gets jalapeno business")
What does a nosey pepper do? Gets jalapeno business
nil
[31] pry(main)> sean.tell_joke(What did the buffalo say on the first day of school?
[31] pry(main)*   Bison.")
[31] pry(main)* 
[32] pry(main)> sean.tell_joke("What did the buffalo say on the first day of school?
[32] pry(main)* Bison.")
What did the buffalo say on the first day of school?
Bison.
nil
[33] pry(main)> funny_line = "What did the buffalo say on the first day of school?
[33] pry(main)* Bison."
"What did the buffalo say on the first day of school?\nBison."
[34] pry(main)> sean.tell_joke(funny_line)
What did the buffalo say on the first day of school?
Bison.
nil
[35] pry(main)> class Dog
[35] pry(main)*   
[35] pry(main)*   def initialize(name)
[35] pry(main)*     @name = name 
[35] pry(main)*   end  
[35] pry(main)*   
[35] pry(main)*   def bark
[35] pry(main)*     puts "WOOOOF!"
[35] pry(main)*   end  
[35] pry(main)*   
[35] pry(main)*   def hello
[35] pry(main)*     puts "HELLO! I am #{name}"
[35] pry(main)*   end  
[35] pry(main)*   
[35] pry(main)* end  
:hello
[36] pry(main)> fido = Dog.new
ArgumentError: wrong number of arguments (0 for 1)
from (pry):68:in `initialize'
[37] pry(main)> fido = Dog.new("fido")
#<Dog:0x007faa7b10a360 @name="fido">
[38] pry(main)> fido.hello
NameError: undefined local variable or method `name' for #<Dog:0x007faa7b10a360 @name="fido">
from (pry):77:in `hello'
[39] pry(main)> class Dog
[39] pry(main)*   
[39] pry(main)*   def initialize(name)
[39] pry(main)*     @name = name 
[39] pry(main)*   end  
[39] pry(main)*   
[39] pry(main)*   def bark
[39] pry(main)*     puts "WOOOOF!"
[39] pry(main)*   end  
[39] pry(main)*   
[39] pry(main)*   def hello
[39] pry(main)*     puts "HELLO! I am #{@name}"
[39] pry(main)*   end  
[39] pry(main)*   
[39] pry(main)* end  
:hello
[40] pry(main)> fido = Dog.new("fido")
#<Dog:0x007faa7b9f93e0 @name="fido">
[41] pry(main)> fido.hello
HELLO! I am fido
nil
[42] pry(main)> @name.hello
NoMethodError: undefined method `hello' for nil:NilClass
from (pry):101:in `__pry__'
[43] pry(main)> dog1 = Dog.new("fido")
#<Dog:0x007faa7b04f498 @name="fido">
[44] pry(main)> dog1.hello
HELLO! I am fido
nil
[45] pry(main)> dog2 = Dog.new("bruno")
#<Dog:0x007faa7b93e900 @name="bruno">
[46] pry(main)> dog2.hello
HELLO! I am bruno
nil
[47] pry(main)> dog1.methods
[
    [ 0]                               !()                        Dog (BasicObject)
    [ 1]                              !=(arg1)                    Dog (BasicObject)
    [ 2]                              !~(arg1)                    Dog (Kernel)
    [ 3]                             <=>(arg1)                    Dog (Kernel)
    [ 4]                              ==(arg1)                    Dog (BasicObject)
    [ 5]                             ===(arg1)                    Dog (Kernel)
    [ 6]                              =~(arg1)                    Dog (Kernel)
    [ 7]                     __binding__()                        Dog (Object)
    [ 8]                          __id__()                        Dog (BasicObject)
    [ 9]                        __send__(*arg1)                   Dog (BasicObject)
    [10]                              ai(*options)                Dog (Kernel)
    [11]                 awesome_inspect(*options)                Dog (Kernel)
    [12]                   awesome_print(object, *options)        Dog (Kernel)
    [13]                            bark()                        Dog
    [14]                          byebug(*steps_into, *steps_out) Dog (Kernel)
    [15]                           class()                        Dog (Kernel)
    [16]                           clone()                        Dog (Kernel)
    [17]                        debugger(*steps_into, *steps_out) Dog (Kernel)
    [18]         define_singleton_method(*arg1)                   Dog (Kernel)
    [19]                         display(*arg1)                   Dog (Kernel)
    [20]                             dup()                        Dog (Kernel)
    [21]                        enum_for(*arg1)                   Dog (Kernel)
    [22]                            eql?(arg1)                    Dog (Kernel)
    [23]                          equal?(arg1)                    Dog (BasicObject)
    [24]                          extend(*arg1)                   Dog (Kernel)
    [25]                          freeze()                        Dog (Kernel)
    [26]                         frozen?()                        Dog (Kernel)
    [27]                            hash()                        Dog (Kernel)
    [28]                           hello()                        Dog
    [29]                         inspect()                        Dog (Kernel)
    [30]                   instance_eval(*arg1)                   Dog (BasicObject)
    [31]                   instance_exec(*arg1)                   Dog (BasicObject)
    [32]                    instance_of?(arg1)                    Dog (Kernel)
    [33]      instance_variable_defined?(arg1)                    Dog (Kernel)
    [34]           instance_variable_get(arg1)                    Dog (Kernel)
    [35]           instance_variable_set(arg1, arg2)              Dog (Kernel)
    [36]              instance_variables()                        Dog (Kernel)
    [37]                           is_a?(arg1)                    Dog (Kernel)
    [38]                        kind_of?(arg1)                    Dog (Kernel)
    [39]                          method(arg1)                    Dog (Kernel)
    [40]                         methods(*args)                   Dog (Object)
    [41]                            nil?()                        Dog (Kernel)
    [42]                       object_id()                        Dog (Kernel)
    [43]                  pretty_inspect()                        Dog (Kernel)
    [44]                    pretty_print(q)                       Dog (PP::ObjectMixin)
    [45]              pretty_print_cycle(q)                       Dog (PP::ObjectMixin)
    [46]            pretty_print_inspect()                        Dog (PP::ObjectMixin)
    [47] pretty_print_instance_variables()                        Dog (PP::ObjectMixin)
    [48]                 private_methods(*args)                   Dog (Object)
    [49]               protected_methods(*args)                   Dog (Object)
    [50]                             pry(*object, *hash)          Dog (Object)
    [51]                   public_method(arg1)                    Dog (Kernel)
    [52]                  public_methods(*args)                   Dog (Object)
    [53]                     public_send(*arg1)                   Dog (Kernel)
    [54]        remove_instance_variable(arg1)                    Dog (Kernel)
    [55]                     respond_to?(*arg1)                   Dog (Kernel)
    [56]                            send(*arg1)                   Dog (Kernel)
    [57]                 singleton_class()                        Dog (Kernel)
    [58]                singleton_method(arg1)                    Dog (Kernel)
    [59]               singleton_methods(*args)                   Dog (Object)
    [60]                           taint()                        Dog (Kernel)
    [61]                        tainted?()                        Dog (Kernel)
    [62]                             tap()                        Dog (Kernel)
    [63]                         to_enum(*arg1)                   Dog (Kernel)
    [64]                            to_s()                        Dog (Kernel)
    [65]                           trust()                        Dog (Kernel)
    [66]                         untaint()                        Dog (Kernel)
    [67]                         untrust()                        Dog (Kernel)
    [68]                      untrusted?()                        Dog (Kernel)
]
[48] pry(main)> class Dog
[48] pry(main)*   
[48] pry(main)*   def initialize(name, age, breed)
[48] pry(main)*     @name = name
[48] pry(main)*     @age = age
[48] pry(main)*     @breed = breed 
[48] pry(main)*   end  
[48] pry(main)*   
[48] pry(main)*   def bark
[48] pry(main)*     puts "WOOOOF!"
[48] pry(main)*   end  
[48] pry(main)*   
[48] pry(main)*   def hello
[48] pry(main)*     puts "HELLO! I am #{@name}, a #{@age} year old #{@breed}"
[48] pry(main)*   end  
[48] pry(main)*   
[48] pry(main)* end  
:hello
[49] pry(main)> dog1 = Dog.new("benji", 6, "yrokie")
#<Dog:0x007faa7b393028 @name="benji", @age=6, @breed="yrokie">
[50] pry(main)> dog1.hello
HELLO! I am benji, a 6 year old yrokie
nil
[51] pry(main)> class Comedian
[51] pry(main)*   
[51] pry(main)*   def initialize(name, age, fav_joke)
[51] pry(main)*     @name = name
[51] pry(main)*     @age = age
[51] pry(main)*     @fav_joke = fav_joke
[51] pry(main)*   end  
[51] pry(main)*   
[51] pry(main)*   def tell_joke
[51] pry(main)*     puts @fav_joke
[51] pry(main)*   end  
[51] pry(main)*   
[51] pry(main)* end  
:tell_joke
[52] pry(main)> com1 = Comedian.new("sean", 28, "What did the buffalo say on the first day of school?
[52] pry(main)* Bison.")
#<Comedian:0x007faa7b3f0a48 @name="sean", @age=28, @fav_joke="What did the buffalo say on the first day of school?\nBison.">
[53] pry(main)> com1.tell_joke
What did the buffalo say on the first day of school?
Bison.
nil
[54] pry(main)> 


```
