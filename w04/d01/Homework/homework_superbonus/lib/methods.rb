require 'json'
require 'httparty'

class Mechanic
  def self.create(mechanic)
    mechanics = self.all()
    mechanics.push(mechanic)
  
    File.write("./mechanics.txt", mechanics.to_json)
  end

  def self.find_by(key, value)
    self.all().find do |mechanic|
      mechanic[key].downcase == value.downcase
    end
  end

  def self.all()
    return JSON.parse(File.read("./mechanics.txt"))
  end

  def self.new_mechanic(how_many)
  
   ages=(20..100).to_a
   favorite_cars=["ford fusion", "toyota corolla", "bike" , "ford mustang" , "chevrolet corvette" , "saturn"]
   total_new=(1..how_many).to_a
     
     total_new.each do |x|
      mechanics = self.all()
      new_mechanic=HTTParty.get("http://api.randomuser.me/")
      first_name=new_mechanic["results"][0]["user"]["name"]["first"].capitalize
      last_name=new_mechanic["results"][0]["user"]["name"]["last"].capitalize
      name="#{first_name} #{last_name}"

      mechanic={"name" => name , "age" => ages.sample , "favorite_car"=>favorite_cars.sample}
      mechanics.push(mechanic)
      File.write("./mechanics.txt", mechanics.to_json)
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
  def self.mechanics()
    return JSON.parse(File.read("./mechanics.txt"))
  end

def self.add_mechanic(value)
  
  cars=self.all()

  cars.find do |car|

    if(car.has_value? value)
      cars_write=self.all()
      mechanic=self.mechanics().sample
      mechanic=mechanic["name"]
      car_with_mechanic={"make"=>car["make"] , "model"=>car["model"], "color"=>car["color"] , "mechanic"=> mechanic}
      cars_write.push(car_with_mechanic)
      cars_write.delete(car)
      File.write("./cars.txt", cars_write.to_json)
      

    end
  end
end




end