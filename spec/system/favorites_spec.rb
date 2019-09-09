require 'rails_helper'

describe 'お気に入り機能', type: :system do

  let(:user_a) {FactoryBot.create(:user, name: 'userA', email: 'a@mail.com')}
  let(:user_b) {FactoryBot.create(:user, name: 'userB', email: 'b@mail.com')}
  let!(:board_a) {FactoryBot.create(:board, title: 'ノートA', body: '最初の投稿', user:user_a)}

  before do
    visit login_path
    fill_in 'session[email]', with: login_user.email
    fill_in 'session[password]', with: login_user.password
    click_button 'ログイン'
  end

  describe 'お気に入り機能' do
    context 'ユーザーBがログインしているとき' do
      let(:login_user) {user_b}

      before do
        visit board_path(board_a)
      end

      it 'お気に入りを追加する' do

        click_link 'お気に入り！', js: true

        expect(page).to have_content 'お気に入りをはずす'

      end
    end
  end
end
