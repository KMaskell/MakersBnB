require 'list_item'

describe ListItem do

  it 'responds to name, description, price, email, phone' do
    expect(subject).to respond_to(:name, :description, :price, :email_address, :phone_number)
  end



end
