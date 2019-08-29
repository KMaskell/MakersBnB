require 'space'

describe Space do

  subject { Space.new(1, "House", "Beautiful place", 30, 1)}
  it 'responds to name, description, price, email, phone' do
    expect(subject).to respond_to(:id, :name, :description, :price, :user_id)
  end

end
