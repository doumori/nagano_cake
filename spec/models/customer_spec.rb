require 'rails_helper'

RSpec.describe Customer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

RSpec.describe 'customerモデルのテスト', type: :model do
  # 名前が空欄で登録できない→名前を空欄で登録したらfalse
  # バリデーションしていない状態で失敗→設定したら成功
  # 登録できるかできないか 登録できたら失敗
  # エラーメッセージがなければ失敗

  describe 'バリデーションのテスト' do
    let(:customer) { build(:customer) }
    subject { test_customer.valid? }
    context 'nameカラム' do
      let(:test_customer) { customer }
      it '空欄でないこと' do
        test_customer.name = ''
        is_expected.to eq false;
      end
      it '2文字以上であること' do
        test_customer.name = Faker::Lorem.characters(number:1)
        is_expected.to eq false;
      end
      it '20文字以下であること' do
        test_customer.name = Faker::Lorem.characters(number:21)
        is_expected.to eq false;
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'cart_itemsモデルとの関係' do
      it '1:Nとなっている' do
        expect(customer.reflect_on_association(:cart_items).macro).to eq :has_many
      end
    end
  end

    describe 'アソシエーションのテスト' do
    context 'ordersモデルとの関係' do
      it '1:Nとなっている' do
        expect(customer.reflect_on_association(:orders).macro).to eq :has_many
      end
    end
  end

    describe 'アソシエーションのテスト' do
    context 'shipsモデルとの関係' do
      it '1:Nとなっている' do
        expect(customer.reflect_on_association(:ships).macro).to eq :has_many
      end
    end
  end

end
# アソシエーションのテスト