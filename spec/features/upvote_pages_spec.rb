require 'rails_helper'

describe "upvoting process" do
  it "upvotes a post" do
    visit new_user_path
    fill_in 'Email', :with => 'pickle'
    fill_in 'Password', :with => 'pickleeater'
    fill_in 'Password confirmation', :with => 'pickleeater'
    click_on 'Sign Up'
    click_on 'log in'
    fill_in 'Email', :with => 'pickle'
    fill_in 'Password', :with => 'pickleeater'
    click_on 'Log in'
    click_on 'Add'
    fill_in 'Title', :with => 'test title'
    fill_in 'Url', :with => 'www.wikipedia.org'
    click_on 'Create Post'
    click_on '^'
    expect(page).to have_content '1'
  end
end
