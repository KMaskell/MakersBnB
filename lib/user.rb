class User

  def initialize(id, name, password, email)
    @id = id
    @name = name
    @password = password
    @email = email    
  end

  def self.add(username, password, email)
    DatabaseConnection.query(
      "INSERT INTO users(username, password, email)
      VALUES('#{username}', '#{password}', '#{email}')"
    )
  end

  def self.all
    users = []
    result = DatabaseConnection.query(
      "SELECT * FROM users"
    ).to_a
    result.each do |row|
      id = row["id"].to_i
      name = row['name']
      password = row['password']
      email = row['email']
      users << User.new(id, name, password, email)
    end
    return users
  end
  
end

