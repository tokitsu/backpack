require 'rails_helper'

describe 'ノートのコメント管理機能', type: :system do

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
    context 'ユーザーBがログインしている時' do
      let(:login_user){user_b}

      before do
        visit boards_path
      end

      it 'お気に入りに追加する' do
        click_link 'お気に入り！'

        expect(page).to have_content 'お気に入りをはずす'
      end

      it 'お気に入りを削除する' do
        click_link 'お気に入り！'

        click_link 'お気に入りをはずす'

        expect(page).to have_content 'お気に入り！'

      end

      it 'お気に入りページに追加されている' do
        click_link 'お気に入り！'

        visit favorites_path

        expect(page).to have_content 'ノートA'
      end
    end
  end
end
