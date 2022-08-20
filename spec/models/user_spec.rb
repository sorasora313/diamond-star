require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全ての情報を正しく入力すれば登録できる' do
        expect(@user).to be_valid
       end
        
    end
      

    context '新規登録がうまくかないとき' do
      it 'nameが空だと登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
    
      it 'nameがすでに登録されているものと重複する場合は、登録できない' do
       @user.save
       another_user = FactoryBot.build(:user)
       another_user.name = @user.name
       another_user.valid?
       expect(another_user.errors.full_messages).to include('Name has already been taken')

      end

      it "emailが空だと保存できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
        
      end

      it "emailに@が含まれていない場合登録できない" do
        @user.email = 'yyy.om'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")

      end

      it 'emailがすでに登録されているものと重複していると保存できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'パスワードが空欄だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワード（確認含む）が5文字以下だと登録できない' do
        @user.password = 'ab123'
        @user.password_confirmation = 'ab123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワード（確認含む）が半角英数字でないと登録できない' do
        @user.password = '11111'
        @user.password_confirmation = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include( "Password is invalid")
      end
      it 'パスワード（確認含む）が英字のみだと登録できない' do
        @user.password = 'AAAAAA'
        @user.password_confirmation = 'AAAAAA'
        @user.valid?
        expect(@user.errors.full_messages).to include( "Password is invalid")
      end
      it 'パスワード（確認含む）が数字のみと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワード（確認含む）が全角英数字だと登録できない' do
        @user.password = 'sty１２３'
        @user.password_confirmation = 'sty１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'パスワード（確認）が空欄だと登録できない' do
        @user.password = '123abc'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  
      end

      it 'プロフィール空だと保存できない' do
        @user.profile = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Profile can't be blank")
      end
    end

  end
end
