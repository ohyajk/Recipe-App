require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:recipe_foods).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:instructions) }
  end

  describe 'instance methods' do
    let(:recipe) { FactoryBot.create(:recipe) }

    it 'returns the total number of recipe_foods' do
      FactoryBot.create_list(:recipe_food, 3, recipe:)
      expect(recipe.recipe_foods_count).to eq(3)
    end
  end

  describe 'callbacks' do
    it 'destroys associated recipe_foods when a recipe is destroyed' do
      recipe = FactoryBot.create(:recipe)
      FactoryBot.create_list(:recipe_food, 3, recipe:)

      expect { recipe.destroy }.to change(RecipeFood, :count).by(-3)
    end
  end
end
