require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全ての情報を正しく入力すれば登録できる' do

       end
        
    end
      

    context '新規登録がうまくかないとき' do
      it 'nameが空だと登録できない' do

      end
    end

  end
end