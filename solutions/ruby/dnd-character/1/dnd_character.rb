class DndCharacter
  BASE_HITPOINTS = 10

  attr_reader :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma

  def self.modifier(constitution_score)
    (constitution_score - 10) / 2.floor
  end

  def initialize
    @strength = roll_ability_score
    @dexterity = roll_ability_score
    @constitution = roll_ability_score
    @intelligence = roll_ability_score
    @wisdom = roll_ability_score
    @charisma = roll_ability_score
  end

  def hitpoints
    BASE_HITPOINTS + DndCharacter.modifier(@constitution)
  end

  private

  def roll_ability_score
    dice = Array.new(4) { rand(1..6) }
    dice.sort.reverse[0, 3].sum
  end
end
