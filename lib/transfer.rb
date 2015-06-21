require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
    sender.valid? && receiver.valid? && @status == "pending" && @sender.balance >= @amount
    # these seem like they need @, but RegEx doesn't work then
  end

  def execute_transaction
    both_valid? ? transaction_approved : transaction_rejected
  end

  def reverse_transfer
    transaction_reversed if @status == "complete"
  end

  def transaction_rejected
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def transaction_approved
      @receiver.balance += @amount
      @sender.balance -= @amount
      @status = "complete"
  end

  def transaction_reversed
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
  end

end # end class
