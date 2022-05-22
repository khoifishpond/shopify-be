require 'rails_helper'

RSpec.describe 'Warehouse' do
  describe 'show page' do
    before(:each) do
      @warehouse = Warehouse.create(name: 'Celadon Warehouse')

      visit warehouse_path(@warehouse.id)
    end
    
    it 'has a title' do
      expect(page).to have_content(@warehouse.name)
    end

    it 'has a home button' do
      expect(page).to have_link('Home')

      click_link 'Home'

      expect(current_path).to eq(root_path)
    end

    it 'has warehouse inventory items' do
      @warehouse.items.each do |item|
        expect(page).to have_content(item.name)
        expect(page).to have_content(item.quantity)
      end
    end

    it 'has a link to go back to warehouse index page' do
      click_link 'Back'

      expect(current_path).to eq(warehouses_path)
    end
  end
end