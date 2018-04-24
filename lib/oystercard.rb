class Oystercard
  attr_reader :balance, :en_route
  LIMIT = 90

  def initialize
    @balance = 0
    @en_route = false
  end

  def top_up(value)
    raise "Maximum limit of £#{LIMIT} exceeded" if @balance + value > LIMIT
    @balance += value
  end

  def deduct(value)
    raise "Invalid amount" if value < 0
    @balance -= value
  end

  def touch_in
    fail "Insufficient funds" if @balance < 1
    @en_route = true
  end

  def touch_out
    @en_route = false
  end

  def in_journey?
    @en_route
  end

end
