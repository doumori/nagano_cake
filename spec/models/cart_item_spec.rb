require 'rails_helper'

RSpec.describe CartItem, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

require 'rails_helper'

RSpec.describe 'cart_itemモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:customer) { create(:customer) }
    let!(:cart_item) { build(:cart_item, customer_id: customer.id) }

    context 'item_quantityカラム' do
      it '空欄でないこと' do
        cart_item.item_quantity = ''
        expect(cart_item.valid?).to eq false;
      end
    end
    context 'item_idカラム' do
      it '空欄でないこと' do
        cart_item.item_id = ''
        expect(cart_item.valid?).to eq false;
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Customerモデルとの関係' do
      it 'N:1となっている' do
        expect(cart_item.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end
  end
end