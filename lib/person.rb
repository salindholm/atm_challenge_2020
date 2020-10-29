class Person 
  attr_accessor :name, :cash, :account

  def initialize(attrs = {})
    set_name(attrs[:name])
    @cash = 0
    @account
    #Go over nil  
  end

  def set_name (obj)
    obj == nil ? raise_error : @name = obj
  end

  def raise_error 
    raise 'A name is required'
  end

  def create_account
    @account = Account.new({owner: name})
  end

  def deposit(amount)
    if (@account != nil )
        true
    else
        missing_account
    end
  end

  def missing_account
    raise 'No account present'
  end

end
