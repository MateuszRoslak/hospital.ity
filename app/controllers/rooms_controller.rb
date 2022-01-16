class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user
  before_action :set_building_floor_and_ward
  before_action :set_room, only: %i[ show edit update destroy ]

  def index
    @q = @ward.rooms.ransack(params[:q])
    @rooms = @q.result(distinct: true).paginate(page: params[:page], per_page: params[:per_page])
  end

  def show
  end

  def new
    @room = @ward.rooms.new
  end

  def edit
  end

  def create
    @room = @ward.rooms.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to building_floor_ward_room_path(@building, @floor, @ward, @room), notice: "Room was successfully created." }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to building_floor_ward_path(@building, @floor, @ward, @room), notice: "Room was successfully updated." }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to building_floor_ward_rooms_url, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  
  def set_room
    @room = @ward.rooms.find(params[:id])
  end

  def set_building_floor_and_ward
    @building = Building.find(params[:building_id])
    @floor = @building.floors.find(params[:floor_id])
    @ward = @floor.wards.find(params[:ward_id])
  end
  
  def room_params
    params.require(:room).permit(:name, :building_id, :floor_id, :ward_id)
  end

  def correct_user
    unless current_user.role_admin?
      redirect_to root_path, notice: "You are not authorized!"
    end
  end
end
