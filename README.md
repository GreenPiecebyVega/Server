# Green Piece by VegaSoft :brazil:	

Building and starting development enviroment
```console
docker compose up -d --build
```

Containers Bash   
```console
docker compose exec server bash
docker compose exec server_test bash
```

Generating Serializers
[Gem Doc's](https://github.com/rails-api/active_model_serializers/tree/v0.10.6/docs)   
[Getting Started](https://github.com/rails-api/active_model_serializers/blob/v0.10.6/docs/general/getting_started.md)   
[Errors](https://github.com/rails-api/active_model_serializers/blob/v0.10.6/docs/jsonapi/errors.md)   
```console
docker compose exec server rails g serializer SingularModelName
```

## Mailer Preview
We are using letter_opening gem, we can preview e-mail beside sending them   
Visible at 'tmp', 'mailers_preview'

## GP Conventional Docs :recycle:	
1. **Ruby**
  [Official Style Guide](https://rubystyle.guide/)

2. **Rails**
  [Official Style Guide](https://rails.rubystyle.guide/)

3. **Rubocop**
  [Documentation](https://docs.rubocop.org/rubocop/)
  [Usage](https://docs.rubocop.org/rubocop/usage/basic_usage.html)   

4. **Rspec**
  ```console
  docker compose exec server_test rspec
  ```
  [Boas Práticas](https://www.betterspecs.org)  
  Rspec is composed of multiple libraries [rspec-core](https://rubydoc.info/gems/rspec-core/), [rspec-expectations](https://rubydoc.info/gems/rspec-expectations) e [rspec-mocks](https://rubydoc.info/gems/rspec-mocks)   
  [Documentation](https://relishapp.com/rspec/docs)  
  [let](https://relishapp.com/rspec/rspec-core/docs/helper-methods/let-and-let)

5. **Rspec Rails**
  [Documentation](https://rubydoc.info/gems/rspec-rails/RSpec/Rails)
  [Matchers](https://rubydoc.info/gems/rspec-rails/RSpec/Rails/Matchers)
  * É altamente recomendável utilizar requests para testes de controllers não só porque verbos htps estarão disponíveis como também testes específicos de renderizações de views.
  
6. **Factories**
  [Boas Práticas](https://www.betterspecs.org/#factories)   
  [FactoryBot Documentation](https://github.com/thoughtbot/factory_bot/blob/main/GETTING_STARTED.md#defining-factories)   
  [Cheatset](https://devhints.io/factory_bot)

7. **Shoulda Matchers**
  [Documentation](https://github.com/thoughtbot/shoulda-matchers#usage)

8. **Pundit Matchers**
  [Documentation](https://github.com/punditcommunity/pundit-matchers#matchers)

### Use binding.pry for debugging with docker without respec
To be able to use pry we have to:
```console
docker attach server
```
* Multi location debug in one execution
```console
  get current_usuario.root_path
  binding.pry
  expect(response).to have_http_status(200)
```

### Docker cheatset
```console
docker compose run server env
docker compose run server_test env
```

Made with :heart:. Todos os direitos reservados. Copyright © Vega Soft :star:.

## Todo
- Adicionar bloqueio de personagem has_one
- Adicionar bloqueio de conta has_one
- retirar bonus premium de user e passar para a praemium table.
- Adicionar premium table { category {:diamante, :gold} data_expiracao: datetime }, belongs_to :user and user has_one: premium and add a callback on before_create user also add a 3 days premium.
- Adicionar titles tables { :title, :description, subject: { :war, :turibuluns(dungeons), :general, :pvp, :pvm}}, belongs_to :user_character and user_character has_many titles