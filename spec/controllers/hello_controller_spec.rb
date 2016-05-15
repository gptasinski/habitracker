require 'rails_helper'

describe HelloController do

  describe "GET #index" do
    it 'renders the hello#index view' do
      get :index
      expect(response).to render_template(:index)
    end
  end

end