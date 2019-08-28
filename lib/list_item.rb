class ListItem
attr_reader :name, :description, :price, :email_address, :phone_number
def initialize(name, description, price, email_address, phone_number)
  @name = name
  @description = description
  @price = price
  @email_address = email_address
  @phone_number = phone_number
end

end
