require 'sinatra'
require 'sinatra/reloader'
require "pry"
require "json"

get("/") do
	erb(:index)
end

get '/:year' do
	nameHash = JSON.parse(File.read("/Users/Trish/dev/wdi/rosencrantz/w08/d03/Homework/public/ny-baby-names.json"))
 	nameHash = nameHash["data"]

 	twok7 = []
 	twok8 = []
 	twok9 = []
 	twok10 = []
 	twok11 = []
 	twok12 = []

 	nameHash.each do |datum|
 		childName = {}
 		childName[:name] = datum[9]
 		childName[:county] = datum[10]
 		childName[:gender] = datum[11]
 		childName[:count] = datum[12]

 		case datum[8] 
 		when "2007"
 			twok7.push(childName) 		
 		when "2008"
 			twok8.push(childName)	
 		when "2009"
 			twok9.push(childName) 	
 		when "2010"
 			twok10.push(childName) 						
 		when "2011"
 			twok11.push(childName)
 		when "2012"
 			twok12.push(childName)
 		end
 	end
 		
 	case params[:year]
 		when "2007"
 			queriedChildren = twok7
 		when "2008"
 			queriedChildren = twok8
 		when "2009"
 			queriedChildren = twok9
 		when "2010"
 			queriedChildren = twok10
 		when "2011" 
 			queriedChildren = twok11
 		when "2012"
 			queriedChildren = twok12
 	end
 			
			
  erb(:show, {locals: {childNames: queriedChildren, year: params[:year]}})
end


























