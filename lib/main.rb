require './robot'
require './item'
require './weapon'
require './box_of_bolts'
require './laser'
require './plasma_cannon'
require 'pry'

robot = Robot.new
item = Item.new("swords",15)
robot.attack(item)

