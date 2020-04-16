require 'rails_helper'

RSpec.describe "Customers::Orders", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/customers/orders/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/customers/orders/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/customers/orders/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /confirm" do
    it "returns http success" do
      get "/customers/orders/confirm"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /thanks" do
    it "returns http success" do
      get "/customers/orders/thanks"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/customers/orders/index"
      expect(response).to have_http_status(:success)
    end
  end

end
