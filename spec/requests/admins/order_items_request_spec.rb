require 'rails_helper'

RSpec.describe "Admins::OrderItems", type: :request do

  describe "GET /update" do
    it "returns http success" do
      get "/admins/order_items/update"
      expect(response).to have_http_status(:success)
    end
  end

end
