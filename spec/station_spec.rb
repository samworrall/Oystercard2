require 'station'

describe Station do

  describe '#name' do
    subject {Station.new('Baker Street', 1)}
    it 'returns the station name' do
      expect(subject.name).to eq('Baker Street')
    end

    it 'returns the station zone' do
      station = Station.new('Baker Street', 1)
      expect(station.zone).to eq 1
    end
  end
end
