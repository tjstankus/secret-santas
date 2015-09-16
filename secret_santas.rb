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
    @person = Person.new("Luke Skywalker <luke@theforce.net>")
  end

  def test_initializes_with_first_name
    assert_equal "Luke", @person.first_name
  end

  def test_initializes_with_last_name
    assert_equal "Skywalker", @person.last_name
  end

  def test_initializes_with_email
    assert_equal "luke@theforce.net", @person.email
  end

  def test_raises_error_for_invalid_line
    assert_raises { Person.new("Person") }
  end
end
