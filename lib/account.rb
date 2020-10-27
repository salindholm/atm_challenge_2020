class Account
    STANDARD_VALIDITY_YRS = 5
    # The magic number is a number that means something to the writer but the reader does not understand, for example, why the number is what it is?. Therefore, the number should have a name and  it would be a constant, meaning it can't be changed, so we need to write it in capitalized. Since it is a contstant, it should only belong to the class.

    attr_accessor :pin_code, :balance, :account_status, :exp_date

    def initialize
        @pin_code = rand(1000..9999)
        @balance = 100
        @account_status = :active
        @exp_date = set_expire_date
    end

    def set_expire_date
        Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
    end
end 

