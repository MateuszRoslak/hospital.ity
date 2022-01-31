require "application_system_test_case"

class CleaningReportsTest < ApplicationSystemTestCase
  setup do
    @cleaning_report = cleaning_reports(:one)
  end

  test "visiting the index" do
    visit cleaning_reports_url
    assert_selector "h1", text: "Cleaning Reports"
  end

  test "creating a Cleaning report" do
    visit cleaning_reports_url
    click_on "New Cleaning Report"

    fill_in "Description", with: @cleaning_report.description
    fill_in "Title", with: @cleaning_report.title
    fill_in "User", with: @cleaning_report.user_id
    click_on "Create Cleaning report"

    assert_text "Cleaning report was successfully created"
    click_on "Back"
  end

  test "updating a Cleaning report" do
    visit cleaning_reports_url
    click_on "Edit", match: :first

    fill_in "Description", with: @cleaning_report.description
    fill_in "Title", with: @cleaning_report.title
    fill_in "User", with: @cleaning_report.user_id
    click_on "Update Cleaning report"

    assert_text "Cleaning report was successfully updated"
    click_on "Back"
  end

  test "destroying a Cleaning report" do
    visit cleaning_reports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cleaning report was successfully destroyed"
  end
end
