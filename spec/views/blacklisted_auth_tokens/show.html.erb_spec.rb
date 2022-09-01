require 'rails_helper'

RSpec.describe "blacklisted_auth_tokens/show", type: :view do
  before(:each) do
    @blacklisted_auth_token = assign(:blacklisted_auth_token, BlacklistedAuthToken.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
