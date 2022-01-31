class CleaningReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user
  before_action :set_cleaning_report, only: %i[ show edit update destroy ]

  def index
    @q = CleaningReport.all.ransack(params[:q])
    @cleaning_reports = @q.result(distinct: true).paginate(page: params[:page], per_page: params[:per_page])
  end

  def show
  end

  def new
    @cleaning_report = CleaningReport.new
  end

  def edit
  end

  def create
    @cleaning_report = CleaningReport.new(cleaning_report_params)

    respond_to do |format|
      if @cleaning_report.save
        format.html { redirect_to @cleaning_report, notice: "Cleaning report was successfully created." }
        format.json { render :show, status: :created, location: @cleaning_report }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cleaning_report.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cleaning_report.update(cleaning_report_params)
        format.html { redirect_to @cleaning_report, notice: "Cleaning report was successfully updated." }
        format.json { render :show, status: :ok, location: @cleaning_report }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cleaning_report.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cleaning_report.destroy
    respond_to do |format|
      format.html { redirect_to cleaning_reports_url, notice: "Cleaning report was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_cleaning_report
      @cleaning_report = CleaningReport.find(params[:id])
    end

    def cleaning_report_params
      params.require(:cleaning_report).permit(:title, :description, :user_id, :room_ids => [])
    end

  def correct_user
    unless current_user.role_admin? || current_user.role_janitor? || current_user.role_office?
      redirect_to root_path, notice: "You are not authorized!"
    end
  end
end
