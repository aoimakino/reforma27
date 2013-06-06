require "spec_helper"

describe ClientServicesController do
  describe "routing" do

    it "routes to #index" do
      get("/client_services").should route_to("client_services#index")
    end

    it "routes to #new" do
      get("/client_services/new").should route_to("client_services#new")
    end

    it "routes to #show" do
      get("/client_services/1").should route_to("client_services#show", :id => "1")
    end

    it "routes to #edit" do
      get("/client_services/1/edit").should route_to("client_services#edit", :id => "1")
    end

    it "routes to #create" do
      post("/client_services").should route_to("client_services#create")
    end

    it "routes to #update" do
      put("/client_services/1").should route_to("client_services#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/client_services/1").should route_to("client_services#destroy", :id => "1")
    end

  end
end
