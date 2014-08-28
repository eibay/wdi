class Pokemon
  def initialize(attribute)
    @name = attribute[:name]
    @element = attribute[:element]
    @level = attribute[:level]
  end

  def list()
    return "#{@name} is a #{@element} pokemon at level #{@level}"
  end

  def return_hash
    return {name: @name, element: @element, level: @level}
  end
  
end