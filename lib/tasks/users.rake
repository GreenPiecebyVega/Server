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

    # Create jwt
    # This will be genereted by web_application after_create
	  # Just the web application domain IP and Unreal Engine Client IP will comunicate with this application
    # Apenas usuários requisitarão ao servidor
    # Usuário podem ter acesso mestre controlado pelo pundit
    payload = { id: "#{user.id};#{Time.now.to_i}" }
    secret = YAML.load_file(Rails.root.join('app', 'controllers', 'api', 'config.yml'))
    user.jwt_token = JWT.encode(payload, secret['gp']['secret'], 'HS256')
    user.save!

    puts 'Master dev Criado. | Senha:: gpmaster | E-mail:: greenpiecemmorpg@gmail.com'
    puts "JWT Account Token: #{user.jwt_token}"
  end
end
