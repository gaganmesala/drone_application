# README

Welcome to Drone Application

Here we have Drones, Engines, Gyroscopes, Orientation Sensors and Ready to Fly Drones

To fly a drone, atleast one engine, gyroscope and orientation sensor is required. Else It will not show in Ready to Fly Drones

First we need to create a drone, then we need to create a engine, gyroscope, orientation sensor by selecting drone.

Then you can Ready to Fly Drones

- Once you take off the drone you can see other options

0. TAKE OFF: Drone has started ready to move....!
1. STABILIZE: Drone is hovering in the air
2. LAND: Drone is landed safely
3. MOVE FORWARD: (LEFT, RIGHT, BACK, UP, DOWN): Drone is moving #{selected} side in the air
4. TAP DRONE: Drone is tapped by hand it's hovering instead of crashing.
5. ENGINE BREAKS: Drone will send a distress signal and start landing - LANDED
6. STOP DRONE: Drone fail to take off it sends a distress signal - DRONE STOPS



Run in your local machine:

1. clone the project
2. bundle install
3. rake db:create && rake db:migrate && rake db:seed  OR rake db:setup (one command)
4. bin/rails s
5. http://localhost:3000

Heroku URL(DEMO): https://droneapplication.herokuapp.com/

