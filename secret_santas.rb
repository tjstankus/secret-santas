require "minitest/autorun"

class Person
  attr_reader :first_name, :last_name, :email

  def initialize(line)
    match = /(\S+)\s+(\S+)\s+<(.*)>/.match(line)
    @first_name = match[1]
    @last_name = match[2]
    @email = match[3]


  end



end

class TestPerson < Minitest::Test
  def setup
    @person = "Luke Skywalker <luke@theforce.net>"
  end

  def test_initializes_with_first_name
    person = Person.new(@person)
    assert_equal "Luke", person.first_name
  end

  def test_initializes_with_last_name
    person = Person.new(@person)
    assert_equal "Skywalker", person.last_name
  end

  def test_initializes_with_email
    person = Person.new(@person)
    assert_equal "luke@theforce.net", person.email
  end
end
