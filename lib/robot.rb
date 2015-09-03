require 'item'
require 'pry'

class Robot

  attr_accessor :position, :health, :attack, :items, :equipped_weapon

  def initialize(position = [0,0],health = 100, attack = 5, items =[], equipped_weapon = nil)
    @position = position
    @health = health
    @attack = attack
    @items = items
    @equipped_weapon = equipped_weapon
  end

  def move_left
    @position[0] -= 1
  end

  def move_right
    @position[0] += 1
  end

  def move_up
    @position[1] += 1
  end

  def move_down
    @position[1] -= 1
  end

  def pick_up(item)
    if items_weight >= 250
      return false
    end
    if item.respond_to? :damage
      self.equipped_weapon = item
    end
    @items << item
  end

  def items_weight
    total_weight = 0
    @items.each do |item_obj|
      total_weight += item_obj.weight
    end
    total_weight
  end

  def wound(attack_power)
    @health -= attack_power
    if @health < 0
      @health = 0
    end
  end

  def heal(heal_power)
     @health += heal_power
     if @health > 100
      @health = 100
    end
  end

  def attack(robot)
    if @equipped_weapon
      @equipped_weapon.hit(robot)
    else
    robot.wound(5)
    end
  end


end

