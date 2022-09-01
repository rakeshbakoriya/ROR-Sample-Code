require "rails_helper"

RSpec.describe RefreshAuthTokensController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/refresh_auth_tokens").to route_to("refresh_auth_tokens#index")
    end

    it "routes to #new" do
      expect(get: "/refresh_auth_tokens/new").to route_to("refresh_auth_tokens#new")
    end

    it "routes to #show" do
      expect(get: "/refresh_auth_tokens/1").to route_to("refresh_auth_tokens#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/refresh_auth_tokens/1/edit").to route_to("refresh_auth_tokens#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/refresh_auth_tokens").to route_to("refresh_auth_tokens#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/refresh_auth_tokens/1").to route_to("refresh_auth_tokens#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/refresh_auth_tokens/1").to route_to("refresh_auth_tokens#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/refresh_auth_tokens/1").to route_to("refresh_auth_tokens#destroy", id: "1")
    end
  end
end
