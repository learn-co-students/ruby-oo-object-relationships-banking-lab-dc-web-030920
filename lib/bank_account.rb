class BankAccount
    attr_reader :name
    attr_accessor :balance, :status

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    def deposit(sum)
        self.balance += sum
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
       return true if self.status == "open" && self.balance > 0
       false
    end

    def close_account
        self.status = "closed"
    end
end
