require 'active_record'
require 'pry'
require_relative './db/connection'
require_relative './models/single_number'

Single_number.all().destroy_all