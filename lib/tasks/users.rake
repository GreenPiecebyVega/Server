# frozen_string_literal: true

namespace :users do
  desc 'Create GP master account.'
  task create_dev: [:environment] do
    user = User.new(
      email: 'greenpiecemmorpg@gmail.com',
      unique_session_id: 'master',
      password: 'gpmaster',
      password_confirmation: 'gpmaster',
      username: 'master',
      slug: 'master',
      nome: 'master',
      sobrenome: 'd3v',
      telefone: '5551997407755',
      data_nascimento: (Date.today - 18.years),
      perfil: 4
    )
    user.save!

    Api::V1::Post.create(title: 'asd', content: 'asd')

    puts 'Master dev Criado. | Senha:: gpmaster | E-mail:: greenpiecemmorpg@gmail.com'
  end
end
