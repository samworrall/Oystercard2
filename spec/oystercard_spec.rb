require 'oystercard'

describe Oystercard do
  it 'should have 0 #balance on instantiation' do
    expect(subject.balance).to eq 0
  end

  it 'should return false' do
    expect(subject.en_route).to eq false
  end

  describe '#top_up', :top_up do
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

  describe '#deduct method', :deduct do
    it 'should reduce #balance by value' do
      subject.deduct(10)
      expect(subject.balance).to eq -10
    end

    it 'should raise an error if the value to be deducted is less than 0' do
      expect { subject.deduct(-10) }.to raise_error "Invalid amount"
    end
  end

  describe '#touch_in method', :touch_in do
    it 'should respond to #touch_in' do
      expect(subject).to respond_to(:touch_in)
    end

    it 'changes en_route to true' do
      subject.top_up(1)
      subject.touch_in
      expect(subject.en_route).to eq true
    end

    context 'when balance is less than minimum fare' do
      it 'raises error' do
        expect { subject.touch_in }.to raise_error "Insufficient funds"
      end
    end
  end

  describe '#touch_out method', :touch_out do
    it 'should respond to #touch_out' do
      expect(subject).to respond_to(:touch_out)
    end

    it 'changes en_route to false' do
      subject.top_up(1)
      subject.touch_in
      expect(subject.touch_out).to eq false
    end
  end

  describe '#in_journey?', :in_journey do
    it 'should respond to #in_journey?' do
      expect(subject).to respond_to(:in_journey?)
    end

    it 'returns a boolean value' do
      expect(subject).not_to be_in_journey
    end

    it 'should be true after touch_in' do
      subject.top_up(1)
      subject.touch_in
      expect(subject).to be_in_journey
    end
  end

end
