require 'battle_bot'

class Weapon

  attr_reader :name, :damage, :bot

  def initialize(name, damage=20)
    if !(name.is_a? String)
      raise ArgumentError
    end
    if !(damage.is_a? Fixnum)
      raise ArgumentError
    end
  @name = name
  @damage = damage
  end

  def bot=(battlebot)
    if (battlebot.is_a? BattleBot || battlebot.is_nil?)
      @bot = battlebot
    else
      puts battlebot
      raise ArgumentError
    end
  end



  def picked_up?

  end


end