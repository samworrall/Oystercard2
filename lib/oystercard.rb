class Oystercard
  attr_reader :balance, :entry_station, :journeys
  LIMIT = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @journeys = {}
  end

  def top_up(value)
    raise "Maximum limit of £#{LIMIT} exceeded" if @balance + value > LIMIT
    @balance += value
  end

  def touch_in(station)
    fail "Insufficient funds" if @balance < MINIMUM_FARE
    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    journeys[@entry_station] = station
    @entry_station = nil
  end

  def in_journey?
    @entry_station != nil
  end

  private

  def deduct(value)
    raise "Invalid amount" if value < 0
    @balance -= value
  end

end
