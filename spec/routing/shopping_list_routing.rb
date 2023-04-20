require 'rails_helper'

RSpec.describe ShoppingListController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: shopping_list_path).to route_to('shopping_list#index')
    end
  end
end
