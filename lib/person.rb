class Person 
  attr_accessor :name, :cash, :account
  def initialize(attrs = {})
    set_name(attrs[:name])
    @cash = 0
    @account = nil
  end  

  private

  def set_name(obj)
    if obj == nil then
        missing_name
    else
        @name = obj
    end
  end

  def missing_name
    raise 'A name is required'
  end
end