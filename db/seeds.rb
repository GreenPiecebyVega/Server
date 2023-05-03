# frozen_string_literal: true

# PERSONAGEM FINAL QUE HERDARÁ OS ATTRIBUTOS DA CLASSE E SUB-CLASSE
# assim poderemos modificar a base de todos personagems
# ou em cada sub-classe, para aumentar ou diminuir o dano ~> balancear
# players_characters = [
#  [ usuario_id: uid, character_id: cid, ]
# ]
# ATRIBUTOS BASE DA CLASSE
Character.delete_all
BaseCharacter.delete_all

base_characters = [
  [ id: 1, nome: "Física", gp_character_base: 0],
  [ id: 2, nome: "Mágica", gp_character_base: 1]
]
base_characters.each do |bs|
  bsquery = BaseCharacter.new(
    id: bs.first[:id],
    nome: bs.first[:nome],
    gp_character_base: bs.first[:gp_character_base]
  )
  bsquery.save!
end

# ATRIBUTOS BASE DA CADA SUB-CLASSE
characters = [
  [ id: 1, base_character_id: 1, nome: "Guerreiro", gp_character: 0],
  [ id: 2, base_character_id: 1, nome: "Guardião", gp_character: 1],
  [ id: 3, base_character_id: 2, nome: "Mago", gp_character: 2],
  [ id: 4, base_character_id: 2, nome: "Xanter", gp_character: 3],
  [ id: 5, base_character_id: 1, nome: "Duelista", gp_character: 4],
  [ id: 6, base_character_id: 2, nome: "Arqueiro", gp_character: 5]
]
characters.each do |ch|
  chquery = Character.new(
    id: ch.first[:id], 
    base_character_id: ch.first[:base_character_id],
    nome: ch.first[:nome],
    gp_character: ch.first[:gp_character]
  )
  chquery.save!
end

# END #