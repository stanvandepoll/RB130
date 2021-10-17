require 'minitest/autorun'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    cost = 30
    paid = 40
    transaction = Transaction.new(cost)
    input = StringIO.new("#{paid}\n")

    assert_output("You owe $#{cost}.\nHow much are you paying?\n") do
      transaction.prompt_for_payment(input: input)
    end

    assert_equal(paid, transaction.amount_paid)
  end
end