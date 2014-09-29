require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'json'


get("/") do
	babys = JSON.parse(File.read('./public/ny-baby-names.json'))
	babys = babys["data"]

	babys_json = babys.to_json

	# binding.pry

	erb(:index, { locals: { babys_json: babys_json} })
end

get("/2012") do
	babys = JSON.parse(File.read('./public/ny-baby-names.json'))
	babys = babys["data"]
	babys_2012 = []

	babys.each do |baby|
		if baby[8] == "2012"
			babys_2012.push(baby)
		end
	end

	babys2012_json = babys_2012.to_json

	erb(:index, { locals: { babys2012_json: babys2012_json} })
end

get("/2011") do
	babys = JSON.parse(File.read('./public/ny-baby-names.json'))
	babys = babys["data"]
	babys_2011 = []

	babys.each do |baby|
		if baby[8] == "2011"
			babys_2011.push(baby)
		end
	end

	babys2011_json = babys_2011.to_json

	erb(:index, { locals: { babys2011_json: babys2011_json} })
end

get("/test") do
	babys = JSON.parse(File.read('./public/ny-baby-names.json'))
	babys = babys["data"]
	babys_2011 = []

	babys.each do |baby|
		if baby[8] == "2011"
			babys_2011.push(baby)
		end
	end

	test_baby = babys_2011[1]

	testbaby_json = test_baby.to_json

	erb(:indexTest, { locals: { testbaby_json: testbaby_json} })
end




# babys[1..50].each do |baby|
# 				  baby[9].capitalize
# 				  baby[10].capitalize
# 				  baby[11]
# 				  baby[12]
# end

