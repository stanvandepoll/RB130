=begin
Create a clock that is independent of date.

You should be able to add minutes to and subtract minutes from
the time represented by a given clock object. Two clock objects
that represent the same time should be equal to each other.

You may not use any built-in date or time functionality;
just use arithmetic operations.

input: at(hours, minutes) minutes is optional
output: to_s outputs string representation like 'hh:mm'
        == should return true if time is the same
        time should 'wrap around' to 24 hours max and zero hours minimum

test cases:
  + and - methods should change time with arguments amount of minutes

data structure:
  integer for hours
  integer for minutes
  string return for to_s

algo:
  initialize
    determine remainder of minutes divided by 60 => @minutes
    result of minutes / 60 is extra hours
    remainder of (hours + extra_hours) / 24 => @hours
  + and -
    similar way with using divmod 
  to_s
    straightforward

=end
require 'pry-byebug'
class Clock
  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24
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

# clock = Clock.at(10)
# binding.pry
# p clock.to_s