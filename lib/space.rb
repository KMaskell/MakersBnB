class Space

  attr_reader :id, :name, :description, :price, :user_id

  def initialize(id, name, description, price, user_id)
    @id = id
    @name = name
    @description = description
    @price = price
    @user_id = user_id
  end

end
