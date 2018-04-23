require 'oystercard'

describe Oystercard do
  it 'responds to the method #balance' do
    expect(subject).to respond_to(:balance)
  end

  describe '#top_up' do
    it 'responds to the method #top_up with 1 argument' do
      expect(subject).to respond_to(:top_up).with(1).argument
    end

    it 'adds money to the balance of the card' do
      subject.top_up(5)
      expect(subject.balance).to eq 5
    end

    it 'raises an error during top-up when the balance exceeds 90' do
      expect { subject.top_up(100)
      }.to raise_error "Maximum value exceeded"
    end

    it 'expects balance to equal limit constant' do
      subject.top_up(90)
      expect(subject.balance).to eq Oystercard::LIMIT
    end
  end
end
