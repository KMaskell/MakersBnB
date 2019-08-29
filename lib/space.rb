class Space

  attr_reader :id, :name, :description, :price, :user_id

  def initialize(id, name, description, price, user_id)
    @id = id
    @name = name
    @description = description
    @price = price
    @user_id = user_id
  end

  def self.all
    spaces = []
    result = DatabaseConnection.query(
      "SELECT * FROM spaces;"
    ).to_a
    result.each do |row|
      id = row["id"].to_i
      name = row['name']
      description = row['description']
      price = row['price'].to_i
      user_id = row['user_id'].to_i
      spaces << Space.new(id, name, description, price, user_id)
    end
    return spaces
  end

  def self.add(name, description, price, user_id)
    DatabaseConnection.query(
      "INSERT INTO spaces(name, description, price, user_id)
      VALUES('#{name}', '#{description}', '#{price}', '#{user_id}');"
    )
  end
  
end
