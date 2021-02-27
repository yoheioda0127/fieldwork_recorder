require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'userの登録' do
    # 正常系↓
    context "userが登録できる場合" do
      it "name、email、password、password_confirmation、research_theme、introduction、avatarがあればuserは登録される（1）" do
        expect(@user).to be_valid
      end
      #ファクトリーボットの動作確認↓
      it "name、email、password、password_confirmation、research_theme、introduction、avatarがあればuserは登録される（2）" do
        user = FactoryBot.build(:user)
        user.valid?
      end

      it "name、email、password、password_confirmationだけでもuserは登録される" do
        user = FactoryBot.build(:user)
        user.research_theme   = ''
        user.introduction     = ''
        user.avatar           = ''
        user.valid?
      end
    end
    # 異常系↓
    context "userが登録できない場合" do
      it "nameがないとuserは登録できない" do
        user = FactoryBot.build(:user)
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nameは必須内容です。")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません")
      end
      it "major_idがないとuserは登録できない" do
        user = FactoryBot.build(:user)
        @user.major_id = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Majorは必須内容です。")
      end
      it "research_themeが61文字だとuserは保存できない" do
        user = FactoryBot.build(:user)
        @user.research_theme = 'あああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Research themeは60文字以内です。")
      end
      it "introductionが151文字だとuserは保存できない" do
        user = FactoryBot.build(:user)
        @user.introduction = 'あああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Introductionは150文字以内です。")
      end
    end
  end
end