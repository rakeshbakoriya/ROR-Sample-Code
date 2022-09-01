require 'rails_helper'

RSpec.describe "blacklisted_auth_tokens/new", type: :view do
  before(:each) do
    assign(:blacklisted_auth_token, BlacklistedAuthToken.new())
  end

  it "renders new blacklisted_auth_token form" do
    render

    assert_select "form[action=?][method=?]", blacklisted_auth_tokens_path, "post" do
    end
  end
end
