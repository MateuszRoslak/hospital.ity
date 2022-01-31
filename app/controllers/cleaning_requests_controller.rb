class CleaningRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user
  before_action :set_cleaning_request, only: %i[ show edit update destroy ]

  def index
    @q = CleaningRequest.all.ransack(params[:q])
    @cleaning_requests = @q.result(distinct: true).paginate(page: params[:page], per_page: params[:per_page])
  end

  def show
  end

  def new
    @cleaning_request = CleaningRequest.new
  end

  def edit
  end

  def create
    @cleaning_request = CleaningRequest.new(cleaning_request_params)

    respond_to do |format|
      if @cleaning_request.save
        format.html { redirect_to @cleaning_request, notice: "Cleaning request was successfully created." }
        format.json { render :show, status: :created, location: @cleaning_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cleaning_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cleaning_request.update(cleaning_request_params)
        format.html { redirect_to @cleaning_request, notice: "Cleaning request was successfully updated." }
        format.json { render :show, status: :ok, location: @cleaning_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cleaning_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cleaning_request.destroy
    respond_to do |format|
      format.html { redirect_to cleaning_requests_url, notice: "Cleaning request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_cleaning_request
      @cleaning_request = CleaningRequest.find(params[:id])
    end

    def cleaning_request_params
      params.require(:cleaning_request).permit(:title, :description, :user_id)
    end

  def correct_user
    unless current_user.role_admin? || current_user.role_nurse? || current_user.role_doctor?
      redirect_to root_path, notice: "You are not authorized!"
    end
  end
end
