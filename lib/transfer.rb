require "pry"
class Transfer
  # your code here
  attr_accessor :receiver, :sender, :amount, :status
  def initialize(sender, receiver, amount)
    @receiver = receiver
    @sender = sender
    @amount = amount
    @status = "pending"
  end

  def valid?
    # binding.pry
    return true if sender.valid? && receiver.valid?
    false
  end

  def execute_transaction
    # binding.pry
    if self.status == "pending" && valid? && sender.balance > amount
      sender.balance -= @amount
      receiver.balance += @amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += @amount
      receiver.balance -= @amount
      self.status = "reversed"
    end
  end

end
