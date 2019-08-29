class User

  attr_reader :id, :username, :email

  def initialize(id, name, password, email)
    @id = id
    @username = name
    @password = password
    @email = email    
  end

  def self.all
    users = []
    result = DatabaseConnection.query(
      "SELECT * FROM users"
    ).to_a
    result.each do |row|
      id = row["id"].to_i
      username = row['username']
      password = row['password']
      email = row['email']
      users << User.new(id, username, password, email)
    end
    return users
  end

  def self.add(username, password, email)
    DatabaseConnection.query(
      "INSERT INTO users(username, password, email)
      VALUES('#{username}', '#{password}', '#{email}')"
    )
  end

  def self.find(id)
    result = DatabaseConnection.query(
      "SELECT * FROM users WHERE id = #{id};"
    )
    raise "No user with this id" if result.to_a.empty?
    row = result.first
    id = row['id'].to_i
    username = row['username']
    password = row['password']
    email = row['email']
    User.new(id, username, password, email)
  end

  def self.log_in(email, password)
    query = DatabaseConnection.query(
      "SELECT * FROM users WHERE email = '#{email}' AND password = '#{password}';"
    ).to_a
    query.empty? ? false : query.first['id'].to_i
  end

  def spaces
    spaces = []
    result = DatabaseConnection.query("SELECT * FROM spaces WHERE user_id = #{@id};").to_a
    result.each do |row|
      id = row['id']
      name = row['name']
      description = row['description']
      price = row['price']
      user_id = row['user_id']
      spaces << Space.new(id, name, description, price, user_id)
    end
    spaces
  end
  
end

