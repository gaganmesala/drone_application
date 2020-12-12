class OrientationSensorsController < ApplicationController
  before_action :set_orientation_sensor, only: [:show, :edit, :update, :destroy]
  
  def index
    @orientation_sensors = OrientationSensor.all
  end

  def show
  end

  def new
    @orientation_sensor = OrientationSensor.new
  end
  
  def create
    @orientation_sensor = OrientationSensor.new(orientation_sensor_params)

    respond_to do |format|
      if @orientation_sensor.save
        format.html { redirect_to orientation_sensors_path, notice: 'OrientationSensor was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @orientation_sensor.update(orientation_sensor_params)
        format.html { redirect_to orientation_sensors_path, notice: 'OrientationSensor was successfully updated.' }
      else
        format.html { render :edit, error: "#{@orientation_sensor.errors.full_messages}" }
      end
    end
  end

  def destroy
    @orientation_sensor.destroy

    respond_to do |format|
      format.html { redirect_to orientation_sensors_path, notice: 'OrientationSensor was successfully deleted.' }
    end
  end

  private

  def set_orientation_sensor
    @orientation_sensor = OrientationSensor.find(params[:id])
  end

  def orientation_sensor_params
    params.require(:orientation_sensor).permit(:name, :pitch, :roll, :drone_id)
  end
end
