require "minitest/autorun"

class Person
  attr_reader :first_name, :last_name, :email
  attr_accessor :santa

  def initialize(line)
    match = /(\S+)\s+(\S+)\s+<(.*)>/.match(line)
    @first_name = match[1]
    @last_name = match[2]
    @email = match[3]
  end

  def can_be_santa_of?(other)
    last_name != other.last_name
  end
end

class SantasAssigner
  attr_reader :people

  def initialize(people)
    @people = people
  end

  def assign_santas!
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

  def test_cannot_be_santa_of
    bad_santa = Person.new("Leia Skywalker <leia@theforce.net>")
    assert !@person.can_be_santa_of?(bad_santa)
  end

  def test_can_be_santa_of
    santa = Person.new("Darth Vader <darthvader@theforce.net>")
    assert @person.can_be_santa_of?(santa)
  end
end

class SantasAssignerTest < Minitest::Test
  def setup
    @people = [
      Person.new("Darth Vader <darthvader@theforce.net>"),
      Person.new("Luke Skywalker <luke@theforce.net>")
    ]
  end

  def test_assigns_santas
    assigner = SantasAssigner.new(@people)
    assigner.assign_santas!
    darth = @people.first
    luke = @people.last
    assert_equal luke, darth.santa
  end
end
