describe 'GildedRose' do

  describe "#update_quality" do

  describe 'Sulfuras, Hand of Ragnaros' do
      it 'quality is always 80' do
        items = [Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 80
      end
      it 'has no sell by date' do
        items = [Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=20)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 0
      end
    end

    describe 'Aged Brie' do
      it 'Aged Brie increases in quality closer to sell by date' do
        items = [Item.new(name="Aged Brie", sell_in=10, quality=20)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 21
      end
    end
  end
end

# * “Conjured” items degrade in Quality twice as fast as normal items

# All items have a SellIn value which denotes the number of days we have to sell the item
# All items have a Quality value which denotes how valuable the item is
# At the end of each day our system lowers both values for every item

# - Once the sell by date has passed, Quality degrades twice as fast /
# - The Quality of an item is never negative /
# - “Aged Brie” actually increases in Quality the older it gets /
# - The Quality of an item is never more than 50 /
# - “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
# - “Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches;
# Quality increases by 2 when there are 10 days or less
# and by 3 when there are 5 days or less but
# Quality drops to 0 after the concert
#NEW: add feature
