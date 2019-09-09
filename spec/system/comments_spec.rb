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

  describe 'コメント機能' do
    context 'ユーザーBがログインしている時' do
      let(:login_user){user_b}

      before do
        visit board_path(board_a)
      end

      it 'コメント投稿が成功する' do

        fill_in 'comment[comment]', with: 'コメントA'

        click_button 'コメントする', remote: true

        expect(page).to have_content 'コメントA'
      end

      it 'コメントを削除する' do
        fill_in 'comment[comment]', with: 'コメントA'

        click_button 'コメントする'

        click_link '削除', local: false

        expect(page).not_to have_content 'コメントA'
      end
    end
  end
end
