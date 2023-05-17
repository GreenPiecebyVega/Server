# Green Piece by VegaSoft :brazil:	

Building and starting development enviroment
```console
docker compose up -d --build
```
Containers Bash   
```console
docker compose exec -it server bash
```

Generating Serializers
[Gem Doc's](https://github.com/rails-api/active_model_serializers/tree/v0.10.6/docs)   
[Getting Started](https://github.com/rails-api/active_model_serializers/blob/v0.10.6/docs/general/getting_started.md)   
[Errors](https://github.com/rails-api/active_model_serializers/blob/v0.10.6/docs/jsonapi/errors.md)   
```console
docker compose exec -it server rails g serializer SingularModelName
```

Migrating
```console
docker compose exec -it server rails db:migrate
```
Seeding Defaults
- base_characters
- characters
```console
docker compose exec -it server rails db:seed
docker compose exec -it server rails db:seed RAILS_ENV=test
```

## Mailer Preview
We are using letter_opening gem, we can preview e-mail beside sending them   
Visible at 'tmp', 'mailers_preview'

## Todo
- Adicionar bloqueio de personagem has_one
- Adicionar bloqueio de conta has_one

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
  docker compose exec -it server rspec
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

### Use binding.pry for debugging with docker
To be able to use pry i have to:
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
```

* Made with :heart:. Todos os direitos reservados. Copyright © Vega Soft :star:.