=begin
Write a program that manages robot factory settings.

When robots come off the factory floor, they have no name.
The first time you boot them up, a random name is generated,
such as RX837 or BC811.

Every once in a while, we need to reset a robot to its factory
settings, which means that their name gets wiped. The next time
you ask, it will respond with a new random name.

The names must be random; they should not follow a predictable
sequence. Random names means there is a risk of collisions.
Your solution should not allow the use of the same name twice when avoidable.

input:  - name instance method call, no arguments
        - reset call
        - name getter
output: name string, 2 uppercase letters followed by 3 digits
        random generated but avoid taken names

test cases:
  derived input and output from test cases
  
data structure:
  string for name
  ranges for values to pick for random name generation
  array of taken names (no need to implement cleanup for deleted robots)

algo:
  generate name upon initialization
  generate name upon reset
    name generation:
      pick letter twice from given range 'A'-'Z'
      pick digits thrice from range 0-9
      check against used names, repeat if name already used
      add generated name to used names (class variable)
      return generated name
    end
=end

class Robot
  LETTERS = ('A'..'Z').to_a
  DIGITS = ('0'..'9').to_a
  @@used_names = []

  def initialize
    reset
  end

  def reset
    @@used_names.delete(@name)
    @name = generate_name
  end

  def name
    @name
  end

  private

  def generate_name
    generated_name = nil
    loop do
      generated_name = ''
      2.times { generated_name << LETTERS.sample }
      3.times { generated_name << DIGITS.sample }
      break unless name_used?(generated_name)
    end
    @@used_names << generated_name  
    generated_name
  end

  def name_used?(name_to_check)
    @@used_names.include?(name_to_check)
  end
end