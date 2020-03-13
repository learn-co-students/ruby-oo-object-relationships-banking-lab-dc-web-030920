class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount
  attr_reader :num
  def initialize(sender, receiver, amount)
    @receiver = receiver
    @status = "pending"
    @sender = sender
    @amount = amount
    @num = 0
  end
  
  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
      if @sender.valid? 
        @num += 1
        if @num == 1
          @receiver.balance += amount
          @sender.balance -= amount
          @status = "complete"

        end
      end
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
  end
  
end
