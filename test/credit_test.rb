require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/person'
require './lib/credit'

class CreditTest < Minitest::Test

  def test_credit_exists
    amex = Credit.new("AMEX")
    assert_instance_of Credit, amex
  end

  def test_credit_has_name
    skip
    amex = Credit.new("AMEX")
    assert_equal "AMEX", amex.card_name
  end

  def test_can_open_account
    skip
    amex = Credit.new("AMEX")
    person = Person.new("Minerva",100, 680)
    message = "Minerva has opened a new AMEX credit card. Credit Limit: 5000"
    assert_equal message, amex.open_account(person)
  end

  def test_decline_and_max_credit
    skip
    amex = Credit.new("AMEX")
    person = Person.new("Bill",100, 800)
    message = "Bill has opened a new AMEX credit card. Credit Limit: 10000"
    assert_equal message, amex.open_account(person)
  end

  def test_cant_open_account
    skip
    amex = Credit.new("AMEX")
    person = Person.new("Minerva",100, 400)
    message = "Insuficient funds to open new card."
    assert_equal message, amex.open_account(person)
  end

  def test_can_spend_credit
    skip
    amex = Credit.new("AMEX")
    person = Person.new("Minerva",100, 655)
    amex.open_account(person)
    amex.cc_spend(person, 100)
    assert_equal 4900, person.credit_cards[amex.card_name][:available_credit]
    amex.cc_spend(person, 1000)
    assert_equal 3900, person.credit_cards[amex.card_name][:available_credit]
  end

  def test_card_declined
    skip
    amex = Credit.new("AMEX")
    person = Person.new("Minerva",100, 600)
    amex.open_account(person)
    assert_equal "Declined", amex.cc_spend(person, 1001)
  end

  def test_person_can_pay_down_their_credit_card
    skip
    amex = Credit.new("AMEX")
    person = Person.new("Minerva",300, 600)
    amex.open_account(person)
    amex.cc_spend(person, 500)
    message = "Minerva made a payment of 250 galleons to AMEX card. Available Credit: 750  Cash: 50"
    assert_equal message, amex.cc_pay(person, 250)
    assert_equal 750, person.credit_cards[amex.card_name][:available_credit]
  end
  def test_insuficient_funds_to_pay_card
    skip
    amex = Credit.new("AMEX")
    person = Person.new("Minerva",300, 600)
    amex.open_account(person)
    amex.cc_spend(person, 500)
    message = "Insuficient funds to pay card."
    assert_equal message, amex.cc_pay(person, 20000)
  end
end
