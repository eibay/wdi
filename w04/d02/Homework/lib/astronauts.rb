require 'json'
require 'httparty'
require 'securerandom'

class Astronaut
  def self.create(astronaut)
    astronauts = self.all()
    astronauts.push(astronaut)
  
    File.write("./astronauts.txt", astronauts.to_json)
  end

  def self.find_by(key, value)
    self.all().find do |astronaut|
      if(key=="rank")||(key=="name")
      astronaut[key].downcase == value.downcase
    else
       astronaut[key] == value
    end
  end
end
def self.select_by(key, value)
    self.all().select do |astronaut|
      if(key=="rank")||(key=="name")
      astronaut[key].downcase == value.downcase
    else
       astronaut[key] == value
    end
  end
end


  def self.all()
    return JSON.parse(File.read("./astronauts.txt"))
  end

  def self.shuttles()
     return JSON.parse(File.read("./shuttles.txt"))
   end

  def self.new_astronaut(how_many)
  
   
   
   ranks=["Commander", "Pilot" , "Mission Specialist" , "Flight Engineer" , "Payload specialist"]
   total_new=(1..how_many).to_a
     
     total_new.each do |x|
      shuttle_id=self.shuttles().sample["id"]
      astronauts = self.all()
      new_astronaut=HTTParty.get("http://api.randomuser.me/")
      first_name=new_astronaut["results"][0]["user"]["name"]["first"].capitalize
      last_name=new_astronaut["results"][0]["user"]["name"]["last"].capitalize
      name="#{first_name} #{last_name}"
      id=SecureRandom.hex

      astronaut={"name" => name ,  "rank"=>ranks.sample , "id"=>id, "shuttle_id"=>shuttle_id }
      astronauts.push(astronaut)
      File.write("./astronauts.txt", astronauts.to_json)
    end

  end
end
