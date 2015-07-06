require 'rails_helper'

  describe User do
    it 'validates the presence of an email' do
    user = FactoryGirl.create(:user, :email => "toast", :password => "toastlicker")
    expect(user.email).to eq "toast"
  end
end
