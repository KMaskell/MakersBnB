require 'list'

describe List do

  let(:item) {double(:item)}

  describe 'Add' do

    it 'be able to add an item to the list' do
      expect(subject).to respond_to :add
    end

    it 'shows added item' do
      subject.add(item)
      expect(subject.items).to include item
    end

  end

  describe 'Show' do

    it 'respond to show method' do
      expect(subject).to respond_to :show
    end

    it 'shows listing' do
      expect(subject.show).to eq(subject.items)
    end

  end

end
