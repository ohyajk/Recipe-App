require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:recipe_foods).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:calories) }
    it { should validate_numericality_of(:calories).is_greater_than(0) }
  end

  describe 'instance methods' do
    let(:food) { FactoryBot.create(:food) }

    it 'returns the total number of recipe_foods' do
      FactoryBot.create_list(:recipe_food, 3, food: food)
      expect(food.recipe_foods_count).to eq(3)
    end
  end

  describe 'callbacks' do
    it 'destroys associated recipe_foods when a food is destroyed' do
      food = FactoryBot.create(:food)
      FactoryBot.create_list(:recipe_food, 3, food: food)

      expect { food.destroy }.to change(RecipeFood, :count).by(-3)
    end
  end
end

