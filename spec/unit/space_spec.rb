describe Space do

  subject { Space.new(1, "House", "Beautiful place", 30, 1)}
  it 'responds to name, description, price, email, phone' do
    expect(subject).to respond_to(:id, :name, :description, :price, :user_id)
  end

  describe '::find' do

    it 'returns a Space object when passed a valid id' do

      expect(Space.find(1)).to be_a(Space)
      expect(Space.find(1).name).to eq "Guillaume House"
      expect(Space.find(1).description).to eq "Guillaume House description"
      expect(Space.find(1).price).to eq 30

    end

  end

end

