require './lib/account.rb'

describe Account do
    subject {Account.new('1234', 100)}
    it 'it expected to have an expiry date on initialize' do
        subject.set_expire_date
        expected_date = Date.today.next_year(5).strftime("%m/%y")
        expect(subject.exp_date).to eq expected_date
    end
end