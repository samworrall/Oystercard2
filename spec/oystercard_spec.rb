require 'oystercard'

describe Oystercard do
  it 'should have 0 #balance on instantiation' do
    expect(subject.balance).to eq 0
  end

  it 'should return false' do
    expect(subject.en_route).to eq false
  end

  describe '#top_up' do
    it 'adds money to the balance of the card' do
      subject.top_up(5)
      expect(subject.balance).to eq 5
    end

    it 'raises an error during top-up when the balance exceeds 90' do
      expect { subject.top_up(100)
      }.to raise_error "Maximum limit of £#{Oystercard::LIMIT} exceeded"
    end

    it 'expects balance to equal limit constant' do
      subject.top_up(90)
      expect(subject.balance).to eq Oystercard::LIMIT
    end
  end

  describe '#deduct method' do
    it 'should reduce #balance by value' do
      subject.deduct(10)
      expect(subject.balance).to eq -10
    end

    it 'should raise an error if the value to be deducted is less than 0' do
      expect { subject.deduct(-10) }.to raise_error "Invalid amount"
    end
  end

  context 'card usage during the journey' do
    describe '#touch_in method' do
      it 'should respond to #touch_in' do
        expect(subject).to respond_to(:touch_in)
      end
    end

    describe '#touch_out method' do
      it 'should respond to #touch_out' do
        expect(subject).to respond_to(:touch_out)
      end
    end

    describe '#in_journey?' do
      it 'should respond to #in_journey?' do
        expect(subject).to respond_to(:in_journey?)
      end
    end
  end


end
