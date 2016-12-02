require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  subject { response }

  describe '#new' do
    before { get :new }

    it 'be success' do
      is_expected.to be_succes
    end

    it 'render template' do
      is_expected.to render_template('new')
    end

    it 'assign user' do
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe '#create' do
    before { post :create, user: user }

    context 'valid data' do
      let(:user) { FactoryGirl.attributes_for(:user) }

      it 'be created' do
        expect(User.last.email).to eq('somemail@mail.com')
      end

      it 'be found' do
        is_expected.to have_http_status :redirect
      end

      it 'redirect_to user profile' do
        is_expected.to redirect_to(root_path)
      end

      it 'has session' do
        expect(session[:current_user_id]).to be_eql(User.last.token)
      end
    end

    context 'invalid data' do
      let(:user) { FactoryGirl.attributes_for(:user, email: '') }

      it 'render template' do
        is_expected.to render_template('new')
      end
    end
  end
end
