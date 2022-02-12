require "application_system_test_case"

class DemandReportsTest < ApplicationSystemTestCase
  setup do
    @demand_report = demand_reports(:one)
  end

  test "visiting the index" do
    visit demand_reports_url
    assert_selector "h1", text: "Demand Reports"
  end

  test "creating a Demand report" do
    visit demand_reports_url
    click_on "New Demand Report"

    fill_in "Description", with: @demand_report.description
    fill_in "Title", with: @demand_report.title
    fill_in "User", with: @demand_report.user_id
    click_on "Create Demand report"

    assert_text "Demand report was successfully created"
    click_on "Back"
  end

  test "updating a Demand report" do
    visit demand_reports_url
    click_on "Edit", match: :first

    fill_in "Description", with: @demand_report.description
    fill_in "Title", with: @demand_report.title
    fill_in "User", with: @demand_report.user_id
    click_on "Update Demand report"

    assert_text "Demand report was successfully updated"
    click_on "Back"
  end

  test "destroying a Demand report" do
    visit demand_reports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Demand report was successfully destroyed"
  end
end
