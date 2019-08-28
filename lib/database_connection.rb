class DatabaseConnection

  require 'pg'

  def self.setup(database)
    @connection = PG.connect(dbname: database)
  end

  def self.query(sql_string)
    connection.exec(sql_string)
  end

  def self.connection
    @connection
  end

end

TEST_DB = 'makersbnb_test'
PROD_DB = 'makersbnb'

DB = ENV['ENVIRONMENT'] == 'test' ? TEST_DB : PROD_DB

DatabaseConnection.setup(DB)