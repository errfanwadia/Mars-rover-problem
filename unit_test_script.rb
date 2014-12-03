require "test/unit"
require_relative 'mars_rover'

class TestNaivgation < Test::Unit::TestCase

  def setup
    @navigate = Navigation.new
  end

  def test_navigation_class_north
    
    @navigate = @navigate.from_s('N', [5,5])
    assert_equal Navigation::North, @navigate.class
  end

  def test_navigation_class_south
    
    @navigate = @navigate.from_s('S', [5,5])
    assert_equal Navigation::South, @navigate.class
  end

  def test_navigation_class_east
    
    @navigate = @navigate.from_s('E', [5,5])
    assert_equal Navigation::East, @navigate.class
  end

  def test_navigation_class_wesr
    
    @navigate = @navigate.from_s('W', [5,5])
    assert_equal Navigation::West, @navigate.class
  end
end

class TestRover < Test::Unit::TestCase

  def setup
    @navigate = Navigation.new
    @navigate = @navigate.from_s('N', [5,5])
  end

  def test_rover_default
    @rover = Rover.new(@navigate)
    assert_equal [0,0], @rover.position
  end

  def test_rover_left_move_print_default
    @rover = Rover.new(@navigate)
    @rover.turn_left
    @rover.move
    assert_equal [0, 0], @rover.position
  end

  def test_rover_right_move_print_default
    @rover = Rover.new(@navigate)
    @rover.turn_right
    @rover.move
    assert_equal [1, 0], @rover.position
  end

  def test_rover_move_print_position
    @rover = Rover.new(@navigate,[1,2])
    @rover.move
    assert_equal [1, 3], @rover.position
  end

  def test_rover_position
    @rover = Rover.new(@navigate, [2,3])
    assert_equal [2,3], @rover.position
  end

  def test_rover_left_move_print_position
    @rover = Rover.new(@navigate, [6,7])
    @rover.turn_left
    @rover.move
    assert_equal [5,7], @rover.position
  end

  def test_rover_right_move_print_position
    @rover = Rover.new(@navigate, [9,1])
    @rover.turn_right
    @rover.move
    assert_equal [9, 1], @rover.position
  end

  def test_rover_move_print_position
    @rover = Rover.new(@navigate, [10,5])
    @rover.move
    assert_equal [10, 5], @rover.position
  end

  def test_rover_move_print_to_s
    @rover = Rover.new(@navigate, [10,5])
    @rover.move
    assert_equal "Final position of rover: 10 5 N", @rover.to_s
  end
end

class TestDriver < Test::Unit::TestCase

  def setup
    @navigate = Navigation.new
    @navigate = @navigate.from_s('N', [5,5])
    @rover = Rover.new(@navigate, [1,2])
  end

  def test_driver_rover
    @driver = Driver.new(@rover)
    assert_equal "Final position of rover: 1 2 N", @driver.rover.to_s
  end

  def test_driver_command_L
    @driver = Driver.new(@rover)
    @driver.get_command("L")
    assert_equal "Final position of rover: 1 2 W", @driver.rover.to_s
  end

  def test_driver_command_R
    @driver = Driver.new(@rover)
    @driver.get_command("R")
    assert_equal "Final position of rover: 1 2 E", @driver.rover.to_s
  end

  def test_driver_command_M
    @driver = Driver.new(@rover)
    @driver.get_command("M")
    assert_equal "Final position of rover: 1 3 N", @driver.rover.to_s
  end

end
