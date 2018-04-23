require 'oystercard'

describe Oystercard do
  it 'responds to the method #balance' do
    expect(subject).to respond_to(:balance)
  end
end
