require "test_helper"

class DemandReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @demand_report = demand_reports(:one)
  end

  test "should get index" do
    get demand_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_demand_report_url
    assert_response :success
  end

  test "should create demand_report" do
    assert_difference('DemandReport.count') do
      post demand_reports_url, params: { demand_report: { description: @demand_report.description, title: @demand_report.title, user_id: @demand_report.user_id } }
    end

    assert_redirected_to demand_report_url(DemandReport.last)
  end

  test "should show demand_report" do
    get demand_report_url(@demand_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_demand_report_url(@demand_report)
    assert_response :success
  end

  test "should update demand_report" do
    patch demand_report_url(@demand_report), params: { demand_report: { description: @demand_report.description, title: @demand_report.title, user_id: @demand_report.user_id } }
    assert_redirected_to demand_report_url(@demand_report)
  end

  test "should destroy demand_report" do
    assert_difference('DemandReport.count', -1) do
      delete demand_report_url(@demand_report)
    end

    assert_redirected_to demand_reports_url
  end
end
