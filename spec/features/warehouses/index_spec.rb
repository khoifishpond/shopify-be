require 'rails_helper'

RSpec.describe 'Warehouse' do
  describe 'index page' do
    before(:each) do
      @warehouses = Warehouse.create([
        {name: 'Celadon Warehouse'},
        {name: 'Viridian Warehouse'}
      ])

      visit warehouses_path
    end

    it 'has a title' do
      expect(page).to have_content('Warehouses')
    end

    it 'has a home link' do
      expect(page).to have_link('Home')

      click_link 'Home'

      expect(current_path).to eq(root_path)
    end

    it 'has warehouses' do
      @warehouses.each do |warehouse|
        expect(page).to have_content(warehouse.name)
      end
    end

    it 'has a show link' do
      click_link "#{@warehouses.first.name}"

      expect(current_path).to eq(warehouse_path(@warehouses.first.id))
    end
  end
end