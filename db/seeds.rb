# frozen_string_literal: true

# PERSONAGEM FINAL QUE HERDARÁ OS ATTRIBUTOS DA CLASSE E SUB-CLASSE
# assim poderemos modificar a base de todos personagems
# ou em cada sub-classe, para aumentar ou diminuir o dano ~> balancear
# players_characters = [
#  [ usuario_id: uid, character_id: cid, ]
# ]
# ATRIBUTOS BASE DA CLASSE
base_characters = [
  [ id: 0, nome: "Física", class: 0],
  [ id: 1, nome: "Mágica", class: 1]
]
base_characters.each do |bs|
  bsquery = BaseCharacter.new(
    id: bs[:id],
    nome: bs[:nome],
    class: bs[:class]
  )
  bsquery.save
end

# ATRIBUTOS BASE DA CADA SUB-CLASSE
characters = [
  [ base_character_id: 0, nome: "Guerreiro", class: 0],
  [ base_character_id: 0, nome: "Guardião", class: 1],
  [ base_character_id: 1, nome: "Mago", class: 2],
  [ base_character_id: 1, nome: "Xanter", class: 3],
  [ base_character_id: 0, nome: "Duelista", class: 4],
  [ base_character_id: 1, nome: "Arqueiro", class: 5]
]
characters.each do |ch|
  chquery = Character.new(
    base_character_id: ch[:base_character_id],
    id: ch[:id],
    nome: ch[:nome],
    class: ch[:class]
  )
  chquery.save
end

# END #