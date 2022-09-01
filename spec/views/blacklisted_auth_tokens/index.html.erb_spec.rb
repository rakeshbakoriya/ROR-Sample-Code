require 'rails_helper'

RSpec.describe "blacklisted_auth_tokens/index", type: :view do
  before(:each) do
    assign(:blacklisted_auth_tokens, [
      BlacklistedAuthToken.create!(),
      BlacklistedAuthToken.create!()
    ])
  end

  it "renders a list of blacklisted_auth_tokens" do
    render
  end
end
