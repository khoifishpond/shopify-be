require 'rails_helper'

RSpec.describe 'Items' do
  describe 'show page' do
    before(:each) do
      warehouse = Warehouse.create(name: 'Celadon Warehouse')
      @item = Item.create(name: 'Sunglasses',  quantity: 200, warehouse_id: warehouse.id)

      visit item_path(@item.id)
    end
    
    it 'has a title' do
      expect(page).to have_content('Item')
    end

    it 'has a home button' do
      expect(page).to have_link('Home')

      click_link 'Home'

      expect(current_path).to eq(root_path)
    end

    it 'has item details' do
      expect(page).to have_content(@item.name)
      expect(page).to have_content(@item.quantity)
    end

    it 'has a link to edit item' do
      click_link 'Edit'

      expect(current_path).to eq(edit_item_path(@item.id))
    end

    it 'has a link to delete item' do
      click_link 'Delete'

      expect(current_path).to eq(items_path)
      expect(page).to_not have_content(@item.name)
      expect(page).to_not have_content(@item.quantity)
    end

    it 'has a link to go back to items index page' do
      click_link 'Back'

      expect(current_path).to eq(items_path)
    end
  end
end