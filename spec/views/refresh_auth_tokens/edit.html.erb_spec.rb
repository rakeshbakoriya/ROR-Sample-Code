require 'rails_helper'

RSpec.describe "refresh_auth_tokens/edit", type: :view do
  before(:each) do
    @refresh_auth_token = assign(:refresh_auth_token, RefreshAuthToken.create!())
  end

  it "renders the edit refresh_auth_token form" do
    render

    assert_select "form[action=?][method=?]", refresh_auth_token_path(@refresh_auth_token), "post" do
    end
  end
end
