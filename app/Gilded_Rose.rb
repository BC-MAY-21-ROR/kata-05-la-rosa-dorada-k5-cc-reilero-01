#GildedRose class
class GildedRose
  attr_reader :items, :special_items

  def initialize(items)
    @items = items
    @special_items = ['Aged Brie', 'Sulfuras', 'Backstage passes', 'Conjured']
  end

  def legendary_items(item)
    item.sell_in = nil
    item.quality = 80
  end

  def special_aged_brie(item)
    item.sell_in -= 1
    if item.quality < 50
      item.quality += 1
    end
  end

  def special_backstage(item)
    item.sell_in -= 1
    if item.sell_in <= 0
      item.quality = 0
    elsif item.sell_in <= 5
      item.quality += 3
    elsif item.sell_in <= 10
      item.quality += 2
    else
      item.quality += 1
    end
  end

  def conjured_items(item)
    item.sell_in -= 1
    item.quality -= 2
  end

  def normal_items(item)
    item.sell_in -= 1
    item.quality -= 1
  end

  def special?(item)
    @special_items.each_with_index do |items, index|
      special_items = item.name.include?(items)
      return index if special_items == true
    end
  end

  def update_quality
    @items.each do |item|
      if special?(item) == 0
        special_aged_brie(item)
      elsif special?(item) == 1
        legendary_items(item)
      elsif special?(item) == 2
        special_backstage(item)
      elsif special?(item) == 3
        conjured_items(item)
      else
        normal_items(item)
      end
    end
  end

  def printer
    @items.each do |item|
      puts item.to_s
    end
  end
end

#Item class
class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

gild_rose = GildedRose.new([Item.new('Sulfuras', 60, 80), Item.new('Juan', 15, 15), Item.new('Backstage passes', 5, 8),
                            Item.new('Aged Brie', 3, 50), Item.new('Conjured pedro', 10, 10)])
gild_rose.printer
gild_rose.update_quality
gild_rose.printer
