
# ruby texttest_fixture.rb | diff -B golden_master.txt -

require_relative 'item'

class GildedRose
  attr_reader :item
  MAX_QUALITY = 50
  MIN_QUALITY = 0

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|

    case item.name

    when 'Sulfuras'
      next
    when 'Conjured'
      degrade_by(item, 2)

    when 'Backstage passes to a TAFKAL80ETC concert'
      upgrade_by(item, 1)
      upgrade_by(item, 1) if item.sell_in.between?(6, 11)
      upgrade_by(item, 2) if item.sell_in < 6

      degrade_by(item, item.quality)

    when 'Aged Brie'
      upgrade_by(item, 1)
      if item.sell_in < 0
        degrade_by(item, 2)
      end

      else   # GENERIC
        item.sell_in -= 1
        degrade_by(item, 1)
        if item.sell_in < 0
          degrade_by(item, 1)
        end
      end # end when
    end
  end

  def degrade_by(item, number)
    item.quality -= number if item.quality > MIN_QUALITY
  end

  def upgrade_by(item, number)
    item.quality += number if item.quality < MAX_QUALITY
  end
end
