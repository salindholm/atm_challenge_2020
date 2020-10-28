class Account
    STANDARD_VALIDITY_YRS = 5
    # The magic number is a number that means something to the writer but the reader does not understand, for example, why the number is what it is?. Therefore, the number should have a name and  it would be a constant, meaning it can't be changed, so we need to write it in capitalized. Since it is a contstant, it should only belong to the class.

    attr_accessor :pin_code, :balance, :account_status, :exp_date, :owner

    def initialize(attrs = {})
        @pin_code = rand(1000..9999)
        @balance = 100
        @account_status = :active
        @exp_date = set_expire_date
        set_owner(attrs[:owner])
        
    end

    def set_expire_date
        Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
    end

    def deactivate
        @account_status = :deactivated
    end

    private
    def set_owner(obj)
        if obj == nil then
            missing_owner 
        else
            @owner = obj
        end
    #A ternary operator is made of three parts, that’s where the word “ternary” comes from. These parts include a conditional statement & two possible outcomes.
    end

    def missing_owner
        raise "An Account owner is required"
    end
end 

