require 'rails_helper'

RSpec.describe 'Edit Item' do
  before(:each) do
    warehouse = Warehouse.create(name: 'Celadon Warehouse')
    Item.create(name: 'Sunglasses',  quantity: 200, warehouse_id: warehouse.id)

    visit edit_item_path(Item.first.id)
  end
  
  describe 'form' do
    it 'has a link to go to home page' do
      click_link 'Home'

      expect(current_path).to eq(root_path)
    end

    it 'has a title' do
      expect(page).to have_content('Edit Inventory Item')
    end

    it 'can edit an item' do
      fill_in 'Name', with: 'Gloves'
      fill_in 'Quantity', with: 10

      click_button 'Edit Item'

      expect(Item.first.name).to eq('Gloves')
      expect(Item.first.quantity).to eq(10)
      expect(current_path).to eq(item_path(Item.first.id))
      expect(page).to have_content(Item.first.name)
      expect(page).to have_content(Item.first.quantity)
      expect(page).to have_content("Item updated successfully.")
    end

    it 'has a link to go back to items show page' do
      click_link 'Back'

      expect(current_path).to eq(item_path(Item.first.id))
    end
  end
end