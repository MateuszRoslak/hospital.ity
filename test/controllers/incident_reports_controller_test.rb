require "test_helper"

class IncidentReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @incident_report = incident_reports(:one)
  end

  test "should get index" do
    get incident_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_incident_report_url
    assert_response :success
  end

  test "should create incident_report" do
    assert_difference('IncidentReport.count') do
      post incident_reports_url, params: { incident_report: { description: @incident_report.description, room: @incident_report.room, title: @incident_report.title, user_id: @incident_report.user_id } }
    end

    assert_redirected_to incident_report_url(IncidentReport.last)
  end

  test "should show incident_report" do
    get incident_report_url(@incident_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_incident_report_url(@incident_report)
    assert_response :success
  end

  test "should update incident_report" do
    patch incident_report_url(@incident_report), params: { incident_report: { description: @incident_report.description, room: @incident_report.room, title: @incident_report.title, user_id: @incident_report.user_id } }
    assert_redirected_to incident_report_url(@incident_report)
  end

  test "should destroy incident_report" do
    assert_difference('IncidentReport.count', -1) do
      delete incident_report_url(@incident_report)
    end

    assert_redirected_to incident_reports_url
  end
end
