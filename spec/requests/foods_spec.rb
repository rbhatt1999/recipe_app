require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'Kolly', email: 'kolly@mail.com', password: 'password', confirmed_at: Time.now) }
  let(:food) { user.foods.create(name: 'apple', measurement_unit: 'kg', price: 4) }

  describe 'GET /index' do
    before do
      sign_in user
      get foods_path
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end

    it 'render contain foods' do
      @food1 = user.foods.create(name: 'apple', measurement_unit: 'kg', price: 4)
      get foods_url
      expect(response.body).to include(@food1.name)
    end
  end

  describe 'GET /new' do
    before do
      sign_in user
      get new_food_path
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end

    it 'should include correct placeholder' do
      expect(response.body).to include('Name')
      expect(response.body).to include('Measurement unit')
      expect(response.body).to include('Price')
      expect(response.body).to include('Quantity')
    end
  end

  describe 'POST /create' do
    before do
      sign_in user
      get new_food_path
    end

    it 'should create a new food' do
      expect do
        post foods_path, params: { food: { name: 'apple', measurement_unit: 'kg', price: 4 } }
      end.to change(Food, :count).by(1)
    end

    it 'should redirect to foods_path' do
      post foods_path, params: { food: { name: 'apple', measurement_unit: 'kg', price: 4 } }
      expect(response).to redirect_to foods_path
    end

    it 'should not create a new food' do
      expect do
        post foods_path, params: { food: { name: '', measurement_unit: 'kg', price: 4 } }
      end.to change(Food, :count).by(0)
    end

    it 'should render new template' do
      post foods_path, params: { food: { name: '', measurement_unit: 'kg', price: 4 } }
      expect(response).to render_template(:new)
    end
  end

  describe 'DELETE /destroy' do
    it 'should delete a food' do
      sign_in user
      food
      expect do
        delete food_path(food)
      end.to change(Food, :count).by(-1)
    end

    it 'should redirect to foods_path' do
      sign_in user
      food
      delete food_path(food)
      expect(response).to redirect_to foods_path
    end
  end
end
