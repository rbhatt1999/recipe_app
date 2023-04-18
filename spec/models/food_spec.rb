require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    @user = User.new(name: 'Hassan', email: 'hassan@gmail.com')
    @food = @user.foods.new(name: 'Appel', measurement_unit: 'kg',price: 10 , quantity: 12)
  end

  describe 'Food model' do
    it 'Should have a name' do
      expect(subject.name).to eq @food.name
    end

    it 'Should have a price' do
      expect(subject.price).to eq @food.price
    end

    it 'Should have a measurement_unit' do
      expect(subject.measurement_unit).to eq @food.measurement_unit
    end

    it 'Should have a quantity' do
      expect(subject.quantity).to eq @food.quantity
    end
  end
end