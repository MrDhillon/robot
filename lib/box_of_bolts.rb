require 'item'

class BoxOfBolts < Item

  def initialize(name = "Box of bolts" ,weight = 25)
  @name = name
  @weight = weight
  end

  def feed(robot)
    robot.heal(20)
  end

end