require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/bank'
require './lib/person'

class BankTest < Minitest::Test

  def test_bank_exists
    bank = Bank.new
    assert_instance_of Bank, bank
  end

  def test_bank_has_a_name
    skip
    bank = Bank.new("Chase")
    assert_equal "Chase", bank.name
  end

  def test_bank_has_a_different_name
    skip
    chase = Bank.new("Chase")
    wells_fargo = Bank.new("Wells Fargo")
    assert_equal "Chase", chase.name
    assert_equal "Wells Fargo", wells_fargo.name
  end

  def test_can_open_account
    skip
    chase = Bank.new("Chase")
    person = Person.new("Minerva", 1000)
    chase.open_account(person, 1000)
    assert_equal 1, chase.accounts.count
  end

  def test_bank_has_new_account_with_name_and_balance
    skip
    chase = Bank.new("Chase")
    person = Person.new("Minerva", 1000)
    message = "An account has been opened for Minerva with Chase."
    assert_equal message, chase.open_account(person, 1000)
    assert_equal 1000, chase.accounts["Minerva"][:balance]
  end

  def test_cant_open_account
    skip
    chase = Bank.new("Chase")
    person = Person.new("Minerva", 1000)
    message = "Not enough galleon to open account."
    assert_equal message, chase.open_account(person, 1500)
  end

  def test_how_much_money_in_bank_over_all_accounts
    skip
    chase = Bank.new("Chase")
    person1 = Person.new("Minerva", 1000)
    person2 = Person.new("Bob", 1000)
    person3 = Person.new("Karen", 1000)
    chase.open_account(person1, 1000)
    chase.open_account(person2, 1000)
    chase.open_account(person3, 1000)
    assert_equal 3000, chase.total_cash
  end

  def test_putting_money_in_bank_takes_away_from_galleon
    skip
    chase = Bank.new("Chase")
    person = Person.new("Minerva", 1000)
    message = "Not enough galleon to open account."
    chase.open_account(person, 1000)
    assert_equal 0, person.galleon
  end

  def test_can_deposit_galleon_to_account
    skip
    chase = Bank.new("Chase")
    person = Person.new("Minerva", 1000)
    chase.open_account(person, 1000)
    person_second_visit = Person.new("Minerva", 700)
    message = "500 galleons have been deposited into Minerva's Chase account. Balance: 1500 Cash: 200"
    assert_equal message, chase.deposit(person_second_visit, 500)
    assert_equal 1500, chase.accounts["Minerva"][:balance]
  end

  def test_cant_deposit_galleon_to_account_if_person_doesnt_have_enough
    skip
    chase = Bank.new("Chase")
    person = Person.new("Minerva", 1000)
    chase.open_account(person, 1000)
    person_second_visit = Person.new("Minerva", 300)
    error = "You dont have enough galleon to make that deposit."
    assert_equal error, chase.deposit(person_second_visit, 500)
  end

  def test_customer_can_withdraw_money_from_account
    skip
    chase = Bank.new("Chase")
    person = Person.new("Minerva", 1000)
    chase.open_account(person, 1000)
    person_second_visit = Person.new("Minerva", 300)
    message = "Minerva has withdrawn 250 galleons. Balance: 750 Cash: 550"
    assert_equal message, chase.withdrawl(person_second_visit, 250)
  end

  def test_cant_withdrawl
    skip
    chase = Bank.new("Chase")
    person = Person.new("Minerva", 1000)
    chase.open_account(person, 1000)
    person_second_visit = Person.new("Minerva", 300)
    error = "Insufficient funds."
    assert_equal error, chase.withdrawl(person_second_visit, 5000000)
  end

  def test_can_transfer_galleon_to_other_account
    skip
    chase = Bank.new("Chase")
    wells_fargo = Bank.new("Wells Fargo")
    person = Person.new("Minerva", 2500)
    chase.open_account(person, 1000)
    wells_fargo.open_account(person, 1000)
    message = "Minerva has transferred 250 galleons from Chase to Wells Fargo."
    assert_equal message, chase.transfer(person, wells_fargo, 250)
  end
end
