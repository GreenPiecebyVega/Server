# frozen_string_literal: true

###################
# Base Characters #
###################
base_characters = [
  [id: 1, name: 'Física', gp_character_base: 0],
  [id: 2, name: 'Mágica', gp_character_base: 1]
]
base_characters.each do |bs|
  bsquery                   = BaseCharacter.find_or_initialize_by(id: bs.first[:id])
  bsquery.name              = bs.first[:name]
  bsquery.gp_character_base = bs.first[:gp_character_base]
  bsquery.save!
end

###################
#   Characters    #
###################
characters = [
  [id: 1, base_character_id: 1, name: 'Guerreiro', name_abreviation: 'WA', gp_character: 0],
  [id: 2, base_character_id: 1, name: 'Guardião',  name_abreviation: 'GG', gp_character: 1],
  [id: 3, base_character_id: 2, name: 'Mago',      name_abreviation: 'WI', gp_character: 2],
  [id: 4, base_character_id: 2, name: 'Xanter',    name_abreviation: 'XT', gp_character: 3],
  [id: 5, base_character_id: 1, name: 'Duelista',  name_abreviation: 'SW', gp_character: 4],
  [id: 6, base_character_id: 2, name: 'Arqueiro',  name_abreviation: 'AR', gp_character: 5]
]
characters.each do |ch|
  chquery = Character.find_or_initialize_by(id: ch.first[:id])
  chquery.base_character_id = ch.first[:base_character_id]
  chquery.name              = ch.first[:name]
  chquery.name_abreviation  = ch.first[:name_abreviation]
  chquery.gp_character      = ch.first[:gp_character]
  chquery.save!
end
