def setup_tables

  DatabaseConnection.query("DROP TABLE spaces;")
  DatabaseConnection.query("DROP TABLE users;")

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

end
  