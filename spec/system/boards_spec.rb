require 'rails_helper'

describe 'ノート機能', type: :system do
  describe '一覧機能' do
    before do
      user_a = FactoryBot.create(:user, name:'ユーザーA', email: 'a@example.com')
      FactoryBot.create(:board, title: '最初の投稿', user:user_a)
    end
    context 'ユーザーAでログインしている時' do
      before do
        visit login_path
        fill_in 'メールアドレス', with: 'a@example.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログインする'
      end

      it 'ユーザーAが作成したボードが表示される' do
        expect(page).to have_content '最初の投稿'
      end
    end
  end
end
