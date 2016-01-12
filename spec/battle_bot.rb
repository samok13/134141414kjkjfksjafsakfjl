

class BattleBot

  attr_accessor :name, :health, :enemies, :weapon, 

  def initalize(name)
    @name = name
    @health = 100
    @enemies = []
    @weapon = nil
    @is_not_dead = false
    @has_weapon = false
  end


  def pick_up
  end


  def drop_weapon
  end

  def take_damage
  end

  def heal
  end

  def attack
  end


end