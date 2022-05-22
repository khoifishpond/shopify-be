require 'rails_helper'

RSpec.describe 'New Item' do
  before(:each) do
    @warehouse = Warehouse.create(name: 'Celadon Warehouse')
    visit new_item_path
  end
  
  describe 'form' do
    it 'has a link to go to home page' do
      click_link 'Home'

      expect(current_path).to eq(root_path)
    end

    it 'has a title' do
      expect(page).to have_content('Create an Inventory Item')
    end

    it 'can create an item' do
      fill_in 'Name', with: 'Gloves'
      fill_in 'Quantity', with: 10
      select 'Celadon Warehouse', from: 'Warehouse'

      click_button 'Create Item'

      expect(Item.last.name).to eq('Gloves')
      expect(Item.last.quantity).to eq(10)
      expect(Item.last.warehouse_id).to eq(@warehouse.id)
      expect(current_path).to eq(items_path)
      expect(page).to have_content(Item.last.name)
      expect(page).to have_content(Item.last.quantity)
      expect(page).to have_content("#{Item.last.name} created successfully.")
    end

    it 'has a link to go back to items index page' do
      click_link 'Back'

      expect(current_path).to eq(items_path)
    end
  end
end