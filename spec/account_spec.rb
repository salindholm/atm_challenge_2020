require './lib/account.rb'

describe Account do
   
    let(:person) {instance_double('Person', name: 'Thomas')}
   
    subject { described_class.new({owner: person}) }

    it 'ensure the pin_code is an Integer' do
        expect(subject.pin_code).to be_an(Integer)
        
    end

    it 'check the pin_code has 4 digits' do
        pin_length = Math.log10(subject.pin_code).to_i + 1
        expect(pin_length).to eq 4
    end

    it 'randomize the pin_code' do
        account = Account.new({owner: person})
        account = described_class.new({owner: person})
        
        expect(subject.pin_code).not_to eq(account.pin_code)
    end

    it 'it expected to have an expiry date on initialize' do
        expected_date = Date.today.next_year(5).strftime("%m/%y")
        expect(subject.exp_date).to eq expected_date
    end

    it 'is expected to have :active status on initialize' do
        expect(subject.account_status).to eq :active
    end

    it 'is set account to disabled using the instance method' do

        subject.disable
        expect(subject.account_status).to eq :disabled
    end

    it 'is expected to have an owner' do
        expect(subject.owner).to eq person
    end

    it 'it expected to raise error if no owner is set' do
        expect { described_class.new }.to raise_error 'An Account owner is required'
    end
end