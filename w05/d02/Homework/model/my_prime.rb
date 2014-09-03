require_relative '../prime.rb'
require 'pry'
require 'active_record'
require 'pg'

 ActiveRecord::Base.establish_connection({
   :adapter => "postgresql",
   :host => "localhost",
   :username => "medusa",
   :database => "primes"
 })

 ActiveRecord::Base.logger = Logger.new(STDOUT)

class Prime < ActiveRecord::Base

  def RandomPrime()
    primes().random
    binding.pry
  end

end
