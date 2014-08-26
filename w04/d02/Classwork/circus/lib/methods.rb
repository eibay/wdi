require 'json'
require 'httparty'
require 'securerandom'

class Clown
  def self.create(mechanic)
    clowns = self.all()
    clowns.push(clown)
  
    File.write("./clowns.txt", clowns.to_json)
  end

  def self.find_by(key, value)
    self.all().select do |clown|
      clown[key].downcase == value.downcase
    end
  end

  def self.all()
    return JSON.parse(File.read("./clowns.txt"))
  end
  def self.cars()
    return JSON.parse(File.read("./cars.txt"))
  end

  def self.new_clown(how_many)
    
   name1=["Bozo" , "Silly" , "Pagliacci" , "Stupid" , "Dumb" , "Revolutionary" , "Crazy" , "Wacky", "Drinky"]
   name2=["Sillier" , "Crazier" , "Bozoier" , "Dumber" , "REevolutionaryer" , "Wackier" , "Clownier" ,"Boozer", "Jones" , "Smith" , "Lady"]
   shoe_size=["15", "16", "17" , "18" , "19" , "20"]
    
      total_new=(1..how_many).to_a
     total_new.each do |x|
      clowns = self.all()
      car_id=self.cars().sample["id"]
      name="#{name1.sample} #{name2.sample}"
      id=SecureRandom.hex
      clown={ "id"=>id , "name" => name , "shoe_size" => shoe_size.sample , "car_id"=>car_id}
      clowns.push(clown)
      File.write("./clowns.txt", clowns.to_json)
    end

  end
end




class Car
  def self.create(car)
    cars = self.all()
    cars.push(car)
    
    
    
    File.write("./cars.txt", cars.to_json)
  end

  def self.all()
      return JSON.parse(File.read("./cars.txt"))
  end

  def self.find_by(key, value)
    self.all().select do |car|
      car[key].downcase == value.downcase
    end
  end

def self.new_car(how_many)
    
     total_new=(1..how_many).to_a
      colors=["blue", "yellow", "red", "green" , "cyan" , "magenta" , "orange" , "forest green" , "orangered"]
      mileage=(10000..200000).to_a
      capacity=(10..20).to_a
     total_new.each do |x|
      
      cars = self.all()
      id=SecureRandom.hex
      car={"id"=>id , "color" => colors.sample , "mileage" => mileage.sample , "capacity"=>capacity.sample}
      cars.push(car)
      File.write("./cars.txt", cars.to_json)
    end

  end
  






end