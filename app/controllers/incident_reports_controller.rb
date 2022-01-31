class IncidentReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user
  before_action :set_incident_report, only: %i[ show edit update destroy ]

  def index
    @q = IncidentReport.all.ransack(params[:q])
    @incidents = @q.result(distinct: true).paginate(page: params[:page], per_page: params[:per_page])
  end

  def show
  end

  def new
    @incident_report = IncidentReport.new
  end

  def edit
  end

  def create
    @incident_report = IncidentReport.new(incident_report_params)

    respond_to do |format|
      if @incident_report.save
        format.html { redirect_to @incident_report, notice: "Incident report was successfully created." }
        format.json { render :show, status: :created, location: @incident_report }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @incident_report.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @incident_report.update(incident_report_params)
        format.html { redirect_to @incident_report, notice: "Incident report was successfully updated." }
        format.json { render :show, status: :ok, location: @incident_report }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @incident_report.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @incident_report.destroy
    respond_to do |format|
      format.html { redirect_to incident_reports_url, notice: "Incident report was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_incident_report
      @incident_report = IncidentReport.find(params[:id])
    end

    def incident_report_params
      params.require(:incident_report).permit(:title, :room, :description, :user_id)
    end
  
  def correct_user
    unless current_user.role_admin? || current_user.role_office? || current_user.role_guard?
      redirect_to root_path, notice: "You are not authorized!"
    end
  end
end
