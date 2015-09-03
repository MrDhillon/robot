

class Robot

  attr_accessor :position, :health, :attack, :items, :equipped_weapon, :max_dist

  def initialize(position = [0,0],health = 100, attack = 5, items =[], equipped_weapon = nil,max_dist = 1)
    @position = position
    @health = health
    @attack = attack
    @items = items
    @equipped_weapon = equipped_weapon
    @max_dist = max_dist
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
    case
    when item.weight + items_weight > 250
      return false
    when item.is_a?(Weapon)
      self.equipped_weapon = item
      @max_dist = item.range
    when item.is_a?(BoxOfBolts) && (self.health <= 80)
      item.feed(self)
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
    heal!
    @health = [@health - attack_power, 0].max
  end

  def attack(robot)
    if !within_range(robot)
      return false
    end
    if robot.is_a?(Robot)
      if @equipped_weapon
        @equipped_weapon.hit(robot)
          if @equipped_weapon.is_a?(Grenade)
            # self.items.delete(@equipped_weapon)
            @equipped_weapon = nil
          end
      else
        robot.wound(5)
      end
    else
      raise UnattackableEnemy, "You can only attack a robot!"
    end
  end

  def heal(heal_power)
    heal!
    @health += heal_power
      if @health > 100
        @health = 100
      end
  end

  def heal!
    if @health <= 0
      raise RobotAlreadyDeadError, "The robot it dead!"
    end
  end

  def within_range(enemy)


    if @equipped_weapon.nil?
      temp_max_dist = @max_dist
    else
      temp_max_dist = @equipped_weapon.range
    end

    if (enemy.position[0] - self.position[0]).abs > temp_max_dist
      return false
    end

    if (enemy.position[1] - self.position[1]).abs > temp_max_dist
      return false
    end

    return true

  end

end
