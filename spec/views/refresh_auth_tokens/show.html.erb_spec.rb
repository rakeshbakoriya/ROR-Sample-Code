require 'rails_helper'

RSpec.describe "refresh_auth_tokens/show", type: :view do
  before(:each) do
    @refresh_auth_token = assign(:refresh_auth_token, RefreshAuthToken.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
