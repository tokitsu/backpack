require 'rails_helper'

describe 'メッセージ機能', type: :system do

  let(:user_a) {FactoryBot.create(:user, name: 'userA', email: 'a@mail.com')}
  let(:user_b) {FactoryBot.create(:user, name: 'userB', email: 'b@mail.com')}

  before do
    visit login_path
    fill_in 'session[email]', with: login_user.email
    fill_in 'session[password]',with: login_user.password
    click_button 'ログイン'
  end

  describe 'メッセージの新規作成' do

    let(:login_user) {user_a}

    it 'メッセージが作成される' do

      visit conversations_path(sender_id: user_a.id, recipient_id: user_b.id)

      fill_in 'message[body]', with: 'こんにちは'
      click_button 'メッセージを送る'

      expect(page).to have_content 'こんにちは。'

    end
  end
end
