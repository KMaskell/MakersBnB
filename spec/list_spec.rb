require 'list'

describe List do

  describe 'Add' do

    it 'be able to add an item to the list' do
      expect(subject).to respond_to :add
    end

  end

  describe 'Show' do

    it 'be able to view a list' do
      expect(subject).to respond_to :show
    end

  end

end
