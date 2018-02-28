describe GildedRose do
  subject(:gilded_rose) { described_class.new(items) }
  let(:items) { double :items }

  describe "#update_quality" do
    describe 'Backstage passes' do

      describe 'increases in quality ' do
        it 'by 1 when more than 10 days from sell by date' do
          items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=20, quality=20)]
          allow(subject).to receive(:update_quality)
          expect { subject.upgrade_by(items[0],1) }.to change{ items[0].quality }.by 1
        end

        it 'by 2 when between 10-5 days to sell by date' do
          items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=8, quality=20)]
          allow(subject).to receive(:update_quality)
          expect { subject.upgrade_by(items[0],2) }.to change{ items[0].quality }.by 2
        end

        it 'by 3 when less than 5 days to sell by date' do
          items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=3, quality=20)]
          allow(subject).to receive(:update_quality)
          expect { subject.upgrade_by(items[0],3) }.to change{ items[0].quality }.by 3
        end
      end

      describe 'decreases in quality' do
        it 'quality is 0 after after sell by date' do
          items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=0, quality=1)]
          allow(subject).to receive(:update_quality)
          expect { subject.update_quality}.to change{ items[0].quality }.by 0
        end
      end
    end
  end
end
