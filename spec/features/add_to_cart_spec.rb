require 'rails_helper'

RSpec.feature "Visitor navigates to home and open the details of a product", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
    
  end

  scenario "Adding an item to cart increases the 'My Cart' quantity" do
    # ACT
    visit root_path

    find('.test-capybara-add', match: :first).click

    find('a', text: 'My Cart (1)')
    puts page.html
    # DEBUG / VERIFY
    save_screenshot

    expect(page).to have_text 'My Cart (1)'
  end

end