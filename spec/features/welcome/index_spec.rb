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
  end
end