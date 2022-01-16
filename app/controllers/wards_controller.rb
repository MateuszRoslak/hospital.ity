class WardsController < ApplicationController
  before_action :set_building_and_floor
  before_action :set_ward, only: %i[ show edit update destroy ]
  before_action :correct_user
  before_action :authenticate_user!

  def index
    @q = @floor.wards.ransack(params[:q])
    @wards = @q.result(distinct: true).paginate(page: params[:page], per_page: params[:per_page])
  end

  def show
  end

  def new
    @ward = @floor.wards.new
  end

  def edit
  end

  def create
    @ward = @floor.wards.new(ward_params)

    respond_to do |format|
      if @ward.save
        format.html { redirect_to building_floor_ward_path(@building, @floor, @ward), notice: "Ward was successfully created." }
        format.json { render :show, status: :created, location: @ward }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ward.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ward.update(ward_params)
        format.html { redirect_to building_floor_ward_path(@building, @floor, @ward), notice: "Ward was successfully updated." }
        format.json { render :show, status: :ok, location: @ward }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ward.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ward.destroy
    respond_to do |format|
      format.html { redirect_to building_floor_wards_url, notice: "Ward was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_ward
      @ward = Ward.find(params[:id])
    end

    def set_building_and_floor
      @building = Building.find(params[:building_id])
      @floor = @building.floors.find(params[:floor_id])
    end

    def ward_params
      params.require(:ward).permit(:name, :building_id, :floor_id)
    end

    def correct_user
      unless current_user.role_admin?
        redirect_to root_path, notice: "You are not authorized!"
      end
    end
end
