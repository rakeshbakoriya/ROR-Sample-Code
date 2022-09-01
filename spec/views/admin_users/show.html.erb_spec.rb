require 'rails_helper'

RSpec.describe "admin_users/show", type: :view do
  before(:each) do
    @admin_user = assign(:admin_user, AdminUser.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
