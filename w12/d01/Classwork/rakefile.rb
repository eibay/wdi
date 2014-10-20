# rake file is good for scheduling stuff--tasks can run on a schedule
# example go through users who asked for emails and send them every nite at midnight

namespace :driving do 

	desc "opens the car door"
	task :open_door do
		puts "Car door has been opened"
	end

	desc "put on my seatbelt"
	task :seatbeld do
		puts "Seatbelt has been put on"
	end

	desc "enter destination into GPS - enter the name of the place as such 'PLACE=destination'"
	task :destination do
		puts "Enterig #{ENV["PLACE"]} into the GPS"
	end

	desc "creates driver file with a drivers name written to it"
	task :driver do
		sh "touch driver.md"
		sh "echo #{ENV["NAME"]} >> driver.md"
	end
end

# excersice: to make one of these rake files to create a sinatra app

namespace :rat_pack do
	desc "Builds Sinatra application structure"
	task :build do