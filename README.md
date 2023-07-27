# Green Piece by VegaSoft :brazil:

Windows users has to set git autocrlf to input before **cloning the project**
```console
git config --global core.autocrlf input
```

## Quick Start
```console
docker compose up -d --build
```

## Containers Bash   
```console
docker compose exec server bash
docker compose exec tdd bash
```
## API Documentation   
http://localhost:3000/

## BackgroundJobs Dashboard   
username: developer   
password: developer   
http://localhost:3000/sidekiq

## Generating Serializers
[Gem Doc's](https://github.com/rails-api/active_model_serializers/tree/v0.10.6/docs)   
[Getting Started](https://github.com/rails-api/active_model_serializers/blob/v0.10.6/docs/general/getting_started.md)   
[Errors](https://github.com/rails-api/active_model_serializers/blob/v0.10.6/docs/jsonapi/errors.md)   
```console
docker compose exec server rails g serializer SingularModelName
```

## Mailer Preview
We are using letter_opening gem, so we can preview e-mail beside sending them on a test
Visible at 'tmp', 'mailers_preview'

## Green Piece Conventional Docs :recycle:	
1. **Ruby**
  [Official Style Guide](https://rubystyle.guide/)

2. **Rails**
  [Official Style Guide](https://rails.rubystyle.guide/)

3. **Rubocop**
  [Documentation](https://docs.rubocop.org/rubocop/)
  [Usage](https://docs.rubocop.org/rubocop/usage/basic_usage.html)   

4. **Rspec**
  ```console
  docker compose exec tdd rspec
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

9. **Faker**
[Documentation](https://www.rubydoc.info/gems/faker/)

10. **CPF/CNPJ Faker**
[Documentation](https://github.com/bernardo/cpf_faker#usage)


### Use binding.pry for debugging on development
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
docker compose exec server env
docker compose exec tdd env
```

### Rubocop just on modified files through git Adding | xargs rubocop -a
```console
  git ls-files -m | xargs ls -1 2>/dev/null | grep '\.rb$'
  git ls-files -m | xargs ls -1 2>/dev/null | grep '\.erb$'
  git ls-files -m | xargs ls -1 2>/dev/null | grep '\.rb$' | xargs rubocop -a
```

Made with :heart:. Todos os direitos reservados. Green Piece ID:929641795 Copyright © Vega Soft :star:.
