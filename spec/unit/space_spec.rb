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

    it "raises an error if the id doesn't match any space" do

      expect{ Space.find(3) }.to raise_error("Could not find this space")

    end

  end

  describe '#delete' do
    
    it 'deletes a space' do
      space = Space.find(1)
      space.delete
      expect{ Space.find(1) }.to raise_error("Could not find this space")
    end
    
  end

  describe '#update' do
    
    it "updates a space's name" do
      space = Space.find(1)
      space.update(name: "Guillaume new House")
      expect(Space.find(1).name).to eq "Guillaume new House"
      expect(Space.find(1).description).to eq "Guillaume House description"
      expect(Space.find(1).price).to eq 30
    end

  end

end

