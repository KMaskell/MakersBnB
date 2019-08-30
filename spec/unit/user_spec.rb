describe User do

  let(:user) { double("user", name: "Kenny", password: "KillMe", email: "kenny@southp.us") }
  
  describe '::add' do
    it 'adds a user' do
      described_class.add(user.name, user.password, user.email)
      expect(described_class.all).to be_a(Array)
      expect(described_class.all.last.username).to eq "Kenny"

    end
  end

  describe '::all' do
    it 'shows a list of users' do
      expect(described_class.all.first.username).to eq "Guillaume"  
      expect(described_class.all.first.email).to eq "gl@gl.com"    
    end
  end


end