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
    sender.valid? && receiver.valid?
    # these seem like they need @, but RegEx doesn't work then
  end

  def execute_transaction
    if both_valid? && self.status == "pending" # if both transactions can go through
      if @sender.balance >= @amount # if sender is liquid
        @receiver.balance = @receiver.balance + self.amount
        @sender.balance = @sender.balance - self.amount
        self.status = "complete"
      else 
        rejected_status
      end
    else
      rejected_status
    end
  end

  def rejected_status
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    unless @status != "complete" #it can only reverse executed transfers
      @receiver.balance = @receiver.balance - @amount
      @sender.balance = @sender.balance + @amount
      #binding.pry
      @status = "reversed"
    end
  end

end # end class
