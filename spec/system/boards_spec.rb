require 'rails_helper'

describe 'ノート管理機能', type: :system do

  let(:user_a) {FactoryBot.create(:user, name: 'userA', email: 'a@mail.com')}
  let(:user_b) {FactoryBot.create(:user, name: 'userB', email: 'b@mail.com')}
  let!(:board_a) {FactoryBot.create(:board, title: '最初のタスク', body: '最初の投稿', user:user_a)}

  before do
    visit login_path
    fill_in 'session[email]', with: login_user.email
    fill_in 'session[password]', with: login_user.password
    click_button 'ログイン'
  end

  describe '一覧機能' do

    context 'ユーザーAでログインしている時' do
      let(:login_user) {user_a}
      before do
        visit boards_path
      end

      it 'ユーザーAが作成したボードが表示される' do
        expect(page).to have_content '編集'
      end
    end

    context 'ユーザーBがログインしている時' do
      let(:login_user) {user_b}

      it '投稿の編集、削除が表示されない' do
        expect(page).to have_content 'コメントする'
      end
    end
  end

  describe '詳細機能' do
    context 'ユーザーAがログインしている時' do
      let(:login_user) {user_a}

      before do
        visit board_path(board_a)
      end

      it 'ユーザーAが作成したタスク詳細を表示する' do
        expect(page).to have_content '最初の投稿'
      end
    end
  end


end
