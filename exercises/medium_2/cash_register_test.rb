require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(30)
  end

  def test_accept_money
    @transaction.amount_paid = 40

    @register.accept_money(@transaction)

    assert_equal(140, @register.total_money)
  end

  def test_change
    @transaction.amount_paid = 40

    assert_equal(10, @register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $30.\n") do
      @register.give_receipt(@transaction)
    end
  end
end