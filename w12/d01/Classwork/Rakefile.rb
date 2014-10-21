#
# desc "Testing this shiznit out."
# task :write do
#   sh "echo 'Hi' >> yo.tmp"
# end
#
# task :dirs do
#   sh "mkdir wheeee"
# end
#
# task :done => [:write, :dirs] do
#   puts "I think I get it."
# end

desc "Create server.rb"
task :make_server do
  sh "touch server.rb"
end

desc "Make folders for sinatra"
task :make_folders do
  sh "mkdir views"
  sh "touch views/index.erb"
  sh "mkdir public"
end

desc "write to server"
task :write do
  sh "echo 'require \"sinatra\"' > server.rb"
end
