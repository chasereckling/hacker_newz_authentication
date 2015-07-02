require 'rails_helper'

describe "upvoting process" do
  it "upvotes a post" do
    visit posts_path
    click_on 'Add'
    fill_in 'Title', :with => 'test title'
    fill_in 'Url', :with => 'www.wikipedia.org'
    click_on 'Create Post'
    click_on 'Upvote'
    expect(page).to have_content '1'
  end
end
