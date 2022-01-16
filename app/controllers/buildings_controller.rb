class BuildingsController < ApplicationController
  before_action :set_building, only: %i[ show edit update destroy ]
  before_action :correct_user
  before_action :authenticate_user!


  def index
    @q = Building.ransack(params[:q])
    @buildings = @q.result(distinct: true).paginate(page: params[:page], per_page: params[:per_page])
  end

  def show
  end

  def new
    @building = Building.new
  end

  def edit
  end

  def create
    @building = Building.new(building_params)

    respond_to do |format|
      if @building.save
        format.html { redirect_to @building, notice: "Building was successfully created." }
        format.json { render :show, status: :created, location: @building }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @building.update(building_params)
        format.html { redirect_to @building, notice: "Building was successfully updated." }
        format.json { render :show, status: :ok, location: @building }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @building.destroy
    respond_to do |format|
      format.html { redirect_to buildings_url, notice: "Building was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_building
      @building = Building.find(params[:id])
    end

    def building_params
      params.require(:building).permit(:name)
    end

    def correct_user
      unless current_user.role_admin?
        redirect_to root_path, notice: "You are not authorized!"
      end
    end
end
