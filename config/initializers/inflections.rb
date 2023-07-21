# frozen_string_literal: true

ActiveSupport::Inflector.inflections do |inflect|
  inflect.clear

  inflect.plural(/$/, 's')
  inflect.plural(/(s)$/i, '\1')
  inflect.plural(/^(paí)s$/i, '\1ses')
  inflect.plural(/(z|r)$/i, '\1es')
  inflect.plural(/al$/i,  'ais')
  inflect.plural(/el$/i,  'eis')
  inflect.plural(/ol$/i,  'ois')
  inflect.plural(/ul$/i,  'uis')
  inflect.plural(/([^aeou])il$/i, '\1is')
  inflect.plural(/m$/i, 'ns')
  inflect.plural(/^(japon|escoc|ingl|dinamarqu|fregu|portugu)ês$/i, '\1eses')
  inflect.plural(/^(|g)ás$/i, '\1ases')
  inflect.plural(/ão$/i, 'ões')
  inflect.plural(/^(irm|m)ão$/i, '\1ãos')
  inflect.plural(/^(alem|c|p)ão$/i, '\1ães')

  # Sem acentos...
  inflect.plural(/ao$/i, 'oes')
  inflect.plural(/^(irm|m)ao$/i, '\1aos')
  inflect.plural(/^(alem|c|p)ao$/i, '\1aes')

  inflect.singular(/([^ê])s$/i, '\1')
  inflect.singular(/^(á|gá|paí)s$/i, '\1s')
  inflect.singular(/(r|z)es$/i, '\1')
  inflect.singular(/([^p])ais$/i, '\1al')
  inflect.singular(/eis$/i, 'el')
  inflect.singular(/ois$/i, 'ol')
  inflect.singular(/uis$/i, 'ul')
  inflect.singular(/(r|t|f|v)is$/i, '\1il')
  inflect.singular(/ns$/i, 'm')
  inflect.singular(/sses$/i, 'sse')
  inflect.singular(/^(.*[^s]s)es$/i, '\1')
  inflect.singular(/ães$/i, 'ão')
  inflect.singular(/aes$/i, 'ao')
  inflect.singular(/ãos$/i, 'ão')
  inflect.singular(/aos$/i, 'ao')
  inflect.singular(/ões$/i, 'ão')
  inflect.singular(/oes$/i, 'ao')
  inflect.singular(/(japon|escoc|ingl|dinamarqu|fregu|portugu)eses$/i, '\1ês')
  inflect.singular(/^(g|)ases$/i, '\1ás')

  # Incontáveis
  inflect.uncountable %w[tórax tênis ônibus lápis fênix]

  # Game Mode #
  inflect.irregular('game_mode', 'game_modes')
  inflect.irregular('GameMode', 'GameModes')

  # User #
  inflect.irregular('user', 'users')
  inflect.irregular('User', 'Users')

  # User Bans #
  inflect.irregular('user_ban', 'user_bans')
  inflect.irregular('UserBan', 'UserBans')

  # Base Characters #
  inflect.irregular('base_character', 'base_characters')
  inflect.irregular('BaseCharacter', 'BaseCharacters')

  # Character #
  inflect.irregular('character', 'characters')
  inflect.irregular('Character', 'Characters')

  # User Characters #
  inflect.irregular('user_character', 'user_characters')
  inflect.irregular('UserCharacter', 'UserCharacters')

  # Characters Bans #
  inflect.irregular('user_character_ban', 'user_character_bans')
  inflect.irregular('UserCharacterBan', 'UserCharacterBans')

  # Character Inventory #
  inflect.irregular('user_character_inventory', 'user_characters_inventory')
  inflect.irregular('UserCharacterInventory', 'UserCharactersInventory')
end
