require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/person'

class PersonTest < Minitest::Test

  def test_can_create_person
    person = Person.new
    assert_instance_of Person, person
  end

  def test_person_has_name
    person = Person.new("Minerva")
    assert_equal "Minerva", person.name
  end

  def test_person_can_have_different_name
    person = Person.new("Luna")
    assert_equal "Luna", person.name
  end

  def test_person_has_galleon
    person = Person.new("Minerva", 1000)
    assert_equal 1000, person.galleon
  end
end
