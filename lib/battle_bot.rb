
require 'weapon'

class BattleBot 

  attr_reader :name, :health, :enemies, :weapon

  def initialize(name)
    if name.is_a? String
      @name = name
    end
    if name = nil
      raise ArgumentError
    end
    @health = 100
    @enemies = []
    @weapon = nil
    @@count += 1
  end

  def self.count
    @@count
  end

  def dead?
    @health == 0
  end

  def has_weapon?
    @weapon != nil
  end

  def pick_up(weapon)
    if (weapon.is_a? Weapon) && (weapon.picked_up? == false)
      if @weapon 
        return nil
      end
      @weapon = weapon
      weapon.bot = self
      weapon
    else
      raise ArgumentError
    end
  end

  def drop_weapon
    @weapon.bot = nil
    @weapon = nil
  end

  def take_damage(num)
    if !(num.is_a? Fixnum)
      raise ArgumentError
    else
      if @health >= num
        @health = @health - num
      elsif @health <= num
        @health = 0
        @@count -= 1
      end
    end
  end

  def heal
    if @health >= 100
      @health = 100
    elsif 0 < @health && @health < 100
      @health = @health + 10
    else 
      @health = @health
    end
  end

  def attack(enemy)
    if !(enemy.is_a? BattleBot)
      raise ArgumentError
    elsif enemy == self
      raise ArgumentError
    elsif self.weapon == nil
      raise ArgumentError  
    else
      enemy.receive_attack_from(self) 
    end
  end

  def receive_attack_from(enemy)
    if !(enemy.is_a? BattleBot)
      raise ArgumentError
    elsif enemy == self
      raise ArgumentError
    elsif enemy.weapon == nil
      raise ArgumentError
    else 
      self.take_damage(enemy.weapon.damage)
      if !(enemies.include? enemy)
        self.enemies << enemy
      end
      self.defend_against(enemy)
    end
  end

  def defend_against(enemy)
    if self.dead? == false && self.has_weapon? == true
      self.attack(enemy)
    end
  end


end
  


  # accepts a string name for the bot as the first parameter (FAILED - 1)
  #   raises an ArgumentError when the no name is passed (FAILED - 2)
  #   sets the name attribute when passed correctly (FAILED - 3)
  #   sets health to a default value of 100 (FAILED - 4)
  #   sets enemies to an empty array (FAILED - 5)
  #   initializes with weapon set to nil (FAILED - 6)
  #   is not dead (FAILED - 7)
  #   does not start with a weapon (FAILED - 8)




# class BattleBot
#   attr_reader :name, :health, :enemies, :weapon 

#   def initalize(name)
#     @name = name
#     @health = 100
#     @enemies = []
#     @weapon = nil
#     @is_not_dead = false
#     @has_weapon = false
#   end


#   def pick_up
#   end


#   def drop_weapon
#   end

#   def take_damage
#   end

#   def heal
#   end

#   def attack
#   end


# end