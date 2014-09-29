require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'pry'


data_parsed = JSON.parse(File.read('./public/ny-baby-names.json'))

get '/' do
  erb(:babies)
end

get '/2007' do
  content_type :json
  babies_2007 = []
  data_parsed["data"].each do |baby|
    if baby[8] == "2007"
      hash = {
        name: baby[9],
        county: baby[10],
        gender: baby[11],
        count: baby[12]
      }
      babies_2007 << hash
    end
  end
  babies_2007.response.body
end

get '/2008' do
  babies_2008 = []
  data_parsed["data"].each do |baby|
    if baby[8] == "2008"
      hash = {
        name: baby[9],
        county: baby[10],
        gender: baby[11],
        count: baby[12]
      }
      babies_2008 << hash
    end

  end

  erb(:babies, {locals: {babies: babies_2008}})
end

get '/2009' do
  babies_2009 = []
  data_parsed["data"].each do |baby|
    if baby[8] == "2009"
      hash = {
        name: baby[9],
        county: baby[10],
        gender: baby[11],
        count: baby[12]
      }
      babies_2009 << hash
    end

  end

  erb(:babies, {locals: {babies: babies_2009}})
end

get '/2010' do
  babies_2010 = []
  data_parsed["data"].each do |baby|
    if baby[8] == "2010"
      hash = {
        name: baby[9],
        county: baby[10],
        gender: baby[11],
        count: baby[12]
      }
      babies_2010 << hash
    end

  end

  erb(:babies, {locals: {babies: babies_2010}})
end

get '/2011' do
  babies_2011 = []
  data_parsed["data"].each do |baby|
    if baby[8] == "2011"
      hash = {
        name: baby[9],
        county: baby[10],
        gender: baby[11],
        count: baby[12]
      }
      babies_2011 << hash
    end

  end

  erb(:babies, {locals: {babies: babies_2011}})
end 

get '/2012' do
    babies_2012 = []
  data_parsed["data"].each do |baby|
    if baby[8] == "2012"
      hash = {
        name: baby[9],
        county: baby[10],
        gender: baby[11],
        count: baby[12]
      }
      babies_2012 << hash
    end

  end

  erb(:babies, {locals: {babies: babies_2012}})
end