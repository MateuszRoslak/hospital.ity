require "application_system_test_case"

class FloorsTest < ApplicationSystemTestCase
  setup do
    @floor = floors(:one)
  end

  test "visiting the index" do
    visit floors_url
    assert_selector "h1", text: "Floors"
  end

  test "creating a Floor" do
    visit floors_url
    click_on "New Floor"

    fill_in "Building", with: @floor.building_id
    fill_in "Name", with: @floor.name
    click_on "Create Floor"

    assert_text "Floor was successfully created"
    click_on "Back"
  end

  test "updating a Floor" do
    visit floors_url
    click_on "Edit", match: :first

    fill_in "Building", with: @floor.building_id
    fill_in "Name", with: @floor.name
    click_on "Update Floor"

    assert_text "Floor was successfully updated"
    click_on "Back"
  end

  test "destroying a Floor" do
    visit floors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Floor was successfully destroyed"
  end
end
