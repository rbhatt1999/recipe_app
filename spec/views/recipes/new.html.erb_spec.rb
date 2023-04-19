require 'rails_helper'

RSpec.describe 'recipes/new', type: :view do
  include Devise::Test::IntegrationHelpers
  before(:example) do
    @user = User.create(name: 'Kolly', email: 'asdasasd@gmail.com', password: 'password', confirmed_at: Time.now)
    @recipe = Recipe.create(name: 'Recipe', description: 'Description', cooking_time: '1 hour',
                            preperation_time: '1 hour', public: false, user: @user)
    sign_in @user
    visit new_recipe_path
  end

  it 'renders new recipe form' do
    expect(page).to have_content 'Name'
  end

  it 'submit form' do
    fill_in 'Name', with: 'shake'
    fill_in 'Preperation time', with: '1 hour'
    fill_in 'Cooking time', with: '1 hour'
    fill_in 'Description', with: 'Description'
    click_on 'Create Recipe'
    expect(page).to have_content 'Recipe was successfully created.'
  end

  it 'back to recipes' do
    click_on 'Back to recipes'
    expect(current_path).to eql recipes_path
  end
end
