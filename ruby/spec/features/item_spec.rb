describe 'Item' do

  describe 'initialize' do
    it 'puts name, sell-in and quality in a string' do
      item = Item.new('Test product', 0, 0)
      expect(item.to_s).to eq 'Test product, 0, 0'
    end
  end
end
