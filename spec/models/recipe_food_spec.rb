require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  describe 'associations' do
    it { should belong_to(:food) }
    it { should belong_to(:recipe) }
  end

  describe 'validations' do
    it { should validate_presence_of(:quantity) }
    it { should validate_numericality_of(:quantity).is_greater_than(0) }
  end

  describe 'instance methods' do
    let(:recipe_food) { FactoryBot.create(:recipe_food) }

    it 'returns the total calories for the recipe_food' do
      food = FactoryBot.create(:food, calories: 100)
      recipe_food.food = food
      recipe_food.quantity = 2
      expect(recipe_food.total_calories).to eq(200)
    end
  end
end
