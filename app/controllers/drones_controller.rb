class DronesController < ApplicationController
  before_action :set_drone, only: [:show, :edit, :update, :destroy, :take_off,
                :move, :stabilize, :land, :engine_break, :stop_drone, :tap_drone]
  
  def index
    @drones = Drone.all
  end

  def show
  end

  def new
    @drone = Drone.new
  end
  
  def create
    @drone = Drone.new(drone_params)
      
    respond_to do |format|
     if @drone.save
        format.html { redirect_to drones_path, notice: 'Drone was successfully created.' }
     else
        format.html { render :new }
     end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
     if @drone.update(drone_params)
        format.html { redirect_to drones_path, notice: 'Drone was successfully updated.' }
     else
        format.html { render :edit, error: "#{@drone.errors.full_messages}" }
     end
    end
  end

  def destroy
    @drone.destroy

    respond_to do |format|
      format.html { redirect_to drones_path, notice: 'Drone was successfully deleted.' }
    end  
  end

  def fly_drone    
    @result = []

    Drone.all.each do |drone|
      @result << drone if drone.engines.present? && drone.gyroscope.present? && drone.orientation_sensor.present?
    end
    @result
  end

  def take_off
    @drone.update(status: 'on')
    @drone.engines.update_all(status: 'on')
    redirect_to drone_path(@drone), notice: "Drone has started ready to move....!"
  end
  
  def move
    @drone.update(status: 'moving')
    redirect_to drone_path(@drone), notice: "Drone is moving #{params[:direction]} side in the air"
  end

  def stabilize
    @drone.update(status: 'hovering')
    redirect_to drone_path(@drone), notice: "Drone is hovering in the air"
  end
  
  def land
    @drone.update(status: 'landed')
    redirect_to drone_path(@drone), notice: "Drone is landed safely"
  end

  def engine_break
    @drone.update(status: 'landed')
    @drone.engines.update_all(status: 'on')
    redirect_to drone_path(@drone), notice: "Drone will send a distress signal and start landing - LANDED"
  end

  def stop_drone
    @drone.update(status: 'off')
    @drone.engines.update_all(status: 'off')
    redirect_to fly_drone_drones_path, notice: "Drone fail to take off it sends a distress signal - DRONE STOPS"
  end
  
  def tap_drone
    redirect_to drone_path(@drone), notice: "Drone is tapped by hand it's hovering instead of crashing."
  end

  private

  def set_drone
    @drone = Drone.find(params[:id])
  end

  def drone_params
    params.require(:drone).permit(:name, :colour)
  end  
end
