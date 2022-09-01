require 'rails_helper'

RSpec.describe "refresh_auth_tokens/new", type: :view do
  before(:each) do
    assign(:refresh_auth_token, RefreshAuthToken.new())
  end

  it "renders new refresh_auth_token form" do
    render

    assert_select "form[action=?][method=?]", refresh_auth_tokens_path, "post" do
    end
  end
end
