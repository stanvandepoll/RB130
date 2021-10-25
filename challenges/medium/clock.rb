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

  def initialize(set_hours, set_minutes)
    extra_hours, @minutes = set_minutes.divmod(MINUTES_PER_HOUR)
    @hours = (set_hours + extra_hours) % HOURS_PER_DAY
  end

  def self.at(set_hours, set_minutes= 0)
    new(set_hours, set_minutes)
  end

  def to_s
    "%02d:%02d" % [hours, minutes]
  end

  private
  attr_reader :hours, :minutes
end