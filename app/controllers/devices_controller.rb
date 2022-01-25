class DevicesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user
  before_action :set_device, only: %i[ show edit update destroy ]
  

  def index
    @q = Device.all.ransack(params[:q])
    @devices = @q.result(distinct: true).paginate(page: params[:page], per_page: params[:per_page])
  end

  def show
  end

  def generate_qr_code
    send_data RQRCode::QRCode.new(device_params[:qr_link].to_s).as_png(size: 300), type: 'image/png', disposition: 'inline'
  end

  def new
    @device = Device.new
  end

  def edit
  end

  def create
    @device = Device.new(device_params)

    respond_to do |format|
      if @device.save
        format.html { redirect_to @device, notice: "Device was successfully created." }
        format.json { render :show, status: :created, location: @device }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to @device, notice: "Device was successfully updated." }
        format.json { render :show, status: :ok, location: @device }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @device.destroy
    respond_to do |format|
      format.html { redirect_to devices_url, notice: "Device was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_device
      @device = Device.find(params[:id])
    end

    def device_params
      params.require(:device).permit(:name, :model, :manufacturer, :device_type, :room_id, :status, :qr_link)
    end

    def correct_user
      unless current_user.role_admin?
        redirect_to root_path, notice: "You are not authorized!"
      end
    end
end
