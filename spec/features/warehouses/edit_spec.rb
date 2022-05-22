require 'rails_helper'

RSpec.describe 'Edit Item' do
  before(:each) do
    Warehouse.create(name: 'Celadon Warehouse')

    visit edit_warehouse_path(Warehouse.first.id)
  end
  
  describe 'form' do
    it 'has a link to go to home page' do
      click_link 'Home'

      expect(current_path).to eq(root_path)
    end

    it 'has a title' do
      expect(page).to have_content('Edit Warehouse')
    end

    it 'can edit a warehouse' do
      fill_in 'Name', with: 'Saffron Warehouse'

      click_button 'Edit Warehouse'

      expect(Warehouse.first.name).to eq('Saffron Warehouse')
      expect(current_path).to eq(warehouse_path(Warehouse.first.id))
      expect(page).to have_content(Warehouse.first.name)
      expect(page).to have_content("Warehouse updated successfully.")
    end

    it 'has a link to go back to warehouse index page' do
      click_link 'Back'

      expect(current_path).to eq(warehouses_path)
    end
  end
end