require "pry"
require_relative "./connection"
require_relative "./num"

nums = Num.order(value: :desc)


nums.each{ |num| puts num.value if num.isPrime }

