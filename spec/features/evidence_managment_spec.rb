require "rails_helper"

RSpec.feature "Evidence managment", :type => :feature do

  given!(:evidence) { create :evidence, contractor_id: contractor.id }
  given!(:contractor) { create :contractor, name: "Name", address: "City", nip: "1234567890"}


  scenario "User successfully creates a new evidence" do
    visit evidences_path
    within("#tab1.tab-pane") do
      fill_in "evidence_number", with: "01/2016"
      fill_in "evidence_madedate", with: "01-01-2016"
      fill_in "evidence_amount", with: 100.0
      fill_in "evidence_description", with: "Description"
      select('Name, City, NIP: 1234567890', from: 'evidence_contractor_id')
      click_on "Save"
    end
    expect(page).to have_text("Evidence was successfully created.")
    expect(page).to have_text("Number: 01/2016")
    expect(page).to have_text("Date: 2016-01-01")
    expect(page).to have_text("Amount: 100.0")
    expect(page).to have_text("Description: Description")
    expect(page).to have_text("Contractor: Name")
  end

  scenario "User unsuccessfully creates a new evidence" do
    visit evidences_path
    within("#tab1.tab-pane") do
      click_on "Save"
    end
    expect(page).to have_text("4 errors")
  end

  scenario "User successfully creates a new evidence and new contractor" do
    visit evidences_path
    within("#tab2.tab-pane") do
      fill_in "contractor_evidences_attributes_0_number", with: "01/2016"
      fill_in "contractor_evidences_attributes_0_madedate", with: "01-01-2016"
      fill_in "contractor_evidences_attributes_0_amount", with: 100.0
      fill_in "contractor_evidences_attributes_0_description", with: "Description"
      fill_in "contractor_name", with: "Company name"
      fill_in "contractor_address", with: "Old town"
      fill_in "contractor_nip", with: "9990002211"
      click_on "Save"
    end
    expect(page).to have_text("Evidence was successfully created.")
    expect(page).to have_text("Number: 01/2016")
    expect(page).to have_text("Date: 2016-01-01")
    expect(page).to have_text("Amount: 100.0")
    expect(page).to have_text("Description: Description")
    expect(page).to have_text("Contractor: Company name")
  end

  scenario "User unsuccessfully creates a new evidence" do
    visit evidences_path
    within("#tab2.tab-pane") do
      click_on "Save"
    end
    expect(page).to have_text("7 errors")
  end


  scenario "User displays evidence details" do
    visit evidences_path
    click_on "Show"
    expect(page).to have_text("1/2016")
    expect(page).to have_text("Date: 2016-01-01")
    expect(page).to have_text("Amount: 100.0")
    expect(page).to have_text("Description: Description")
    expect(page).to have_text("Contractor: Name")
  end

  scenario "User edit evidence details" do
    visit evidences_path
    click_on "Show"
    expect(page).to have_text("1/2016")
    click_on "Edit"
    fill_in "evidence_number", with: "02/2016"
    fill_in "evidence_madedate", with: "02-01-2016"
    fill_in "evidence_amount", with: 200.0
    fill_in "evidence_description", with: "Changed Description"
    click_on "Save"
    expect(page).to have_text("Evidence changed.")
    expect(page).to have_text("2/2016")
    expect(page).to have_text("Date: 2016-01-02")
    expect(page).to have_text("Amount: 200.0")
    expect(page).to have_text("Description: Changed Description")
  end

  scenario "User delete evidence" do
    visit evidences_path
    click_on "Show"
    expect(page).to have_text("1/2016")
    click_on "Delete"
    expect(page).to have_text("Evidence deleted.")
    expect(page).to have_no_text("1/2016")
  end

  scenario "User delete evidence with decree" do
    account = create(:account)
    decree = create(:decree, evidence_id: evidence.id, account_id: account.id)

    visit evidences_path
    click_on "Show"
    expect(page).to have_text("1/2016")
    click_on "Delete"
    expect(page).to have_text("Evidence has decrees, so You can not delete it.")
    expect(page).to have_text("1/2016")
    expect(page).to have_no_text("Evidence deleted.")
  end

end
