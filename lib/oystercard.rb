class Oystercard
  attr_reader :balance, :en_route, :entry_station
  LIMIT = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @en_route = false
  end

  def top_up(value)
    raise "Maximum limit of £#{LIMIT} exceeded" if @balance + value > LIMIT
    @balance += value
  end

  def touch_in(station)
    fail "Insufficient funds" if @balance < MINIMUM_FARE
    @entry_station = station
    @en_route = true
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @en_route = false
  end

  def in_journey?
    @en_route
  end

  private

  def deduct(value)
    raise "Invalid amount" if value < 0
    @balance -= value
  end

end
