class WelcomeController < ApplicationController
  def index
    @drones_count = Drone.count
    @engines_count = Engine.count
    @gyroscopes_count = Gyroscope.count
    @orientation_sensors_count = OrientationSensor.count

    @result = []

    Drone.all.each do |drone|
      @result << drone if drone.engines.present? && drone.gyroscope.present? && drone.orientation_sensor.present?
    end
    @result
  end
end
