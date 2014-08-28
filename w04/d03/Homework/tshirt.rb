class Shirt
  def initialize(size, color, text)
    @size = size
    @color = color
    @text = text
  end

  def show_shirt()
    return ({size: @size, color: @color, text: @text})
  end
  
end
