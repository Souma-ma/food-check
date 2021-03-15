require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it 'nicknameとemailとpasswordとpassword_confirmationが存在すれば登録できる' do
      end
      it 'passwordとpassword_confirmationが半角英数混合かつ6文字以上であれば登録できる' do
      end
    end
    context '新規登録できない時' do
      it 'nicknameが空では登録できない' do
      end
      it 'emailが空では登録できない' do
      end
      it 'emailに@がなければ登録できない' do
      end
      it '重複するemailは登録できない' do
      end
      it 'passwordが空では登録できない' do
      end
      it 'passwordが半角英数でなければ登録できない' do
      end
      it 'passwordが5文字以下では登録できない' do
      end
      it 'passwordが全角では登録できない' do
      end
      it 'password_confirmationが空では登録できない' do
      end
      it 'passwordとpassword_confirmationの値が一致しないと登録できない' do
      end
    end
  end
end
