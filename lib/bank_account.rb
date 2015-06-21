class BankAccount

  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(deposit_amount)
    @balance += deposit_amount
  end

  def display_balance
    "Your Balance is $#{balance}."
  end

  # BankAccount is valid with an open status and a balance greater than 0
  def valid?
    (@status == "open") && (@balance > 0)
  end

  def close_account
    self.status = "closed"
  end

end # end BankAccount class

=begin
two instances of the class can transfer money to another class through a Transfer class. 
The transfer class acts as a space for a transaction between 
two instances of the bank account class. 
Think of it this way: you can't just transfer money to another account 
without the bank running checks first. 
Transfer will do all of this, as well as check the validity of the accounts 
before the transaction occurs. 
Transaction should be able to reject a transfer if the accounts aren't valid 
or if the sender doesn't have the money.

Transfers start out in a "pending" state. 
They can be executed and go to a "complete" state. 
They can also go to a "rejected" state. 
A completed transfer can also be reversed and go into a "reversed" state.
=end