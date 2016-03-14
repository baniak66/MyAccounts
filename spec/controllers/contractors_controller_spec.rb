require "rails_helper"

RSpec.describe ContractorsController, :type => :controller do

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
    let(:contractor) { create :contractor, name: "name", address: "address", nip: "1234567890"}
    it "renders the show template" do
      get :show, { id: contractor.id }
      expect(response).to render_template(:show)
    end

    it "should have matching fields" do
      get :show, { id: contractor.id }
      expect(contractor.name).to eq("name")
      expect(contractor.address).to eq("address")
      expect(contractor.nip).to eq("1234567890")
    end
  end

  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do

    let!(:params) { { contractor: build(:contractor).attributes } }
    subject { post :create, params}

    it "should creates contractor" do
      expect{ subject }.to change(Contractor,:count).by(1)
    end

    it "should display create confirmation notice" do
      subject
      expect(flash[:notice]).to eq 'Contractor was successfully created.'
    end
  end

  describe "GET #edit" do
    let(:contractor) { create :contractor }
    it "renders the edit template" do
      get :edit, { id: contractor.id }
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT #update" do
    let(:contractor) { create :contractor, name: "name", address: "address", nip: "1234567890" }
    let(:params) do
      { id: contractor.id, contractor: { name: "name 2", address: "address 2", nip: "0987654321" } }
    end

    subject {
      put :update, params
      contractor.reload
    }

    it 'should update contractor' do
      subject
      expect(contractor.name).to eq("name 2")
      expect(contractor.address).to eq("address 2")
      expect(contractor.nip).to eq("0987654321")
    end

    it 'should display update confirmation notice' do
      subject
      expect(flash[:notice]).to eq 'Contractor was successfully updated.'
    end
  end

  describe "DELETE #destroy" do
    let!(:contractor) { create :contractor }
    subject { delete :destroy, id: contractor.id }

    it 'should delete contractor' do
      expect{ subject }.to change(Contractor, :count).by(-1)
    end

    it 'should display delete confirmation notice' do
      subject
      expect(flash[:notice]).to eq 'Contractor deleted.'
    end

  end

end
