require "rails_helper"

RSpec.feature "Contractor managment", :type => :feature do

  scenario "User creates a new contractor" do
    visit contractors_path
    click_link "Add contractor"
    fill_in "Name", with: "Company name"
    fill_in "Address", with: "Warsaw"
    fill_in "Nip", with: "1112223344"
    click_button "Save"
    expect(page).to have_text("Contractor was successfully created.")
    expect(page).to have_text("Company name")
    expect(page).to have_text("Warsaw")
    expect(page).to have_text("1112223344")
  end

  given!(:contractor) { create :contractor, name: "Company name", address: "Wroclaw", nip: "1234567890" }

  scenario "User show contractor details" do
    visit contractors_path
    click_link "Show"
    expect(page).to have_text("Company name")
    expect(page).to have_text("Wroclaw")
    expect(page).to have_text("1234567890")
  end

  scenario "User edit contractor details" do
    visit contractors_path
    click_link "Edit"
    fill_in "Name", with: "New Company name"
    fill_in "Address", with: "Warsaw"
    fill_in "Nip", with: "0987654321"
    click_button "Save"
    expect(page).to have_text("New Company name")
    expect(page).to have_text("Warsaw")
    expect(page).to have_text("0987654321")
  end

  scenario "User delete company" do
    visit contractors_path
    expect(page).to have_text("Company name")
    expect(page).to have_text("Wroclaw")
    expect(page).to have_text("1234567890")
    click_link "Delete"
    expect(page).to have_text("Contractor deleted.")
    expect(page).to have_no_text("Company name")
    expect(page).to have_no_text("Wroclaw")
    expect(page).to have_no_text("1234567890")
  end
end
