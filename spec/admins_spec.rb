require 'rails_helper'




  describe 'アドミンのテスト' do
    describe 'ユーザー認証のテスト' do
      before do
        visit admins_session_path
      end
      context 'ログイン画面に遷移' do
        it 'ログインに成功する' do
          fill_in 'admin[email]', with: Faker::Internet.email
          fill_in 'admin[password]', with: 'encrypted_password'
          click_button 'Log in'
          visit admins_path
        end
        it '新規登録に失敗する' do
          fill_in 'user[email]', with: ''
          fill_in 'admin[password]', with: ''
          click_button 'Log in'
          expect(page).to have_content 'error'
        end
      end
    end
    describe '管理者トップ画面のテスト' do
      before do
        visit admins_path
      end
      context 'ヘッダからジャンル一覧へのリンクを押下する' do
        it 'ジャンル一覧画面が表示される' do
          click_button 'ジャンル一覧'
           visit genres_path
        end
      end
    end
    descript 'ジャンル一覧画面' do
      defore do
        visit genres_path
      end
      content '必要事項を入力し、登録ボタンを押下する'do
        it '追加したジャンルが表示されている'do
          click_button '追加'
          expect(page).to have_field 'genre[name]',with: genre.name
        end
      end
    end
    describe '管理者トップ画面のテスト' do
      before do
        visit admins_path
      end
      context 'ヘッダから商品一覧へのリンクを押下する' do
        it '商品一覧画面が表示される' do
          click_button '商品一覧'
           visit admins_items_path
        end
      end
      before do
        visit admins_items_path
      end
      content'新規登録ボタンを押下する'do
        it '商品新規登録画面が表示される' do
          click_button 'items/new'
          visit admins_items_new_path
        end
      end
      before do
        visit admins_items_path
      end
      content'必要事項を入力して登録ボタンを押下する'do
        it '登録した商品の詳細画面に遷移する' do
          click_button '新規登録'
          visit admins_item_path(item)
        end
      end
    end
    describe '管理者トップ画面のテスト' do
      before do
        visit admins_path
      end
      context 'ヘッダから商品一覧へのリンクを押下する' do
        it '商品一覧画面が表示される' do
          click_button '商品一覧'
          visit admins_items_path
        end
        defore do
          visit admins_items_path
        end
        it '登録した商品が表示されている'do
          expect(page).to have_cotent item.id
          expect(page).to have_cotent item.name
          expect(page).to have_cotent item.price
          expect(page).to have_cotent item.genre_id
          expect(page).to have_cotent item.is_sale_status
        end
      end
      content'新規登録ボタンを押下する'do
        it '商品新規登録画面が表示される' do
          click_button 'items/new'
          visit admins_items_new_path
        end
      end
      content'必要事項を入力して登録ボタンを押下する'do
        it '登録した商品の詳細画面に遷移する' do
          click_button '新規登録'
          visit admins_item_path(item)
        end
        it '登録した商品が表示されている'do
          expect(page).to have_cotent item.id
          expect(page).to have_cotent item.name
          expect(page).to have_cotent item.price
          expect(page).to have_cotent item.genre_id
          expect(page).to have_cotent item.is_sale_status
        end
      end
      content 'ヘッダーからログアウトボタンをクリックする'do
        it '管理者ログイン画面に遷移する'do
          click_button 'Log out'
          visit admins_path
        end
      end
    end
  end
end
require 'rails_helper'
  describe 'アドミンのテスト' do
    describe 'ユーザー認証のテスト' do
      before do
        visit admins_session_path
      end
      context 'トップ画面が表示する' do
        it 'ログインに成功する' do
          fill_in 'admin[email]', with: Faker::Internet.email
          fill_in 'admin[password]', with: 'encrypted_password'
          click_button 'Log in'
          visit admins_path
        end
      end
    end
    describe 'トップ画面' do
      before do
        visit admins_path
      end
      content'ヘッダーから注文履歴一覧へのリンクを押下する'do
        it '注文履歴一覧画面が表示される'do
          click_button '注文履歴一覧'
          visit admins_orders_path
        end
      end
      content'前テストでの注文の詳細表示ボタンを押下する'do
        it '注文詳細画面が表示される'
          visit admins_order_path(order)
          expect(admins_order_path(order)).to eq('/orders/' + order.id.to_s)
        end
      end
    end
    describe '注文詳細画面のテスト' do
      content '注文ステータスを「入金確認」にする'do
        it '注文ステータスが「入金確認」、製作ステータスが「製作待ち」に更新される'do
          put path,params:{status:'入金確認'}
          expect(order.reload.status).not_to eq '入金確認'
          expect(order_items.reload.product_status).not_to eq '製作待ち'
        end
      end
      content '製作ステータスを1つ「製作中」にする'do
        it '注文ステータスが「製作中」に更新される 'do
          put path,params:{produst_status:'製作中'}
          expect(order.reload.status).to eq '製作中'
        end
      end
      content ' '


it '名前が更新される' do
  put path, params: { name: 'new_name!' }
  expect(user.reload.name).not_to eq 'old_name'
end

  