class Account
    attr_accessor :pin_code, :balance, :account_status, :exp_date
    STANDARD_VALIDITY_YRS = 5

    def initialize pin_code, balance
        @pin_code = pin_code
        @balance = balance
        @account_status = :active
    end

    def set_expire_date
        @exp_date = Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
    end
end 

