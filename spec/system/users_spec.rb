require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができる時' do
    it '正しい情報を入力するとユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページに新規登録ページに遷移するボタンがある
      expect(page).to have_content('新規登録')
      # 新規登録ページに移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'user[nickname]', with: @user.nickname
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      fill_in 'user[password_confirmation]', with: @user.password_confirmation
      # 登録するボタンを押すとユーザーモデルのカウントが1上がる
      expect do
        find('input[name="commit"]').click
      end.to change { User.count }.by(1)
      # トップページに遷移する
      expect(current_path).to eq(root_path)
      # 新規登録とログインボタンは表示されない
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
      # ログアウトボタンとマイページボタンが表示されている
      expect(page).to have_content('ログアウト')
      expect(page).to have_content('マイページ')
    end
  end
  context 'ユーザー新規登録ができない時' do
    it '必須項目を入力しないとユーザー新規登録ができず新規登録画面に戻ってくる' do
      # トップページに移動する
      visit root_path
      # トップページに新規登録ページに遷移するボタンがある
      expect(page).to have_content('新規登録')
      # 新規登録ページに遷移する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'user[nickname]', with: ''
      fill_in 'user[email]', with: ''
      fill_in 'user[password]', with: ''
      fill_in 'user[password_confirmation]', with: ''
      # 登録するボタンを押してもユーザーモデルのカウントは上がらない
      expect do
        find('input[name="commit"]').click
      end.to change { User.count }.by(0)
      # 新規登録ページに戻される
      expect(current_path).to eq '/users'
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'ログインができる時' do
    it '保存されているユーザーの情報と合致すればログインできる' do
      # トップページに移動する
      visit root_path
      # トップページにログインボタンがある
      expect(page).to have_content('ログイン')
      # ログインページへ遷移する
      visit new_user_session_path
      # 正しいユーザー情報を入力する
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      # ログインするボタンを押す
      find('input[name = "commit"]').click
      # トップページに遷移する
      expect(current_path).to eq(root_path)
      # ログアウトボタンとマイページボタンが表示される
      expect(page).to have_content('ログアウト')
      expect(page).to have_content('マイページ')
      # 新規登録ボタンとログインボタンは表示されない
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end
  context 'ログインができない時' do
    it '保存されているユーザーの情報と合致しないとログインできない' do
      # トップページ移動する
      visit root_path
      # トップページにログインボタンがある
      expect(page).to have_content('ログイン')
      # ログインページへ遷移する
      visit new_user_session_path
      # 誤ったユーザー情報を入力する
      fill_in 'user[email]', with: ''
      fill_in 'user[password]', with: ''
      # ログインするボタンを押す
      find('input[name="commit"]').click
      # ログインページに戻される
      expect(current_path).to eq new_user_session_path
    end
  end
end
