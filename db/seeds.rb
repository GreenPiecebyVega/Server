# frozen_string_literal: true

###################
# Base Characters #
###################
base_characters = [
  [id: 1, nome: 'Física', gp_character_base: 0],
  [id: 2, nome: 'Mágica', gp_character_base: 1]
]
base_characters.each do |bs|
  bsquery = BaseCharacter.find_or_initialize_by(
    id: bs.first[:id],
    nome: bs.first[:nome],
    gp_character_base: bs.first[:gp_character_base]
  )
  bsquery.save!
end

###################
#   Characters    #
###################
characters = [
  [id: 1, base_character_id: 1, nome: 'Guerreiro', gp_character: 0],
  [id: 2, base_character_id: 1, nome: 'Guardião', gp_character: 1],
  [id: 3, base_character_id: 2, nome: 'Mago', gp_character: 2],
  [id: 4, base_character_id: 2, nome: 'Xanter', gp_character: 3],
  [id: 5, base_character_id: 1, nome: 'Duelista', gp_character: 4],
  [id: 6, base_character_id: 2, nome: 'Arqueiro', gp_character: 5]
]
characters.each do |ch|
  chquery = Character.find_or_initialize_by(
    id: ch.first[:id],
    base_character_id: ch.first[:base_character_id],
    nome: ch.first[:nome],
    gp_character: ch.first[:gp_character]
  )
  chquery.save!
end

# END #
