class Clock
  MINUTES_PER_HOUR = 60
  MINUTES_PER_DAY = 1440

  def initialize(set_hours, set_minutes)
    total_minutes = (set_hours * MINUTES_PER_HOUR) + set_minutes
    reset_time(total_minutes)
  end

  def self.at(set_hours, set_minutes= 0)
    new(set_hours, set_minutes)
  end

  def to_s
    hours, remaining_minutes = minutes.divmod(MINUTES_PER_HOUR)
    "#{hours.to_s.rjust(2, '0')}:#{remaining_minutes.to_s.rjust(2, '0')}"
  end

  def +(add_minutes)
    total_minutes = minutes + add_minutes
    reset_time(total_minutes)
    self
  end

  def -(subtract_minutes)
    total_minutes = minutes - subtract_minutes
    reset_time(total_minutes)
    self
  end

  def ==(other)
    minutes == other.minutes
  end

  protected
  attr_reader :minutes

  private
  def reset_time(total_minutes)
    @minutes = total_minutes % MINUTES_PER_DAY
  end
end
