require File.join(File.dirname(__FILE__), 'Gilded_Rose')
require 'test/unit'

class Gilded_rose_test < Test::Unit::TestCase

  def test_foo
    items = [Item.new('foo', 0, 0)]
    GildedRose.new(items).update_quality
    assert_equal items[0].name, 'foo'
  end

  def special_item(item)
    item = [Item.new("Sulfuras", 60, 80)]
    Gilded_rose.new(item).update_quality
    assert_equal item[0].quality, 80
  end
end
