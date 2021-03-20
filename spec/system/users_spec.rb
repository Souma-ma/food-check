require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができる時' do
    it '正しい情報を入力するとユーザー新規登録ができてトップページに移動する' do
      
    end
  end
  context 'ユーザー新規登録ができない時' do
    it '必須項目を入力しないとユーザー新規登録ができず新規登録画面に戻ってくる' do
      
    end
  end
end

RSpec.describe "ログイン", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ログインができる時' do
    it '保存されているユーザーの情報と合致すればログインできる' do
      
    end
  end
  context 'ログインができない時' do
    it '保存されているユーザーの情報と合致しないとログインできない' do
      
    end
  end
end