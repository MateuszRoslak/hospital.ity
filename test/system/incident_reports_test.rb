require "application_system_test_case"

class IncidentReportsTest < ApplicationSystemTestCase
  setup do
    @incident_report = incident_reports(:one)
  end

  test "visiting the index" do
    visit incident_reports_url
    assert_selector "h1", text: "Incident Reports"
  end

  test "creating a Incident report" do
    visit incident_reports_url
    click_on "New Incident Report"

    fill_in "Description", with: @incident_report.description
    fill_in "Room", with: @incident_report.room
    fill_in "Title", with: @incident_report.title
    fill_in "User", with: @incident_report.user_id
    click_on "Create Incident report"

    assert_text "Incident report was successfully created"
    click_on "Back"
  end

  test "updating a Incident report" do
    visit incident_reports_url
    click_on "Edit", match: :first

    fill_in "Description", with: @incident_report.description
    fill_in "Room", with: @incident_report.room
    fill_in "Title", with: @incident_report.title
    fill_in "User", with: @incident_report.user_id
    click_on "Update Incident report"

    assert_text "Incident report was successfully updated"
    click_on "Back"
  end

  test "destroying a Incident report" do
    visit incident_reports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Incident report was successfully destroyed"
  end
end
