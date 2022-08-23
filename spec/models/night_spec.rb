require 'rails_helper'

RSpec.describe Night, type: :model do
  before do
    @night = FactoryBot.build(:night)
  end

  describe '新規投稿' do

    context '新規投稿できる場合' do
      it 'すべての項目が正しく入力できれば投稿ができる'do
      expect(@night).to be_valid
      end

    end

    context '新規投稿できない場合' do
      

      it 'タイトルが空だと保存できない'do
        @night.title = ''
        @night.valid?
        expect(@night.errors.full_messages).to include("Title can't be blank")

      end

      it '説明が空だと保存できない' do
        @night.explain = ''
        @night.valid?
        expect(@night.errors.full_messages).to include("Explain can't be blank")
      end
      it '画像が空だと保存できない' do
        @night.image = nil
        sleep(1)
        @night.valid?
        expect(@night.errors.full_messages).to include("Image can't be blank")
      end
      it '地域の選択が必要である' do
        @night.state_id = nil
        @night.valid?
        expect(@night.errors.full_messages).to include("State is not a number")
      end
      it "ジャンルの選択が必要である" do
        @night.genre_id = nil
        @night.valid?
        expect(@night.errors.full_messages).to include("Genre is not a number")
      end

      # it 'ユーザー登録している人でないと投稿できない' do
      #   @night.user_id = nil
      #   @night.valid?
      #   expect(@night.errors.full_messages).to include("Night can't be blank")
      # end
  
    end
  end
end
