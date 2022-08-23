require File.join(File.dirname(__FILE__), '../app/Gilded_Rose')
require 'test/unit'

class Gilded_rose_test < Test::Unit::TestCase
  def setup
    items = [Item.new('foo', 0, 0), Item.new('Sulfuras', 60, 80), Item.new('Aged Brie', 10, 20),
             Item.new('Backstage passes', 8, 11), Item.new('Conjured', 8, 11), Item.new('Juan', 12, 12), Item.new('Conjured Aged Brie', 12, 12)]
    @gilded_rose = GildedRose.new(items)
  end

  def test_foo
    @gilded_rose.update_quality
    assert_equal @gilded_rose.items[0].name, 'foo'
  end

  def test_normal_item
    @gilded_rose.update_quality
    assert_equal @gilded_rose.items[5].sell_in, 11
    assert_equal @gilded_rose.items[5].quality, 11
  end

  def test_special_items
    @gilded_rose.update_quality
    assert_equal @gilded_rose.items[1].quality, 80
    assert_equal @gilded_rose.items[2].sell_in, 9
    assert_equal @gilded_rose.items[2].quality, 21
    assert_equal @gilded_rose.items[3].sell_in, 7
    assert_equal @gilded_rose.items[3].quality, 13
    assert_equal @gilded_rose.items[4].sell_in, 7
    assert_equal @gilded_rose.items[4].quality, 9
    assert_equal @gilded_rose.items[5].sell_in, 11
    assert_equal @gilded_rose.items[5].quality, 11
    assert_equal @gilded_rose.items[6].sell_in, 11
    assert_equal @gilded_rose.items[6].quality, 13
    assert_equal @gilded_rose.items[6].sell_in, 11
    assert_equal @gilded_rose.items[6].quality, 13
  end
end
