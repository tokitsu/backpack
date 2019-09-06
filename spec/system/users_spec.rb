require 'rails_helper'

describe 'ユーザー機能', type: :system do

  describe '新規ユーザー作成機能' do

    before do
      visit new_user_path
    end

    it '新規ユーザー作成が成功する' do
      fill_in 'user[name]', with 'userA'
      fill_in 'user[email]', with 'example@email.com'
      fill_in 'user[password]',with 'password'
      fill_in 'user[password_confirmation]', with 'password'
      click_button ''
    end
  end
end


















require 'rails_helper'

describe 'ノート管理機能', type: :system do

  let(:user_a) {FactoryBot.create(:user, name: 'userA', email: 'a@mail.com')}
  let(:user_b) {FactoryBot.create(:user, name: 'userB', email: 'b@mail.com')}
  let!(:board_a) {FactoryBot.create(:board, title: 'ノートA', body: '最初の投稿', user:user_a)}

  before do
    visit login_path
    fill_in 'session[email]', with: login_user.email
    fill_in 'session[password]', with: login_user.password
    click_button 'ログイン'
  end

  describe '新規作成' do
    context 'ユーザーAがログインしているとき' do
      let(:login_user) {user_a}

      before do
        visit new_board_path
      end

      it '新規投稿が成功する' do

        fill_in 'board[title]', with: 'ノートB'
        fill_in 'board[body]', with: 'ノートBの内容'
        click_button '投稿する'

        expect(page).to have_content 'ノートが作成されました'

      end

      it 'タイトルが空欄の場合、投稿に失敗する' do
        fill_in 'board[title]', with: ''
        fill_in 'board[body]', with: 'ノートBの内容'
        click_button '投稿する'

        expect(page).to have_content 'タイトルを入力してください'
      end

      it '本文が空欄の場合、投稿に失敗する' do
        fill_in 'board[title]', with: 'ノートB'
        fill_in 'board[body]', with: ''
        click_button '投稿する'

        expect(page).to have_content '本文を入力してください'
      end
    end
  end
