require 'user'

describe User do

  let(:user) { double("user", name: "Kenny", password: "KillMe", email: "kenny@southp.us") }

  before do
    drop_tables
    create_tables
  end
  
  describe '::add' do
    it 'adds a user' do
      described_class.add(user.name, user.password, user.email)
      expect(described_class.all).to be_a(Array)
    end
  end

  describe '::all' do
    it 'shows a list of users' do
      expect(described_class.all).to eq []    
    end
  end

end