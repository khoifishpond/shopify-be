require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'Associations' do
    it { should belong_to(:warehouse) }
  end
  
  describe 'Item' do
    before(:each) do
      @warehouse = Warehouse.create(name: 'Celadon Warehouse')
      @item = Item.create(
        name: 'Sunglasses',
        quantity: 100,
        warehouse_id: @warehouse.id
      )
    end

    it 'exists' do
      expect(@item).to be_an(Item)
    end

    it 'has attributes' do
      expect(@item.name).to eq('Sunglasses')
      expect(@item.quantity).to eq(100)
    end

    it '#warehouse_name' do
      expect(@item.warehouse_name).to eq(@warehouse.name)
    end
  end
end