require './lib/atm.rb'

class Person 
  attr_accessor :name, :cash, :account

  def initialize(attrs = {})
    set_name(attrs[:name])
    @cash = 0
    @account = nil
    #Go over nil  
  end

  def set_name (name)
    if name == nil
        missing_name
    else 
      @name = name
    end
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
      return missing_atm
    else 
      amount = argument[:amount]
      pin_code = argument[:pin]
      account = @account
      @cash += amount
      @account.balance -=amount 
    end
  end 

  private

  def missing_name
    raise 'A name is required'
  end

  def missing_atm
    raise 'An ATM is required'
  end

  def missing_account
    raise 'No account present'
  end

end
