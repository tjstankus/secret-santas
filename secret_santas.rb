require "minitest/autorun"
# require "minitest/reporters"
# Minitest::Reporters.use!

class Person
  attr_reader :line

  def initialize(line)
    @line = line
  end

  def first_name
    line.split.first
  end
end

class TestPerson < Minitest::Test
  def setup
    @people = [
      "Luke Skywalker <luke@theforce.net>",
      "Leia Skywalker <leia@therebellion.org>",
      "Toula Portokalos <toula@manhunter.org>",
      "Gus Portokalos <gus@weareallfruit.net>",
      "Bruce Wayne <bruce@imbatman.com>",
      "Virgil Brigman <virgil@rigworkersunion.org>",
      "Lindsey Brigman <lindsey@iseealiens.net>"
    ]
  end

  def test_initializes_with_first_name
    person = Person.new(@people.first)
    assert_equal "Luke", person.first_name
  end
end
