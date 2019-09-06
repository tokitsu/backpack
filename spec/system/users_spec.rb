require 'rails_helper'

describe 'ユーザー機能', type: :system do

  let(:user_a) {FactoryBot.create(:user, name: 'userA', email: 'a@mail.com')}

  describe '新規ユーザー作成機能' do

    before do
      visit new_user_path
    end

    it '新規ユーザー作成が成功する' do
      fill_in 'user[name]', with: 'userA'
      fill_in 'user[email]', with: 'example@email.com'
      fill_in 'user[password]',with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      click_button '新規作成'

      expect(page).to have_content 'ユーザー登録が完了しました！！'
    end

    it 'ユーザー名が空のため、ユーザー作成が失敗する' do
      fill_in 'user[name]', with: ''
      fill_in 'user[email]', with: 'example@email.com'
      fill_in 'user[password]',with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      click_button '新規作成'

      expect(page).to have_content 'ユーザー名を入力してください'
    end

    it 'メールアドレスが空のため、ユーザー作成が失敗する' do
      fill_in 'user[name]', with: 'userA'
      fill_in 'user[email]', with: ''
      fill_in 'user[password]',with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      click_button '新規作成'

      expect(page).to have_content 'メールアドレスを入力してください'
    end

    it 'パスワードとパスワードコンファメーションが一致しないため、ユーザー作成が失敗する' do
      fill_in 'user[name]', with: 'userA'
      fill_in 'user[email]', with: 'example@email.com'
      fill_in 'user[password]',with: 'ppssword'
      fill_in 'user[password_confirmation]', with: 'password'
      click_button '新規作成'

      expect(page).to have_content 'パスワード（確認）とパスワードの入力が一致しません'
    end

    it 'パスワードが８文字以下の場合、ユーザー作成に失敗する' do
      fill_in 'user[name]', with: 'userA'
      fill_in 'user[email]', with: 'example@email.com'
      fill_in 'user[password]',with: 'pass'
      fill_in 'user[password_confirmation]', with: 'pass'
      click_button '新規作成'

      expect(page).to have_content 'パスワードは8文字以上で入力してください'
    end
  end

  describe 'ログイン機能' do


    before do
      visit login_path
    end

    it 'ログインが成功する。' do
      fill_in 'session[email]', with: login_user.email
      fill_in 'session[password]', with: login_user.password
      click_button 'ログイン'

      expect(page).to have_content 'ログインしました！'
    end
  end
end
