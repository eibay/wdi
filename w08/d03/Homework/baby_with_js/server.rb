require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'json'

baby_names_parsed = JSON.parse(File.read("./public/ny-baby-names.json"))
baby_names = baby_names_parsed ["data"]

get '/2007' do
  babies_07 = []

  baby_names.each do |baby|
    if baby[8] == "2007"
      hash_2007 = {
        name: baby[9],
        county: baby[10],
        gender: baby[11],
        count:  baby[12]
      }
      babies_07 << hash_2007

    end
  end
  # erb(:"index", {locals: {babies: babies_07}})
end

get '/2008' do
  babies_08 = []

  baby_names.each do |baby|
    if baby[8] == "2008"
      hash_2008 = {
        name: baby[9],
        county: baby[10],
        gender: baby[11],
        count:  baby[12]
      }
      babies_08 << hash_2008
    end
  end
  # erb(:"index", {locals: {babies: babies_08}})
end

get '/2009' do
  babies_09 = []

 baby_names.each do |baby|
    if baby[8] == "2009"
      hash_2009 = {
        name: baby[9],
        county: baby[10],
        gender: baby[11],
        count:  baby[12]
      }
      babies_09 << hash_2009
    end
  end
  # erb(:"index", {locals: {babies: babies_09}})
end

get '/2010' do
  babies_10 = []

  baby_names.each do |baby|
    if baby[8] == "2010"
      hash_2010 = {
        name: baby[9],
        county: baby[10],
        gender: baby[11],
        count:  baby[12]
      }
      babies_10 << hash_2010
    end
  end
  # erb(:"index", {locals: {babies: babies_10}})
end

get '/2011' do
  babies_11 = []

  baby_names.each do |baby|
    if baby[8] == "2011"
      hash_2011 = {
        name: baby[9],
        county: baby[10],
        gender: baby[11],
        count:  baby[12]
      }
      babies_11 << hash_2011
    end
  end
  # erb(:"index", {locals: {babies: babies_11}})
end

get '/2012' do
  babies_12 = []

  baby_names.each do |baby|
    if baby[8] == "2012"
      hash_2012 = {
        name: baby[9],
        county: baby[10],
        gender: baby[11],
        count:  baby[12]
      }
      babies_12 << hash_2012
    end
  end
  # erb(:"index", {locals: {babies: babies_12}})
end

