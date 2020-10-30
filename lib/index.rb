require 'date'
require './lib/person.rb'
require './lib/account.rb'
require './lib/atm.rb'

person = Person.new(name: 'John')
person.cash = 200
person.create_account
person.deposit(150)
puts person.cash # 👉 50
puts person.account.balance # 👉 150

atm = Atm.new
puts atm.funds # 👉 1000

puts person.withdraw(amount: 80, pin: 9999, atm: atm) # 'wrong pin' message

pin = person.account.pin_code

puts person.withdraw(amount: 80, pin: pin, atm: atm) # 'success' message

puts person.cash # 👉 130
puts person.account.balance # 👉 70
puts atm.funds # 👉 920

puts person.withdraw(amount: 200, pin: pin, atm: atm) # 'insufficient funds' message

atm.funds = 0
puts person.withdraw(amount: 10, pin: pin, atm: atm) # 'insufficent funds in ATM' message

atm.funds = 1000

person.account.exp_date = Date.today.next_month(-1).strftime('%m/%y')
puts person.withdraw(amount: 10, pin: pin, atm: atm) # 'card expired' message

person.account.exp_date = Date.today.next_month(1).strftime('%m/%y')
person.account.disable

puts person.withdraw(amount: 50, pin: pin, atm: atm) # 'account is disabled' message