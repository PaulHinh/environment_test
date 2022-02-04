# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'austin train'
    fill_in 'Price', with: 22
    select '2021', :from => 'book_published_date_1i'
    select 'January', :from => 'book_published_date_2i'
    select '1', :from => 'book_published_date_3i'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('austin train')
    expect(page).to have_content(22)
    expect(page).to have_content('2021-01-01')
  end
end

