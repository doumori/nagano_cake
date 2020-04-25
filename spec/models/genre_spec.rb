require 'rails_helper'

RSpec.describe Genre, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

require 'rails_helper'

RSpec.describe 'genreモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:customer) { create(:customer) }
    let!(:genre) { build(:genre, customer_id: customer.id) }

    context 'nameカラム' do
      it '空欄でないこと' do
        genre.title = ''
        expect(genre.valid?).to eq false;
      end
    end
    context 'is_activeカラム' do
      it '空欄でないこと' do
        genre.body = ''
        expect(genre.valid?).to eq false;
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'customerモデルとの関係' do
      it 'N:1となっている' do
        expect(genre.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end
  end
end