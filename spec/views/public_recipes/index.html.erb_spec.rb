require 'rails_helper'

RSpec.describe 'public_recipes/index', type: :view do
  include Devise::Test::IntegrationHelpers
  before(:example) do
    @user = User.create(name: 'Kolly', email: 'asdasasd@gmail.com', password: 'password', confirmed_at: Time.now)
    @recipe = Recipe.create(name: 'Apple', description: 'Description', public: true, cooking_time: '1 hour',
                            preperation_time: '1 hour', user: @user)
    sign_in @user
    visit public_recipes_path
  end

  it 'renders a list of recipes' do
    expect(page).to have_content 'Apple'
  end

  it 'click on recipe' do
    find("a[href= '/recipes/#{@recipe.id}']").click
    sleep 1
    expect(current_path).to eql recipe_path(@recipe)
  end
end
