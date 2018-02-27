require_relative 'item'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|

      #1 if generic item, reduce quality // DEFAULT
      if item.name != 'Aged Brie' and item.name != 'Backstage passes to a TAFKAL80ETC concert' and item.name != 'Sulfuras, Hand of Ragnaros'
        item.quality -= 1 if item.quality > 0
      else
        # increment quality
        item.quality = item.quality + 1 if item.quality < 50

        #2 Backstage passes - extra increments before sell by date
        if item.name == 'Backstage passes to a TAFKAL80ETC concert'
          if item.sell_in.between?(6, 11)
            item.quality += 1
          elsif item.sell_in < 6
            item.quality += 2
          end
        end
      end
      #3 reduce sell_in date for all excpet Sulfuras
      item.sell_in = item.sell_in - 1 unless item.name == 'Sulfuras, Hand of Ragnaros'

      if item.sell_in < 0
        if item.name != 'Aged Brie'
          if item.name != 'Backstage passes to a TAFKAL80ETC concert'
            if item.quality > 0
              if item.name != 'Sulfuras, Hand of Ragnaros'
                item.quality = item.quality - 1
              end
            end
          else
            item.quality -= item.quality
          end
        else
          item.quality += 1 if item.quality < 50
        end
      end
    end
  end
end
