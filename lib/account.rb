class Account
    STANDARD_VALIDITY_YRS = 5

    attr_accessor :pin_code, :balance, :account_status, :exp_date, :owner

    def initialize(attrs = {})
        @pin_code = rand(1000..9999)
        @balance = 0
        @account_status = :active
        @exp_date = set_expire_date
        set_owner(attrs[:owner])
        
    end

    def set_expire_date
        Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
    end

    def disable 
        @account_status = :disabled
    end

    private
    
    def set_owner(owner)
        if owner == nil then
            missing_owner 
        else
            @owner = owner
        end
    end

    def missing_owner
        raise "An Account owner is required"
    end
end 

