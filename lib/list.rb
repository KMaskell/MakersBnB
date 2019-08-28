class List

  attr_reader :items 

  def initialize
    @items = []
  end

  def add(item)
    @items.push(item)
  end

  def show
    @items
  end

end
