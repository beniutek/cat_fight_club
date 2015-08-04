require "rails_helper"

RSpec.describe CatsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/cats").to route_to("cats#index")
    end

    it "routes to #show" do
      expect(:get => "/cats/1").to route_to("cats#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/cats").to route_to("cats#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/cats/1").to route_to("cats#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/cats/1").to route_to("cats#update", :id => "1")
    end

  end
end