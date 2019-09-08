require 'rails_helper'

describe 'メッセージ機能', type: :system do

  let(:user_a) {FactoryBot.create(:user, name: 'userA', email: 'a@mail.com')}
  let(:user_b) {FactoryBot.create(:user, name: 'userB', email: 'b@mail.com')}
  let!(:conversation_a) {FactoryBot.create(:conversation, sender: user_a, recipient: user_b)}
  let!(:message_a) {FactoryBot.create(:message, body: 'こんばんわ', conversation: conversation_a, user: user_a)}
  let!(:message_b) {FactoryBot.create(:message, body: 'おやすみ', conversation: conversation_a, user: user_a)}


  before do
    visit login_path
    fill_in 'session[email]', with: login_user.email
    fill_in 'session[password]',with: login_user.password
    click_button 'ログイン'
  end

  describe 'メッセージの作成' do

    let(:login_user) {user_a}

    it 'メッセージが作成が成功する' do

      visit user_path(user_b)

      click_link "メッセージする"

      fill_in 'message[body]', with: 'こんにちは'
      click_button 'メッセージを送る'

      expect(page).to have_content 'こんにちは'

    end
  end

  describe '受信メッセージの確認' do

    context 'ユーザーAが送ったメッセージをユーザーBが確認する' do

      let(:login_user) {user_b}

      it 'メッセージが確認できる' do

        visit user_path(user_a)

        click_link 'メッセージする'

        expect(page).to have_content 'こんばんわ'
      end

      it '複数のメッセージが表示されている' do

        visit user_path(user_a)

        click_link 'メッセージする'

        expect(page).to have_content 'こんばんわ'
        expect(page).to have_content 'おやすみ'
      end
    end
  end
end
