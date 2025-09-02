class DndCharacter
  BASE_HITPOINTS = 10
  ABILITIES = %i[strength dexterity constitution intelligence wisdom charisma]

  attr_reader(*ABILITIES)
  attr_reader :hitpoints

  def self.modifier(score)
    ((score - 10) / 2).floor
  end

  def initialize
    ABILITIES.each do |ability|
      instance_variable_set("@#{ability}", roll_ability_score)
    end
    @hitpoints = BASE_HITPOINTS + DndCharacter.modifier(@constitution)
  end

  private

  def roll_ability_score
    dice = Array.new(4) { rand(1..6) }
    dice.sort.reverse[0, 3].sum
  end
end
