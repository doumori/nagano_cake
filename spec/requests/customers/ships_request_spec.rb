require 'rails_helper'

RSpec.describe "Customers::Ships", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/customers/ships/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/customers/ships/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/customers/ships/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/customers/ships/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/customers/ships/create"
      expect(response).to have_http_status(:success)
    end
  end

end
