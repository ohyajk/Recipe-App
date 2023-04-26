RSpec.describe Food, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:recipe_food).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    # Add more validations as needed
  end

  describe 'factory' do
    it 'has a valid factory' do
      expect(build(:food)).to be_valid
    end
  end

  describe 'attributes' do
    it 'has a name' do
      food = build(:food, name: 'Pizza')
      expect(food.name).to eq('Pizza')
    end

    it 'has a measurement_unit' do
      food = build(:food, measurement_unit: 'kg')
      expect(food.measurement_unit).to eq('kg')
    end

    it 'has a price' do
      food = build(:food, price: 500)
      expect(food.price).to eq(500)
    end

    it 'has a quantity' do
      food = build(:food, quantity: 3)
      expect(food.quantity).to eq(3)
    end
  end
end
