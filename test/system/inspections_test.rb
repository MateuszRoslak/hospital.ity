require "application_system_test_case"

class InspectionsTest < ApplicationSystemTestCase
  setup do
    @inspection = inspections(:one)
  end

  test "visiting the index" do
    visit inspections_url
    assert_selector "h1", text: "Inspections"
  end

  test "creating a Inspection" do
    visit inspections_url
    click_on "New Inspection"

    fill_in "Description", with: @inspection.description
    fill_in "Title", with: @inspection.title
    fill_in "User", with: @inspection.user_id
    click_on "Create Inspection"

    assert_text "Inspection was successfully created"
    click_on "Back"
  end

  test "updating a Inspection" do
    visit inspections_url
    click_on "Edit", match: :first

    fill_in "Description", with: @inspection.description
    fill_in "Title", with: @inspection.title
    fill_in "User", with: @inspection.user_id
    click_on "Update Inspection"

    assert_text "Inspection was successfully updated"
    click_on "Back"
  end

  test "destroying a Inspection" do
    visit inspections_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Inspection was successfully destroyed"
  end
end
