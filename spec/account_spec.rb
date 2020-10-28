require './lib/account.rb'

describe Account do
    # We create the double in our 'describe' block and give him one single attribute
    let(:person) {instance_double('Person', name: 'Thomas')}
    # and modify our 'subject'
    subject {described_class.new({owner: person}) }

    it 'ensure the pin_code is an Integer' do
        expect(subject.pin_code).to be_an(Integer)
        # we expect the account's pin code is an Integer or we compare the account's pin code to be an integer type using method `be_an`.
        # Why Integer? It's because Integer is a number without decimal
    end

    it 'check the pin_code has 4 digits' do
        pin_length = Math.log10(subject.pin_code).to_i + 1
        expect(pin_length).to eq 4
    end

    it 'randomize the pin_code' do
        account = Account.new
        # 👆 We initialize a new instance of Account in order to compare the pin_code against the existing instance of Account known as subject.
        # In order to create an instance of Account, we need one argument because initialize method of Account class has one parameter; that's why we have (100) here.
        expect(subject.pin_code).not_to eq(account.pin_code)
    end

    it 'it expected to have an expiry date on initialize' do
        expected_date = Date.today.next_year(5).strftime("%m/%y")
        expect(subject.exp_date).to eq expected_date
    end

    it 'is expected to have :active status on initialize' do
        expect(subject.account_status).to eq :active
    end

    it 'deactivates account using the instance method' do
        #You use Instance Methods when you need to act on a particular instance of the class.
        subject.deactivate
        expect(subject.account_status).to eq :deactivated
    end

    it 'is expected to have an owner' do
        expect(subject.owner).to eq person
    end

    it 'it expected to raise error if no owner is set' do
        expect { described_class.new }.to raise_error 'An Account owner is required'
    end
end