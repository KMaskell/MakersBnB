require_relative '../lib/database_connection'

databases = ['makersbnb', 'makersbnb_test']

databases.each do |db|

  DatabaseConnection.setup(db)

  DatabaseConnection.query("create table users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(60),
    password VARCHAR(60),
    email VARCHAR(60));")
    
  DatabaseConnection.query("create table spaces(
    id SERIAL PRIMARY KEY,
    name VARCHAR(60),
    description VARCHAR(300),
    price integer,
    user_id integer REFERENCES users(id));")

    puts "Tables 'users' and 'spaces' created in #{db}"

end
