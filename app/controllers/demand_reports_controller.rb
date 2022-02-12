class DemandReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_demand_report, only: %i[ show edit update destroy review ]

  def index
    if current_user.role_office? || current_user.role_admin?
      @q = DemandReport.all.ransack(params[:q])
    else
      @q = DemandReport.all.where(user_id: current_user.id).ransack(params[:q])
    end
    @demand_reports = @q.result(distinct: true).paginate(page: params[:page], per_page: params[:per_page])
  end

  def show
  end

  def review
  end
  
  def new
    @demand_report = DemandReport.new
  end

  def edit
  end

  def create
    @demand_report = DemandReport.new(demand_report_params)

    respond_to do |format|
      if @demand_report.save
        format.html { redirect_to @demand_report, notice: "Demand report was successfully created." }
        format.json { render :show, status: :created, location: @demand_report }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @demand_report.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @demand_report.update(demand_report_params)
        format.html { redirect_to @demand_report, notice: "Demand report was successfully updated." }
        format.json { render :show, status: :ok, location: @demand_report }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @demand_report.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @demand_report.destroy
    respond_to do |format|
      format.html { redirect_to demand_reports_url, notice: "Demand report was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_demand_report
      @demand_report = DemandReport.find(params[:id])
    end

    def demand_report_params
      params.require(:demand_report).permit(:title, :description, :user_id, :status, :picture)
    end
end
