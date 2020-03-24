require 'pry'
class Transfer
    attr_accessor :status, :amount, :receiver, :sender

    def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = 'pending'
    end

    def valid?
      # binding.pry
      self.sender.valid? && self.receiver.valid? && sender.balance > amount ? true : false
    end

    def execute_transaction
      # if amount == 4000
      # binding.pry
      # end
      if !self.valid? || self.status != 'pending' 
        self.status = "rejected"          
        return "Transaction rejected. Please check your account balance."
      else
        self.sender.balance -= self.amount
        self.receiver.balance += self.amount
        self.status = "complete"
      end
    end

    def reverse_transfer
      if self.status == "complete"
        self.sender.balance += self.amount
        self.receiver.balance -= self.amount
        self.status = "reversed"
      end
    end
end
