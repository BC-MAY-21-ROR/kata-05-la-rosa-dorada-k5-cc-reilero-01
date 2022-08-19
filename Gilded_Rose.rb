# class GildedRose

#   def initialize(items)
#     @items = items
#   end

#   def update_quality()
#     @items.each do |item|
#       if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
#         if item.quality > 0
#           if item.name != "Sulfuras, Hand of Ragnaros"
#             item.quality = item.quality - 1
#           end
#         end
#       else
#         if item.quality < 50
#           item.quality = item.quality + 1
#           if item.name == "Backstage passes to a TAFKAL80ETC concert"
#             if item.sell_in < 11
#               if item.quality < 50
#                 item.quality = item.quality + 1
#               end
#             end
#             if item.sell_in < 6
#               if item.quality < 50
#                 item.quality = item.quality + 1
#               end
#             end
#           end
#         end
#       end
#       if item.name != "Sulfuras, Hand of Ragnaros"
#         item.sell_in = item.sell_in - 1
#       end
#       if item.sell_in < 0
#         if item.name != "Aged Brie"
#           if item.name != "Backstage passes to a TAFKAL80ETC concert"
#             if item.quality > 0
#               if item.name != "Sulfuras, Hand of Ragnaros"
#                 item.quality = item.quality - 1
#               end
#             end
#           else
#             item.quality = item.quality - item.quality
#           end
#         else
#           if item.quality < 50
#             item.quality = item.quality + 1
#           end
#         end
#       end
#     end
#   end
# end

class GildedRose
  attr_accessor :items

  def initilize(items)
    @items = items
    @special_items = ["Aged Brie", "Sulfuras", "Backstage passes", "Conjured"]
  end

  def legendary_items
      @items.sell_in = nil
      @items.quality = 80
  end

  def special_aged_brie
    @items.sell_in - 1
    if @items.quality < 50 ? @items.quality + 1 : @items.quality
  end

  def special_backstage
    @items.sell_in - 1
    if @items.sell_in <= 10
      @items.quality += 2
    elsif @items.sell_in <= 5
      @items.sell_in += 3
    elsif @items.sell_in <= 0
      @items.sell_in = 0
    else
      @items.sell_in +=1
    end
  end

  def update_quality
    @items.each do |item|
      if item.name
        if item.quality
          conjured
        end
      end
    end
  end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

GildedRose.new
