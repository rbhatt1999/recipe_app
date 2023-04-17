require 'rails_helper'

RSpec.describe 'recipes/show', type: :view do
  before(:each) do
    assign(:recipe, Recipe.create!(
                      name: 'Name',
                      preperation_time: 'Preperation Time',
                      cooking_time: 'Cooking Time',
                      description: 'MyText',
                      public: false,
                      user: nil
                    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Preperation Time/)
    expect(rendered).to match(/Cooking Time/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
