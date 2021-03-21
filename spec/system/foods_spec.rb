require 'rails_helper'

RSpec.describe "Foods", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @food = FactoryBot.build(:food)
  end

context '食材投稿できるとき' do
  it 'ログインした管理者は食材投稿できる' do
  # ログインする
    sign_in(@user)
  # トップページに食材投稿ボタンがある
    expect(page).to have_content('食材投稿')
  # 食材投稿ページに遷移する
    visit new_food_path
  # 添付する画像を定義
    image_path = Rails.root.join('public/images/test.jpg')
    attach_file('food[image]', image_path, make_visible: true)
  # 食材情報を入力する
    fill_in 'food_name', with: @food.name
    fill_in 'food_calorie', with: @food.calorie
    fill_in 'food_protein', with: @food.protein
    fill_in 'food_fat', with: @food.fat
    fill_in 'food_carbohydrate', with: @food.carbohydrate
  # 保存ボタンを押すとfoodモデルのカウントが1上がる
    expect {
        find('input[name="commit"]').click
    }.to change { Food.count }.by(1)
  # トップページに遷移する
    expect(current_path).to eq "/"
  # トップページに投稿した食材の画像がある
    expect(page).to have_selector("img")
  # トップページに投稿した食材の情報がある
    expect(page).to have_content(@food.name)
    expect(page).to have_content(@food.calorie)
    expect(page).to have_content(@food.protein)
    expect(page).to have_content(@food.fat)
    expect(page).to have_content(@food.carbohydrate)
  end
end
    

context '食材投稿できないとき' do
  it 'ログインした管理者でも正しい情報を入力しないと投稿できない' do
  # ログインする
    sign_in(@user)
  # トップページに食材投稿ボタンがある
    expect(page).to have_content('食材投稿')
  # 食材投稿ページに遷移する
    visit new_food_path
  # 食材情報を入力する
    fill_in 'food_name', with: ""
    fill_in 'food_calorie', with: ""
    fill_in 'food_protein', with: ""
    fill_in 'food_fat', with: ""
    fill_in 'food_carbohydrate', with: ""
  # 保存ボタンを押してもfoodモデルのカウントは上がらない
    expect {
      find('input[name="commit"]').click
    }.to change { Food.count }.by(0)
  # 食材投稿ページに戻される
    expect(current_path).to eq "/foods"
  end
 end
end

RSpec.describe "Foods", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @food = FactoryBot.create(:food)
  end

  context '食材削除できるとき' do
    it 'ログインした管理者は投稿した食材を削除できる' do
    # ログインする
      sign_in(@user)
    # トップページに遷移する
      visit root_path
    # 投稿した食材詳細ページに遷移する
      visit food_path(@food.id)
    # 削除ボタンがあることを確認する
      expect(page).to have_link '削除', href: food_path(@food)
    # 食材を削除するとfoodモデルのカウントが1減ることを確認する
      expect {
        find_link("削除", href: food_path(@food)).click
      }.to change { Food.count }.by(-1)
    # トップページに遷移する
      expect(current_path).to eq "/"
    # 削除した食材がないことを確認する
      expect(page).to have_no_content(@food)
    end   
  end
  
  context '食材編集できるとき' do
    it 'ログインした管理者は投稿した食材を編集できる' do
     # ログインする
      sign_in(@user)
     # 食材詳細ページに遷移する
      visit food_path(@food.id)
     # 編集ボタンがあることを確認する
      expect(page).to have_link '編集', href: edit_food_path(@food)
     # 食材編集ページに遷移する
      visit edit_food_path(@food)
     # 食材情報を編集する
      fill_in 'food_name', with: @food.name + "です"
      fill_in 'food_calorie', with: @food.calorie + 10
      fill_in 'food_protein', with: @food.protein + 1
     # 編集してもfoodモデルのカウントは変わらないことを確認する
      expect {
       find('input[name="commit"]').click
      }.to change { Food.count }.by(0)
     # トップページに遷移する
      visit root_path
    # トップページ編集した食材が存在する
      expect(page).to have_selector("img")
      expect(page).to have_content(@food.name + "です")
      expect(page).to have_content(@food.calorie + 10)
      expect(page).to have_content(@food.protein + 1)
    end
  it 'ログインした管理者が投稿した食材を編集できない場合' do
    # ログインする
      sign_in(@user)
    #食材詳細ページに遷移する
      visit food_path(@food.id)
    #編集ボタンがあることを確認する
      expect(page).to have_link '編集', href: edit_food_path(@food) 
    #食材編集ページに遷移する
      visit edit_food_path(@food)
    #食材情報を編集する
      fill_in 'food_name', with: ""
    #編集ボタンを押してもfoodモデルのカウントが上がらない
      expect {
        find('input[name="commit"]').click
      }.to change { Food.count }.by(0)
    #食材内容に保存できない内容があると編集できずに編集ページに戻される
      expect(current_path).to eq "/foods/#{@food.id}"
    end
  end
end