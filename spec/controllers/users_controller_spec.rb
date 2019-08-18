require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #new' do
    before { get :new}

    it 'レスポンスコードが２００であること' do
      expect(response).to have_http_status(:ok)
    end

    it 'newテンプレートがレンダリングされること' do
      expect(response).to render_template :new
    end

    it '新しいuserオブジェクトがビューに渡されること' do
      expect(assigns(:user)).to be_a_new User
    end
  end

  describe 'POST #create' do

    before do
      @referer = 'http://localhost'
      @request.env['HTTP_REFERER'] = @referer
    end

    context '正しいユーザー情報が入ってきた場合' do
      let(:params) do
        { user: {
        name: 'user',
        email: 'mail@com.jp',
        password: 'password',
        password_confirmation: 'password',
        }}
      end

      it 'ユーザーが一人増えていること' do
        expect { post :create, params: params }.to change(User, :count).by(1)
      end

      it 'マイページにリダイレクトされること' do
        expect(post :create, params: params).to redirect_to(user_path(user))
      end
    end

    context 'パラメーターに正しいユーザー名、確認パスワードが含まれていない場合' do
      before do
        post(:create, params: {
        user: {
          name: 'ユーザー１',
          email: 'user@emil.com',
          password: 'password',
          password_confirmation: 'invalid_password'

        }
      })
      end

      it 'レファラーニリダイレクトされること' do
        expect(response).to redirect_to(@referer)
      end


      it 'パスワード確認のエラーメッセージが含まれていること' do
        expect(flash[:error_messages]).to include "パスワード（確認）とパスワードの入力が一致しません"
      end
    end
  end
end
