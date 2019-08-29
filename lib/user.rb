class User

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
  
end

