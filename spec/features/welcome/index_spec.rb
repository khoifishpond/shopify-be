require 'rails_helper'

RSpec.describe 'Welcome' do
  describe 'Welcome page' do
    before(:each) do
      visit root_path
    end
    
    it 'has a title' do
      expect(page).to have_content('Inventory')
    end

    it 'has a home button' do
      expect(page).to have_link('Home')
    end

    it 'has a link to items index' do
      click_link 'Items'

      expect(current_path).to eq(items_path)
    end

    it 'has a link to warehouses index' do
      click_link 'Warehouses'

      expect(current_path).to eq(warehouses_path)
    end
  end
end