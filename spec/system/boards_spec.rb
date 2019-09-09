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

  describe '一覧' do

    context 'ユーザーAでログインしている時' do
      let(:login_user) {user_a}

      before do
        visit boards_path
      end

      it 'ノートAの編集ボタンが表示される' do
        expect(page).to have_content '編集'
      end

      it 'ノートAの削除ボタンが表示される' do
        expect(page).to have_content '削除'
      end

      it '削除ボタンを押すとノートが削除される' do
        click_link '削除'

        expect(page).to have_content 'ノートが削除されました'
      end

      it 'ノートAの詳細ボタンが表示される' do
        expect(page).to have_content '詳細'
      end
    end

    context 'ユーザーBがログインしている時' do
      let(:login_user) {user_b}

      it 'ノートAの編集が表示されない' do
        expect(page).not_to have_content '編集'
      end

      it 'ノートAのコメントするが表示される' do
        expect(page).to have_content 'コメントする'
      end
    end
  end

  describe '詳細' do
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

  describe '編集' do
    context 'ユーザーAがログインしている時' do
      let(:login_user){user_a}

      before do
        visit edit_board_path(board_a)
      end

      it '編集が成功する' do
        fill_in 'board[title]', with: 'ノートC'
        fill_in 'board[body]', with: 'ノートC変更加えました'
        click_button '投稿する'

        expect(page).to have_content 'ノートが編集されました'
      end
    end
  end
end
