require File.join(File.dirname(__FILE__), 'Gilded_Rose')
require 'test/unit'

class Gilded_rose_test < Test::Unit::TestCase

  def test_foo
    items = [Item.new('foo', 0, 0)]
    GildedRose.new(items).update_quality
    assert_equal items[0].name, 'foo'
  end

  def test_legendary_item
    item = [Item.new("Sulfuras", 60, 80)]
    GildedRose.new(item).update_quality
    assert_equal item[0].quality, 80
  end

  def test_aged_brie
    item = [Item.new("Aged Brie", 10, 20)]
    GildedRose.new(item).update_quality
    assert_equal item[0].sell_in, 9
    assert_equal item[0].quality, 21
  end

  def test_backstage
    item = [Item.new("Backstage passes", 8, 11)]
    GildedRose.new(item).update_quality
    assert_equal item[0].sell_in, 7
    assert_equal item[0].quality, 13
  end

  def test_conjured
    item = [Item.new("Conjured", 8, 11)]
    GildedRose.new(item).update_quality
    assert_equal item[0].sell_in, 7
    assert_equal item[0].quality, 9
  end

  def test_normal_item
    item = [Item.new("Juan", 12, 12)]
    GildedRose.new(item).update_quality
    assert_equal item[0].sell_in, 11
    assert_equal item[0].quality, 11
  end

  def test_special_conjured
    item = [Item.new("Conjured Aged Brie", 12, 12)]
    GildedRose.new(item).update_quality
    assert_equal item[0].sell_in, 11
    assert_equal item[0].quality, 13
  end
end
