require 'rails_helper'

RSpec.describe "refresh_auth_tokens/index", type: :view do
  before(:each) do
    assign(:refresh_auth_tokens, [
      RefreshAuthToken.create!(),
      RefreshAuthToken.create!()
    ])
  end

  it "renders a list of refresh_auth_tokens" do
    render
  end
end
