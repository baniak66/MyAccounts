require "rails_helper"

RSpec.describe Account, :type => :model do

  let! (:account) { create :account, name: "Cash", number: "100", accounttype: "balance", dt_opening: 100.0 }
  let! (:account2) { create :account, name: "Bank", number: "110", accounttype: "balance" }
  let! (:evidence) { create(:evidence) }
  let! (:decree) { create(:decree, amount: 100, evidence_id: evidence.id, account_id: account.id, decreetype: "DT") }
  let! (:decree2) { create(:decree, amount: 100, evidence_id: evidence.id, account_id: account.id, decreetype: "DT") }
  let! (:decree3) { create(:decree, amount: 200, evidence_id: evidence.id, account_id: account.id, decreetype: "CT") }
  let! (:decree4) { create(:decree, amount: 100, evidence_id: evidence.id, account_id: account2.id, decreetype: "DT") }
  let! (:decree5) { create(:decree, amount: 200, evidence_id: evidence.id, account_id: account2.id, decreetype: "CT") }

  describe "#sum_entries" do
    it "sums dt entries" do
      expect(account.sum_entries("DT")).to eq(200)
    end
  end

  describe "#adjust_balance" do
    it "sums DT entries and opening balance" do
      expect(account.adjust_balance("DT")).to eq(300)
    end
    it "sums CT entries and opening balance" do
      expect(account.adjust_balance("CT")).to eq(200)
    end
  end

  describe "#show_balance" do
    it "show DT balance" do
      expect(account.show_balance("DT")).to eq(100)
    end
    it "show CT balance" do
      expect(account.show_balance("CT")).to eq(0)
    end
  end

  describe "#entries_summary" do
    it "sumarize DT entries" do
      expect(account.entries_summary("DT")).to eq(300)
    end
    it "sumarize CT entries" do
      expect(account.entries_summary("CT")).to eq(400)
    end
  end

  describe "#balances_summary" do
    it "sumarize DT balances" do
      expect(account.balances_summary("DT")).to eq(100)
    end
    it "sumarize CT balances" do
      expect(account.balances_summary("CT")).to eq(100)
    end
  end

end
