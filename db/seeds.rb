
puts "Seed Started........!"

# Create a sample data for drones
Drone.create([
  {name: "Pixel Pilot", colour: "blue"},
  {name: "Aerial Aspects", colour: "yellow"},
  {name: "National Drones", colour: "white"},
  {name: "Mega Drone", colour: "red"},
  {name: "Sphere Drones", colour: "black"}
])

drones = Drone.all.pluck(:id)

# Create a sample data for engines
Engine.create([
  {name: "Engine1", power_indicator: 50, drone_id: drones[0]},
  {name: "Engine2", power_indicator: 80, drone_id: drones[1]},
  {name: "Engine3", power_indicator: 60, drone_id: drones[2]},
  {name: "Engine4", power_indicator: 90, drone_id: drones[3]},
  {name: "Engine5", power_indicator: 40, drone_id: drones[4]}
])

# Create a sample data for gyroscopes
Gyroscope.create([
  {name: "Gyroscope1", x: 50, y: 50, z: 42, drone_id: drones[0]},
  {name: "Gyroscope2", x: 80, y: 50, z: 78, drone_id: drones[1]},
  {name: "Gyroscope3", x: 60, y: 89, z: 55, drone_id: drones[2]},
  {name: "Gyroscope4", x: 90, y: 45, z: 66, drone_id: drones[3]},
  {name: "Gyroscope5", x: 40, y: 33, z: 50, drone_id: drones[4]}
])

# Create a sample data for orientation sensors
OrientationSensor.create([
  {name: "OrientationSensor1", pitch: "X-AXIS", roll: "Y-AXIS", drone_id: drones[0]},
  {name: "OrientationSensor2", pitch: "X-AXIS", roll: "Y-AXIS", drone_id: drones[1]},
  {name: "OrientationSensor3", pitch: "X-AXIS", roll: "Y-AXIS", drone_id: drones[2]},
  {name: "OrientationSensor4", pitch: "X-AXIS", roll: "Y-AXIS", drone_id: drones[3]},
  {name: "OrientationSensor5", pitch: "X-AXIS", roll: "Y-AXIS", drone_id: drones[4]}
])

puts "Drone: #{Drone.count}"
puts "Engine: #{Engine.count}"
puts "Gyroscope: #{Gyroscope.count}"
puts "OrientationSensor: #{OrientationSensor.count}"

puts "Seed Completed........!"