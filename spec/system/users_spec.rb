# require 'rails_helper'

# def basic_pass(path)
#   username = ENV["BASIC_AUTH_USER"]
#   password = ENV["BASIC_AUTH_PASSWORD"]
#   visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
# end

# RSpec.describe "トップページの表示テスト", type: :system do
#   it 'ログアウト状態の場合には、トップページ（商品一覧ページ）のヘッダーに、「新規登録」「ログイン」ボタンが表示される' do
#     # Basic認証通過
#     basic_pass root_path
#     # トップページへアクセス
#     visit root_path
#     # 検証
#     expect(page).to have_content('新規登録')
#     expect(page).to have_content('ログイン')
#   end
# end

# RSpec.describe "新規登録", type: :system do
#   before do
#     @user = FactoryBot.build(:user)
#   end

#   context 'ユーザー新規登録ができるとき' do
#     it 'トップページ（商品一覧ページ）の「新規登録」をクリックし、必要事項を入力すると新規登録ができ、トップページに遷移した後ユーザー名とログアウトボタンが表示されている' do
#       # Basic認証通過
#       basic_pass root_path
#       # トップページへアクセス
#       visit root_path
#       # 検証
#       expect(page).to have_content('新規登録')
#       # 新規登録ボタンのクリック
#       click_link '新規登録'
#       # ページ遷移検証
#       expect(current_path).to eq(new_user_session_path)
#       # 必要事項の入力
#       fill_in 'nickname', with: @user.nickname
#       fill_in 'email', with: @user.email
#       fill_in 'password', with: @user.password
#       fill_in 'password_confirmation', with: @user.password
#       fill_in 'familyname_kanji', with: @user.familyname_kanji
#       fill_in 'firstname_kanji', with: @user.firstname_kanji
#       # 新規登録検証

#       # ログアウトボタンのクリック

#       # ログアウト検証

#     end
#   end

#   context 'ユーザー登録できないとき' do
#     it 'ログイン状態の場合には、トップページ（商品一覧ページ）のヘッダーに、「ユーザーのニックネーム」と「ログアウト」ボタンが表示される' do
#       # 新規ユーザー情報を保存
#       @user.save
#       # Basic認証通過
#       basic_pass root_path
#       # トップページへアクセス
#       visit root_path
#       # ログインボタンがあることを確認
#       expect(page).to have_content('ログイン')
#       # ログインページに遷移
#       visit new_user_session_path
#       # 入力項目を入力
#       fill_in 'email', with: @user.email
#       fill_in 'password', with: @user.password
#       # ログインボタンをクリック
#       find('input[name="commit"]').click
#       # 検証
#       expect(current_path).to eq(root_path)
#       expect(page).to have_content(@user.nickname)
#       expect(page).to have_content('ログアウト')
#       # ログアウトボタンを押す
#       click_link 'ログアウト'
#       # ログアウトできている
#       # 書き込む
#     end
#   end
# end

# RSpec.describe "ログイン", type: :system do
#   before do
#     @user = FactoryBot.build(:user)
#   end
# end
