require 'rails_helper'

RSpec.describe "blacklisted_auth_tokens/edit", type: :view do
  before(:each) do
    @blacklisted_auth_token = assign(:blacklisted_auth_token, BlacklistedAuthToken.create!())
  end

  it "renders the edit blacklisted_auth_token form" do
    render

    assert_select "form[action=?][method=?]", blacklisted_auth_token_path(@blacklisted_auth_token), "post" do
    end
  end
end
