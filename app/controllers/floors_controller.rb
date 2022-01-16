class FloorsController < ApplicationController
  before_action :set_building
  before_action :set_floor, only: %i[ show edit update destroy ]
  before_action :correct_user
  
  def index
    @q = @building.floors.ransack(params[:q])
    @floors = @q.result(distinct: true).paginate(page: params[:page], per_page: params[:per_page])
  end

  def show
  end

  def new
    @floor = @building.floors.new
  end

  def edit
  end

  def create
    @floor = @building.floors.new(floor_params)

    respond_to do |format|
      if @floor.save
        format.html { redirect_to building_floor_path(@building, @floor), notice: "Floor was successfully created." }
        format.json { render :show, status: :created, location: @floor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @floor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @floor.update(floor_params)
        format.html { redirect_to building_floor_path(@building, @floor), notice: "Floor was successfully updated." }
        format.json { render :show, status: :ok, location: @floor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @floor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @floor.destroy
    respond_to do |format|
      format.html { redirect_to building_floors_url, notice: "Floor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_floor
      @building = Building.find(params[:building_id])
      @floor = @building.floors.find(params[:id])
    end

    def set_building
      @building = Building.find(params[:building_id])
    end

    def floor_params
      params.require(:floor).permit(:name, :building_id)
    end

    def correct_user
      unless current_user.role_admin?
        redirect_to root_path, notice: "You are not authorized!"
      end
    end
end
