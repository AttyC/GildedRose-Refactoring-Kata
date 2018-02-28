require_relative 'item'

class GildedRose
  attr_reader :item

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|

      # First - update tests with stubs
      # create stub for Item
      # Sulfuras special case
      # edge cases?
      # README

    case item.name
    when 'Conjured'
      degrade_by(item, 2) if item.quality > 0

    when 'Backstage passes to a TAFKAL80ETC concert'
      upgrade_by(item, 1) if item.quality < 50
      upgrade_by(item, 1) if item.sell_in.between?(6, 11)
      upgrade_by(item, 2) if item.sell_in < 6

      degrade_by(item, item.quality)

    when 'Aged Brie'
      upgrade_by(item, 1) if item.quality < 50

    else   # GENERIC
      item.sell_in -= 1 unless item.name == 'Sulfuras, Hand of Ragnaros'

      if item.quality > 0
        degrade_by(item, 1)
        if item.sell_in < 0
          degrade_by(item, 1)
        end
      end

    end # end when
  end
end

  def degrade_by(item, number)
    item.quality -= number
  end

  def upgrade_by(item, number)
    item.quality += number
  end
end
