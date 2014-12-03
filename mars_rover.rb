class Navigation
  def from_s(dir, maxPos)
  	$maxPos = maxPos
     case
       when dir == 'N'
         NORTH
       when dir == 'E'
         EAST
       when dir == 'W'
         WEST
       when dir == 'S'
         SOUTH
      end
  end

  class North
    def turn_left
      WEST
    end

    def turn_right
       EAST
    end

    def move(curPos)
      x = Integer(curPos[0])
      if !(Integer(curPos[1]) + 1 > $maxPos[1])
      	y = Integer(curPos[1]) + 1
      else
      	y = Integer(curPos[1])
      end
      [x, y]
    end

    def to_s
      "N"
    end
  end

  class West
    def turn_left
      SOUTH
    end

    def turn_right
      NORTH
    end

    def move(curPos)
      if ! (Integer(curPos[0]) - 1 < 0)
      	x = Integer(curPos[0]) - 1
      else
      	x = Integer(curPos[0])
      end
      y = Integer(curPos[1])

      [x, y]
    end

    def to_s
      "W"
    end
  end

  class South
    def turn_left
      EAST
    end

    def turn_right
      WEST
    end

    def move(curPos)
      x = Integer(curPos[0])
      if !(Integer(curPos[1]) - 1 < 0)
      	y = Integer(curPos[1]) - 1
      else
      	y = Integer(curPos[1])
      end
      [x, y]
    end

    def to_s
      "S"
    end
  end

  class East
    def turn_left
      NORTH
    end

    def turn_right
      SOUTH
    end

    def move(curPos)
      if !(Integer(curPos[0]) + 1 > $maxPos[0])
      	x = Integer(curPos[0]) + 1
      else
      	x = Integer(curPos[0])
      end
      y = Integer(curPos[1])

      [x, y]
    end

    def to_s
      "E"
    end
  end

  NORTH = North.new
  SOUTH = South.new
  EAST  = East.new
  WEST  = West.new
end


class Rover
  attr_reader :direction, :position

  def initialize(initial_direction, current_position=[0,0])
     @direction = initial_direction
     @position = current_position
  end

  def turn_left
    @direction = @direction.turn_left
  end

  def turn_right
    @direction = @direction.turn_right
  end

  def move
    @position = @direction.move(@position)
  end

  def to_s
    "Final position of rover: #{position[0]} #{position[1]} #{direction}"
  end
end

class Driver
	attr_reader :rover
  def initialize(rover)
    @rover = rover
  end

  def get_command(command)
    command.each_char do |command|
      case
        when command == 'L'
          @rover.turn_left
        when command == 'R'
          @rover.turn_right
        when command == 'M'
          @rover.move
      end
    end
  end
end
