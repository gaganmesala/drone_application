class GyroscopesController < ApplicationController
  before_action :set_gyroscope, only: [:show, :edit, :update, :destroy]
  
  def index
    @gyroscopes = Gyroscope.all
  end

  def show
  end

  def new
    @gyroscope = Gyroscope.new
  end
  
  def create
    @gyroscope = Gyroscope.new(gyroscope_params)
      
    respond_to do |format|
     if @gyroscope.save
        format.html { redirect_to gyroscopes_path, notice: 'Gyroscope was successfully created.' }
     else
        format.html { render :new }
     end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
     if @gyroscope.update(gyroscope_params)
        format.html { redirect_to gyroscopes_path, notice: 'Gyroscope was successfully updated.' }
     else
        format.html { render :edit, error: "#{@gyroscope.errors.full_messages}" }
     end
    end
  end

  def destroy
    @gyroscope.destroy

    respond_to do |format|
      format.html { redirect_to gyroscopes_path, notice: 'Gyroscope was successfully deleted.' }
    end
  end

  private

  def set_gyroscope
    @gyroscope = Gyroscope.find(params[:id])
  end

  def gyroscope_params
    params.require(:gyroscope).permit(:name, :x, :y, :z, :drone_id)
  end
end
