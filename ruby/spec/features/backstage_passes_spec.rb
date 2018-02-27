describe "#update_quality" do

  describe 'Backstage passes' do

    describe 'increases in quality ' do
      it 'by 1 when more than 10 days from sell by date' do
        items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=20, quality=20)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 21
      end

      it 'by 2 when between 10-5 days to sell by date' do
        items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=8, quality=20)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 22
      end

      it 'by 3 when less than 5 days to sell by date' do
        items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=3, quality=20)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 23
      end
    end
    
    describe 'decreases in quality' do
      it 'quality is 0 after after sell by date' do
        items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=0, quality=20)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 0
      end
    end
  end
end
