class Space

  attr_reader :name, :description, :price, :user_id

  def initialize(name, description, price, user_id)
    @name = name
    @description = description
    @price = price
    @user_id = user_id
  end

end
