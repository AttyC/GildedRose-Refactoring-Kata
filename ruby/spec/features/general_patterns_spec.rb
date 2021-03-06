describe GildedRose do
  subject(:gilded_rose) { described_class.new(items) }
  let(:items) { double :items }

  describe "#update_quality" do

    describe 'General patterns' do
      it 'sell_in date reduces after running update_quality' do
        items = [Item.new(name="+5 Dexterity Vest", sell_in=10, quality=0)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 9
      end
      it 'product reduces in quality closer to sell by date' do
        items = [Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20)]
        allow(subject).to receive(:update_quality)
        expect { subject.upgrade_by(items[0], 1) }.to change{ items[0].quality }.by 1
        end

      it 'product quality reduces x 2 after sell by date' do
        items = [Item.new(name="+5 Dexterity Vest", sell_in=0, quality=20)]
        allow(subject).to receive(:update_quality)
        expect { subject.upgrade_by(items[0], -2) }.to change{ items[0].quality }.by -2
      end
      it 'quality of an item is never negative' do
        items = [Item.new(name="+5 Dexterity Vest", sell_in=0, quality=0)]
        allow(subject).to receive(:update_quality)
        expect(items[0].quality).to eq 0
      end
      it 'quality of any item is never over 50 (except Sulfuras)' do
        items = [Item.new(name="Aged Brie", sell_in=50, quality=1)]
        60.times do
          GildedRose.new(items).update_quality()
        end
        expect(items[0].quality).to eq 50
      end
    end
  end
end
