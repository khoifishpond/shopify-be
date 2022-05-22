require 'rails_helper'

RSpec.describe 'Items' do
  describe 'index page' do
    before(:each) do
      warehouse = Warehouse.create(name: 'Celadon Warehouse')
      @items = Item.create([
        {
          name: 'Sunglasses',
          quantity: 200,
          warehouse_id: warehouse.id
        },
        {
          name: 'Shoes',
          quantity: 20,
          warehouse_id: warehouse.id
        },
        {
          name: 'Shirt',
          quantity: 150,
          warehouse_id: warehouse.id
        }
      ])

      visit items_path
    end
    
    it 'has a title' do
      expect(page).to have_content('Inventory Items')
    end

    it 'has a home link' do
      expect(page).to have_link('Home')

      click_link 'Home'

      expect(current_path).to eq(root_path)
    end

    it 'has items' do
      @items.each do |item|
        expect(page).to have_content(item.name)
        expect(page).to have_content(item.quantity)
      end
    end

    it 'has a show link' do
      within("#item-#{@items.first.id}") do
        click_link "#{@items.first.name}"
  
        expect(current_path).to eq(item_path(@items.first.id))
      end
    end

    it 'has a link to create a new item' do
      click_link 'Create Item'

      expect(current_path).to eq(new_item_path)
    end
  end
end