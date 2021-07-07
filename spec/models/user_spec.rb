require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    context '登録成功のとき' do
      it '全ての値が正常' do
        @user.valid?
        expect(@user).to be_valid
      end
    end
    context '登録失敗のとき' do
      it 'ユーザー名が空' do
        @user.nick_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ユーザー名を入力してください")
      end
      it 'ユーザーIDが空' do
        @user.user_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ユーザーIDを入力してください")
      end
      it 'ユーザーIDが既に使われている' do
        @user.save
        new_user = FactoryBot.build(:user)
        new_user.user_name = @user.user_name
        new_user.valid?
        expect(new_user.errors.full_messages).to include("ユーザーIDはすでに存在します")
      end
      it 'ユーザーIDに全角がある' do
        @user.user_name = "zenkaku０１"
        @user.valid?
        expect(@user.errors.full_messages).to include("ユーザーIDが正しくありません")
      end
      it 'ユーザーIDがアルフファベットだけ' do
        @user.user_name = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("ユーザーIDが正しくありません")
      end
      it 'ユーザーIDが数字だけ' do
        @user.user_name = "1234567890"
        @user.valid?
        expect(@user.errors.full_messages).to include("ユーザーIDが正しくありません")
      end
      it 'ユーザーIDが３文字以下' do
        @user.user_name = "a12"
        @user.valid?
        expect(@user.errors.full_messages).to include("ユーザーIDが正しくありません")
      end
      it 'ユーザーIDが１７文字以上' do
        @user.user_name = "1234567890abcdefgh"
        @user.valid?
        expect(@user.errors.full_messages).to include("ユーザーIDが正しくありません")
      end
      it 'パスワードが空' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'パスワードとパスワード確認が一致しない' do
        @user.password_confirmation = "password01"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'パスワードが５文字以下' do
        password = "1234"
        @user.password = password
        @user.password_confirmation = password
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
    end
  end
end
