require 'rails_helper'

RSpec.describe "admin_users/index", type: :view do
  before(:each) do
    assign(:admin_users, [
      AdminUser.create!(),
      AdminUser.create!()
    ])
  end

  it "renders a list of admin_users" do
    render
  end
end
