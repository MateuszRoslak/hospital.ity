require "test_helper"

class CleaningReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cleaning_report = cleaning_reports(:one)
  end

  test "should get index" do
    get cleaning_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_cleaning_report_url
    assert_response :success
  end

  test "should create cleaning_report" do
    assert_difference('CleaningReport.count') do
      post cleaning_reports_url, params: { cleaning_report: { description: @cleaning_report.description, title: @cleaning_report.title, user_id: @cleaning_report.user_id } }
    end

    assert_redirected_to cleaning_report_url(CleaningReport.last)
  end

  test "should show cleaning_report" do
    get cleaning_report_url(@cleaning_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_cleaning_report_url(@cleaning_report)
    assert_response :success
  end

  test "should update cleaning_report" do
    patch cleaning_report_url(@cleaning_report), params: { cleaning_report: { description: @cleaning_report.description, title: @cleaning_report.title, user_id: @cleaning_report.user_id } }
    assert_redirected_to cleaning_report_url(@cleaning_report)
  end

  test "should destroy cleaning_report" do
    assert_difference('CleaningReport.count', -1) do
      delete cleaning_report_url(@cleaning_report)
    end

    assert_redirected_to cleaning_reports_url
  end
end
