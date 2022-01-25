class InspectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user
  before_action :set_inspection, only: %i[ show edit update destroy inspect ]

  def index
    if current_user.role_technic? || current_user.role_inspector?
      @q = Inspection.all.where(user_id: current_user.id).ransack(params[:q])
    else
      @q = Inspection.all.ransack(params[:q])
    end
    @inspections = @q.result(distinct: true).paginate(page: params[:page], per_page: params[:per_page])
  end

  def show
  end

  def new
    @inspection = Inspection.new
  end

  def edit
  end

  def inspect
  end

  def create
    @inspection = Inspection.new(inspection_params)

    respond_to do |format|
      if @inspection.save
        format.html { redirect_to @inspection, notice: "Inspection was successfully created." }
        format.json { render :show, status: :created, location: @inspection }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @inspection.update(inspection_params)
        format.html { redirect_to @inspection, notice: "Inspection was successfully updated." }
        format.json { render :show, status: :ok, location: @inspection }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @inspection.destroy
    respond_to do |format|
      format.html { redirect_to inspections_url, notice: "Inspection was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_inspection
      @inspection = Inspection.find(params[:id])
    end

    def inspection_params
      params.require(:inspection).permit(:title, :description, :user_id, :completed, :notes, :device_ids => [])
    end

  def correct_user
    unless current_user.role_admin? || current_user.role_office? || current_user.role_technic? || current_user.role_inspector?
      redirect_to root_path, notice: "You are not authorized!"
    end
  end
end
