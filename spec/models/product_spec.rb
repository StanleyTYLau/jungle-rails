require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    it "is valid with valid attributes" do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      pro1 =
      cat1.products.new({
        name:  'Plumbus',
        quantity: 10,
        price: 20.00
      })
      expect(pro1).to be_valid
    end

    it "is not valid without name" do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      pro1 =
      cat1.products.new({
        name:  nil,
        quantity: 10,
        price: 20.00
      })

      expect(pro1).to_not be_valid
    end

    it "is not valid without price" do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      pro1 =
      cat1.products.new({
        name:  "Plumbus",
        quantity: 10,
        price: nil
      })

      expect(pro1).to_not be_valid
    end

    it "is not valid without quantity" do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      pro1 =
      cat1.products.new({
        name:  'Plumbus',
        quantity: nil,
        price: 20.00
      })

      expect(pro1).to_not be_valid
    end

    it "is not valid without category" do
  
      pro2 = Product.new({
        name:  'Plumbus',
        quantity: 10,
        price: 20.00,
        category: nil
      })
      expect(pro2).to_not be_valid
    end

  end
end
