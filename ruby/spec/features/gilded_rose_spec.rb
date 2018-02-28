describe GildedRose do

  subject(:gilded_rose) { described_class.new(items) }
  let(:items) { double :items }

  describe '#update_quality' do

    describe 'Sulfuras, Hand of Ragnaros' do
      it 'quality is always 80' do
        items = [Item.new(name='Sulfuras, Hand of Ragnaros', sell_in=0, quality=80)]
        expect(items[0].quality).to eq 80
      end
      it 'has no sell by date' do
        items = [Item.new(name='Sulfuras, Hand of Ragnaros', sell_in=0, quality=20)]
        allow(subject).to receive(:update_quality)
        expect(items[0].sell_in).to eq 0
      end
    end

    describe 'Aged Brie' do
      it 'Aged Brie increases in quality closer to sell by date' do
        items = [Item.new(name='Aged Brie', sell_in=10, quality=20)]
        allow(subject).to receive(:update_quality)
        expect { subject.upgrade_by(items[0], 1) }.to change{ items[0].quality }.by 1
      end
      it 'Aged Brie increases 2x quality after sell by date' do
        items = [Item.new(name='Aged Brie', sell_in=0, quality=20)]
        allow(subject).to receive(:update_quality)
        expect { subject.upgrade_by(items[0], 2) }.to change{ items[0].quality }.by 2
      end
    end

    describe 'Conjured' do
      it 'Conjured items degrade in Quality twice as fast as normal items' do
        items = [Item.new(name='Conjured', sell_in=10, quality=20)]
        allow(subject).to receive(:update_quality)
        expect { subject.degrade_by(items[0],5) }.to change{ items[0].quality }.by -5
      end
    end
  end
end
