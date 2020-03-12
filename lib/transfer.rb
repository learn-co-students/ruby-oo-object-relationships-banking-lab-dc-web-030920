require 'pry'
class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  @@last_transfer = nil 
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid? 
    receiver.valid? && sender.valid? && sender.balance > amount
  end

  def execute_transaction 
    if self.status == "pending" && self.valid?
      receiver.balance += @amount
      sender.balance -= @amount
      @status = "complete"
    else 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    @@last_transfer = self
  end

  def reverse_transfer
    @@last_transfer.receiver.balance -= @@last_transfer.amount 
    @@last_transfer.sender.balance += @@last_transfer.amount
    self.status = "reversed"
  end

end
