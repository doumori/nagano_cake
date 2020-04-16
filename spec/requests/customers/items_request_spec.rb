require 'rails_helper'

RSpec.describe "Customers::Items", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/customers/items/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/customers/items/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /top" do
    it "returns http success" do
      get "/customers/items/top"
      expect(response).to have_http_status(:success)
    end
  end

end
