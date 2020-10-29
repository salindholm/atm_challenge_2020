require './lib/atm.rb'

class Person 
  attr_accessor :name, :cash, :account, :atm

  def initialize(attrs = {})
    set_name(attrs[:name])
    @cash = 0
    @account = nil
    @atm = Atm.new
    #Go over nil  
  end

  def set_name (obj)
    obj == nil ? raise_error : @name = obj
  end

  def raise_error 
    raise 'A name is required'
  end

  def create_account
    @account = Account.new({owner: self})
  end

  def deposit(amount)
    if account == nil 
        return missing_account
    else
      account.balance += amount
      @cash -= amount
      return amount   
    end
  end

  def withdraw(argument)
    if argument[:atm] == nil then
      raise 'An ATM is required'
    else
      amount = argument[:amount]
      pin_code = argument[:pin]
      account = @account 
    end
  end 

  def missing_account
    raise 'No account present'
  end

end
