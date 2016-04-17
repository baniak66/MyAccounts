require "rails_helper"

RSpec.describe AccountsController, :type => :controller do

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    let(:account) { create(:account) }
    it "renders the show template" do
      get :show, { id: account.id }
      expect(response).to render_template(:show)
    end

    it "should have matching fields" do
      get :show, { id: account.id }
      expect(account.number).to eq("100")
      expect(account.accounttype).to eq("balance")
      expect(account.name).to eq("cash")
    end
  end

  describe "POST #create" do

    let!(:params) do
      { account: { name: "Cash", number: "100" }, accounttype: "balance" }
    end
    subject { post :create, params}

    it "should creates account" do
      expect{ subject }.to change(Account,:count).by(1)
    end

    it "should display create confirmation notice" do
      subject
      expect(flash[:notice]).to eq 'Account was successfully created.'
    end
  end

end
