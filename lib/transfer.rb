require "pry"
class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status, :last_transaction
  
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @last_transaction = 0
  end
  
  def valid?
    if sender.valid? && receiver.valid? && @last_transaction != @amount && sender.balance > @amount
      return true
    else
      return false
  end
end

  def execute_transaction
    #binding.pry
    if @sender.balance > @amount && @status == "pending" && @sender.valid? && @receiver.valid?
      @sender.balance -= @amount 
      @receiver.balance += @amount 
      @sender.balance
      @status = "complete"
    else 
      @status = "rejected"
        return "Transaction rejected. Please check your account balance."
  end
end

  def reverse_transfer 
    if @status = "complete" 
      @sender.balance += @amount 
      @receiver.balance -= @amount 
      @status = "reversed"
    else
      nil 
  end
end
end
