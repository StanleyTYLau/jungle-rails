require 'rails_helper'

RSpec.feature "Visitor navigates to product page", type: :feature, js: true do
    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @item = @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end

    scenario "They see all products" do
      # ACT
      visit root_path
      first('article header').click
      sleep 2
      
      #VERIFY
      expect(page).to have_css 'article.product-detail'
      expect(page).to have_current_path(product_path(@item.id))
      save_and_open_screenshot
    end

end
