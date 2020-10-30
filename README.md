# atm_challenge_2020

## The Code

We write an ATM project to allow a person to create an account, be able to deposite and withdraw money by using ATM machine.

```
As a User       
In order to make a withdrawal      
The ATM needs to have funds
```
```
As a Customer
In order to manage my funds
I need to have a personal account
```
```
As an ATM operator      
In order to keep track of our costumers     
We want to assign each account to a separate person
```
## Dependencies

RSpec for testing

## Setup

You need to have Ruby installed on your machine.

```Terminal
git clone repo
touch Gemfile
gem install bundler
rspec --init
```

## Instructions

- Step 1: Open your Terminal and then type `irb` command for Interactive Ruby Shell
- Step 2: Type the code as followed,

```ruby
require 'date'
load './lib/person.rb'
load './lib/account.rb'
load './lib/atm.rb'
person = Person.new(name: 'John')
person.cash = 200
person.create_account
person.deposit(150)
puts person.cash # 👉 50
puts person.account.balance # 👉 150

atm = Atm.new
puts atm.funds # 👉 1000

person.withdraw(amount: 80, pin_code: 9999, atm: atm) # 👉  'wrong pin' message

pin_code = person.account.pin_code

person.withdraw(amount: 80, pin_code: (your given pincode), atm: atm) # 👉  'success' message

puts person.cash # 👉 130
puts person.account.balance # 👉 70
puts atm.funds # 👉 920

puts person.withdraw(amount: 200, pin_code: (your given pincode), atm: atm) # 👉  'insufficient funds' message

atm.funds = 0
puts person.withdraw(amount: 10, pin_code: (your given pincode), atm: atm) # 👉 'insufficent funds in ATM' message

atm.funds = 1000

person.account.exp_date = Date.today.next_month(-1).strftime('%m/%y')
puts person.withdraw(amount: 10, pin_code: (your given pincode), atm: atm) # 👉 'card expired' message

person.account.exp_date = Date.today.next_month(1).strftime('%m/%y')

person.account.disable

puts person.withdraw(amount: 50, pin_code: (your given pincode), atm: atm) # 👉 'account is disabled' message
```
## Acknowledgements

Craft academy learning materials 

Our teammates 

Our coaches

## Improvements plans

We know our written codes are not really great. There are definitely flaws so we plan to refactor some methods in the three classes to be more effiecient, clean and precise.

## License under MIT license

