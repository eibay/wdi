require 'json'

class Campus
  def self.create(campus_object)

    if campus_object == "dorm_hash"
      textfile == "./dorms.txt"
    elsif campus_object == "person"
      textfile == "./students.txt"
    end
binding.pry
    objects = self.all(textfile)
    objects.push(campus_object)
    objects_json = JSON.generate(objects)

  end

    File.write(textfile, objects_json)
  end

  def self.find_by(key, value)
    if campus_object == "dorm_hash"
      textfile == "./dorms.txt"
    elsif campus_object == "person"
      textfile == "./students.txt"
    end
    self.all(textfile).find do |campus_object|
      campus_object[key] == value
    end
  end

  def self.all(textfile)
    return JSON.parse(File.read(textfile))
  end
end
