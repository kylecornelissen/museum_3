require 'minitest/autorun'
require 'minitest/pride'
require './lib/patron'
require './lib/exhibit'
require './lib/museum'

class MuseumTest < Minitest::Test
  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")

    @gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    @dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    @imax = Exhibit.new("IMAX", 15)

    @bob = Patron.new("Bob", 20)
    @bob.add_interest("Dead Sea Scrolls")
    @bob.add_interest("Gems and Minerals")

    @ally = Patron.new("Sally", 20)
    @ally.add_interest("IMAX")
  end

  def test_museum_class_exists
    assert_instance_of Museum, @dmns
  end

  def test_name_attribute_exists
    assert_equal "Denver Museum of Nature and Science", @dmns.name
  end

  def test_exhibits_array_initializes_empty
    assert_equal [], @dmns.exhibits
  end

  def test_add_exhibit_method_adds_exhibit_objects_to_exhibits_array
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)

    assert_equal [@gems_and_minerals, @dead_sea_scrolls, @imax], @dmns.exhibits
  end

  # def test_method_recommends_exhibits_to_patron
  #
  #   @dmns.add_exhibit(@gems_and_minerals)
  #   @dmns.add_exhibit(@dead_sea_scrolls)
  #   @dmns.add_exhibit(@imax)
  #
  #   assert_equal [@gems_and_minerals, @dead_sea_scrolls], @dmns.recommend_exhibits(@bob)
  #
  #   # assert_equal [@imax], @dmns.recommend_exhibits(@sally)
  # end

  def test_patrons_array_initializes_empty
    assert_equal [], @dmns.patrons
  end

  def test_admit_method_adds_patrons

    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)

    @dmns.admit(@bob)
    @dmns.admit(@sally)

    assert_equal [@bob, @sally], @dmns.patrons
  end

  # def test_patrons_by_exhibit_interest_hash_adds_patron_values_to_exhibit_keys
  #
  #   @dmns.add_exhibit(@gems_and_minerals)
  #   @dmns.add_exhibit(@dead_sea_scrolls)
  #   @dmns.add_exhibit(@imax)
  #   @sally.add_interest("Dead Sea Scrolls")
  #
  #   expected = {
  #     @gems_and_minerals => @bob,
  #     @dead_sea_scrolls => @bob,
  #     @imax => @sally
  #   }
  #   assert_equal expected, @dmns.patrons_by_exhibit_interest
  # end

end
