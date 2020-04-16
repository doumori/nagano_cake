require 'rails_helper'

RSpec.describe "Admins::Orders", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/admins/orders/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/admins/orders/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/admins/orders/update"
      expect(response).to have_http_status(:success)
    end
  end

end
