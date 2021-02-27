require 'rails_helper'
describe Article do
  before do
    @article = FactoryBot.build(:article)
  end

  describe 'articleの保存' do
    # 正常系↓
    context "articleが保存できる場合" do
      it "title、top_image、location、memo、weather_id、activity_date、appeal_pointがあればarticleは保存される（1）" do
        expect(@article).to be_valid
      end
      #ファクトリーボットの動作確認↓
      it "title、top_image、location、memo、weather_id、activity_date、appeal_pointがあればarticleは保存される（2）" do
        article = FactoryBot.build(:article)
        article.valid?
      end

      it "title、top_imageだけでもarticleは保存される" do
        article = FactoryBot.build(:article)
        article.location     = ''
        article.memo         = ''
        article.weather_id   = ''
        article.appeal_point = ''
        article.valid?
      end
    end
    # 異常系↓
    context "articleが保存できない場合" do
      it "titleがないとarticleは保存できない" do
        @article.title = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("Titleを入力してください")
      end
      it "top_imageがないとarticleは保存できない" do
        @article.top_image = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("Top imageは必須内容です。")
      end
      it "weather_idがないとarticleは保存できない" do
        @article.weather_id = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("Weatherは数値で入力してください")
      end
    end
  end
end