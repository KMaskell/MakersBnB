require 'list'

describe List do

  let(:item) {double(:item)}

  describe 'Add' do

    it 'be able to add an item to the list' do
      expect(subject).to respond_to :add
    end

    it 'shows added item' do
      subject.add(:item)
      expect(subject.items).to include :item
    end

  end

  describe 'Show' do

    it 'be able to view a list' do
      expect(subject).to respond_to :show
    end

  end



end
