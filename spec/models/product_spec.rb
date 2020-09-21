require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Product Validations' do
    context 'given 4 correct parameters' do
      it 'successfully saves' do
        category = Category.new(name: 'Potato')
        product = Product.new(name: 'A Potato', price: 999, quantity: 5, category: category)

        expect(product).to be_valid
      end
    end

    context 'not given a name' do
      it "gives an error saying name can't be nil" do
        category = Category.new(name: 'Potato')
        product = Product.new(price: 999, quantity: 5, category: category)
        product.save

        expect(product.errors.full_messages).to include("Name can't be blank")
      end
    end

    context 'not given a price' do
      it "gives an error saying name can't be nil" do
        category = Category.new(name: 'Potato')
        product = Product.new(name: 'A Potato', quantity: 5, category: category)
        product.save

        expect(product.errors.full_messages).to include("Price can't be blank")
      end
    end

    context 'not given a quantity' do
      it "gives an error saying name can't be nil" do
        category = Category.new(name: 'Potato')
        product = Product.new(name: 'A Potato', price: 999, category: category)
        product.save

        expect(product.errors.full_messages).to include("Quantity can't be blank")
      end
    end

    context 'not given a category' do
      it "gives an error saying name can't be nil" do
        category = Category.new(name: 'Potato')
        product = Product.new(name: 'A Potato', price: 999, quantity: 5)
        product.save

        expect(product.errors.full_messages).to include("Category can't be blank")
      end
    end
  end
end
