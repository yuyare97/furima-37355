require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができる場合' do
      it "nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it 'emailが＠を含んでいれば登録できる' do
        @user.email = 'test@example'
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上、英数混合、password_confirmationが同じであれば登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
      it 'last_nameが漢字orひらがなorカタカナなら登録できる' do
        @user.last_name = '青山'
        expect(@user).to be_valid
      end
      it 'first_nameが漢字orひらがなorカタカナなら登録できる' do
        @user.first_name = '太郎'
        expect(@user).to be_valid
      end
      it 'last_name_kanaがカタカナなら登録できる' do
        @user.last_name_kana = 'アオヤマ'
        expect(@user).to be_valid
      end
      it 'first_name_kanaがカタカナなら登録できる' do
        @user.first_name_kana = 'タロウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録ができない場合' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailが＠が含まれていなければ登録できない' do
        @user.email = 'test.example'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字以下だと登録できない' do
        @user.password = '11aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが英数混ざっていなければ登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが漢字orひらがなorカタカナ以外だと登録できない' do
        @user.last_name = 'Aoyama'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが漢字orひらがなorカタカナ以外だと登録できない' do
        @user.first_name = 'Tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'last_name_kanaがカタカナ以外だと登録できない' do
        @user.last_name_kana = 'あおやま'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaがカタカナ以外だと登録できない' do
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end