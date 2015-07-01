require 'rails_helper'

describe "the add a post process" do
  it "adds a new post" do
    visit posts_path
    click_on 'Add'
    fill_in 'Title', :with => 'test title'
    fill_in 'Url', :with => 'www.wikipedia.org'
    click_on 'Create Post'
    expect(page).to have_content 'Add successful!'
  end

  it "gives error when no name is entered" do
    visit new_post_path
    click_on 'Create Post'
    expect(page).to have_content 'errors'
  end
end
