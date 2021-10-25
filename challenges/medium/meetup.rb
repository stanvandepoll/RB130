=begin
In this program, we'll construct objects that represent a meetup date.
Each object takes a month number (1-12) and a year (e.g., 2021).

Your object should be able to determine the exact date of the meeting
in the specified month and year.
For instance, if you ask for the 2nd
Wednesday of May 2021, the object should be able to determine that
the meetup for that month will occur on the 12th of May, 2021.

descriptors and weekdays are case-insensitive
each combination only has one possible result

problem
first object is created with year and month
than for day method:
input: weekday and descriptor strings
output: Date object in 'civil' format with correct day number in month
        if no matching day in month return nil

test cases:
  return of nil in case of no match
  use Date.civil to generate output

data structure:
  array of all days in month

algo:
  generate array of all days of the month
  select find for weekday && descriptor match
  return day if present
=end

class Meetup
  SCHEDULE_START_DAY = {
    'first' => 1, 'second' => 8, 'third' => 15, 'fourth' => 22,
    'fifth' => 29, 'teenth' => 13
  }.freeze

  def initialize(year, month)
    @days = generate_days(year, month)
  end

  def day(weekday, descriptor)
    @days.find do |day|
      day.send("#{weekday.downcase}?") &&
        descriptive_match?(day, descriptor.downcase)
    end
  end

  private

  def generate_days(year, month)
    generated_days = []
    day_number = 1
    last_day_of_month = Date.civil(year, month, -1).mday

    loop do
      generated_days << Date.civil(year, month, day_number)
      break if day_number == last_day_of_month

      day_number += 1
    end
    generated_days
  end

  def descriptive_match?(day, descriptor)
    start_day = first_day_to_search(descriptor)
    (start_day..(start_day + 6)).cover?(day.mday)
  end

  def first_day_to_search(descriptor)
    SCHEDULE_START_DAY.fetch(descriptor, special_starting_days(descriptor))
  end

  def special_starting_days(descriptor)
    @days.size - 6 if descriptor == 'last'
  end
end