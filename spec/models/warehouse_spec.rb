require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  describe 'Associations' do
    it { should have_many(:items) }
  end
  
  describe 'Warehouse' do
    before(:each) do
      @warehouse = Warehouse.create(name: 'Celadon Warehouse')
    end
    
    it 'exists' do
      expect(@warehouse).to be_an(Warehouse)
    end

    it 'has attributes' do
      expect(@warehouse.name).to eq('Celadon Warehouse')
    end
  end
end
