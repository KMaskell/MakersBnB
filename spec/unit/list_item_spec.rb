require 'list_item'

describe ListItem do

  it 'responds to name, description, price' do
    expect(subject).to respond_to(:name, :description, :price)
  end



end
