require "pry"
class Transfer
  
  attr_accessor :sender, :receiver, :amount
  attr_reader :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    if sender.valid? && receiver.valid?
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
