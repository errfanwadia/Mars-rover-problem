require './mars_rover'

# Need to think about it
land_area = ARGF.gets

until ARGF.eof
  rover_position = ARGF.gets


  position = rover_position.split[0, 2]
  direction = Navigation.new
  direction = direction.from_s(rover_position.split[2], land_area.split.map(&:to_i))
  # puts direction
  rover = Rover.new(direction, position)
  Driver.new(rover).get_command(ARGF.gets)

  puts rover
end