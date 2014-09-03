require 'prime'

def primes()
  Prime.each(100) do |prime|
    puts prime
  end
end

primes()
