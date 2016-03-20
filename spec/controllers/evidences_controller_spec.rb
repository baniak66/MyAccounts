require "rails_helper"

RSpec.describe EvidencesController, :type => :controller do

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
    let(:contractor) { create(:contractor) }
    let(:evidence) { create :evidence, contractor_id: contractor.id}
    it "renders the show template" do
      get :show, { id: evidence.id }
      expect(response).to render_template(:show)
    end

    it "should have matching fields" do
      get :show, { id: evidence.id }
      expect(evidence.number).to eq("1/2016")
      expect(evidence.madedate.strftime("%Y-%m-%d")).to eq("2016-01-01")
      expect(evidence.amount).to eq(100.0)
      expect(evidence.description).to eq("Description")
      expect(evidence.contractor.name).to eq("New Company")
    end
  end

  describe "POST #create" do

    let!(:params) { { evidence: build(:evidence).attributes } }
    subject { post :create, params}

    it "should creates evidence" do
      expect{ subject }.to change(Evidence,:count).by(1)
    end

    it "should display create confirmation notice" do
      subject
      expect(flash[:notice]).to eq 'Evidence was successfully created.'
    end
  end

  describe "GET #edit" do
    let(:contractor) { create :contractor }
    let(:evidence) { create :evidence, contractor_id: contractor.id }
    it "renders the edit template" do
      get :edit, { id: evidence.id, contractor_id: evidence.contractor_id }
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT #update" do
    let(:evidence) { create :evidence }
    let(:params) do
      { id: evidence.id, evidence: { number: "2/2016", madedate: "2016-01-02", amount: 200.0,
        description: "New description" } }
    end

    subject {
      put :update, params
      evidence.reload
    }

    it 'should update evidence' do
      subject
      expect(evidence.number).to eq("2/2016")
      expect(evidence.madedate.strftime("%Y-%m-%d")).to eq("2016-01-02")
      expect(evidence.amount).to eq(200.0)
      expect(evidence.description).to eq("New description")
    end

    it 'should display update confirmation notice' do
      subject
      expect(flash[:notice]).to eq 'Evidence changed.'
    end
  end

  describe "DELETE #destroy" do
    let!(:evidence) { create :evidence }
    subject { delete :destroy, id: evidence.id }

    it 'should delete evidence' do
      expect{ subject }.to change(Evidence, :count).by(-1)
    end

    it 'should display delete confirmation notice' do
      subject
      expect(flash[:notice]).to eq 'Evidence deleted.'
    end

  end

end
