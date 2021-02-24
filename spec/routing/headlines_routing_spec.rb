require "rails_helper"

RSpec.describe HeadlinesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/headlines").to route_to("headlines#index")
    end

    it "routes to #new" do
      expect(get: "/headlines/new").to route_to("headlines#new")
    end

    it "routes to #show" do
      expect(get: "/headlines/1").to route_to("headlines#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/headlines/1/edit").to route_to("headlines#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/headlines").to route_to("headlines#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/headlines/1").to route_to("headlines#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/headlines/1").to route_to("headlines#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/headlines/1").to route_to("headlines#destroy", id: "1")
    end
  end
end
