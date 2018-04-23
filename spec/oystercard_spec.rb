require 'oystercard'

describe Oystercard do
  it 'responds to the method #balance' do
    expect(subject).to respond_to(:balance)
  end

  describe '#top_up' do
    it 'responds to the method #top_up with 1 argument' do
      expect(subject).to respond_to(:top_up).with(1).argument
    end
  end
end
