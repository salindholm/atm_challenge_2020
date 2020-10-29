# The Atm Challange
### ATM
```
As a User       
In order to make a withdrawal      
The ATM needs to have funds
```
### Account
``` 
As a Customer
In order to manage my funds
I need to have a personal account
```
### Person
```
As an ATM operator      
In order to keep track of our costumers     
We want to assign each account to a separate person
```
## The code:
The Atm Challenge is an application that can create an Atm for a Person that has an Account. This is possible due to the three Ruby classes: Atm, Person and Account, which all holds the methods to simulate all the actions around an Atm.

## Dependencies:
source 'https://rubygems.org'

- gem 'rspec'

## Setup:
Clone repo and run bundler to install gems.

## Instructions:
Load all 3 classes available in ./lib/ to your interactive ruby console. Initiate a person by using Person.new(name: <name>). Give the person an account by person.create_account. Create an ATM by using Atm.new. The person can now interact with the ATM using the withdraw method.

## Updates/Improvements plans:
Go through and refactor the code to be more clean and precise.

## Licensed under MIT license