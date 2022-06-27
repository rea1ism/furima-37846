require 'rails_helper'

def basic_pass(path)
  username = ENV["BASIC_AUTH_USER"]
  password = ENV["BASIC_AUTH_PASSWORD"]
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe "Items", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  describe '商品投稿' do
    context '商品投稿できないとき' do
      it 'すべての項目がブランクでは投稿できず、エラーメッセージが表示される' do
        #basic認証通過
        basic_pass root_path
        # ログインする
        visit new_user_session_path
        fill_in 'email', with: @user.email
        fill_in 'password', with: @user.password
        find('input[name="commit"]').click
        # 出品ページへアクセス
        visit new_item_path
        # 出品ボタンをクリック
        find('input[name="commit"]').click
        # 遷移後のページがnew_item_pathであることを検証
        expect(current_path).to eq(items_path)
        binding.pry
        # エラーメッセージが表示されているかどうか検証
      end
    end
  end
end
