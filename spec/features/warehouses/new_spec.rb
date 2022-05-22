require 'rails_helper'

RSpec.describe 'New Warehouse' do
  before(:each) do
    visit new_warehouse_path
  end
  
  describe 'form' do
    it 'has a link to to home page' do
      click_link 'Home'

      expect(current_path).to eq(root_path)
    end

    it 'has a title' do
      expect(page).to have_content('Create a Warehouse')
    end

    it 'can create a warehouse' do
      fill_in 'Name', with: 'Celadon Warehouse'

      click_button 'Create Warehouse'

      expect(Warehouse.last.name).to eq('Celadon Warehouse')
      expect(current_path).to eq(warehouses_path)
      expect(page).to have_content(Warehouse.last.name)
    end

    it 'has a link to go back to warehouses index page' do
      click_link 'Back'

      expect(current_path).to eq(warehouses_path)
    end
  end
end