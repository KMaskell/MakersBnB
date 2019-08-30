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

  def self.find(id)
    query = DatabaseConnection.query(
      "SELECT * FROM spaces WHERE (id = #{id})"
    ).to_a
  
    raise "Could not find this space" if query.empty?
    
    space = query.first

    id = space["id"].to_i
    name = space['name']
    description = space['description']
    price = space['price'].to_i
    user_id = space['user_id'].to_i

    return Space.new(id, name, description, price, user_id)

  end 

  def delete
    
    DatabaseConnection.query(
      "DELETE FROM spaces WHERE id = #{@id}"
    )
    
  end

  def update(
    name: @name,
    description: @description,
    price: @price)

    set_args = []

    set_args << "name = '#{name}'" if name != @name
    set_args << "description = '#{description}'" if description != @description 
    set_args << "price = #{price}" if price != @price

    return if set_args.empty?

    set_string = "SET #{set_args.join(', ')}"

    DatabaseConnection.query(
      "UPDATE spaces
      #{set_string}
      WHERE id = #{@id}"
    )
  end

end
