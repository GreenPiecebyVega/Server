# Green Piece by VegaSoft

# Creating ur dev account
```console
rake users:create_dev && rails s
```
# Testes Iniciais
curl -H "Content-Type: application/json" -XGET http://localhost:3000/api/v1/posts

# Generating
rails g scaffold Api::V1::Post title:string content:text

GP Conventional Docs
1. **Ruby**
  [Official Style Guide](https://rubystyle.guide/)

2. **Rails**
  [Official Style Guide](https://rails.rubystyle.guide/)

3. **Rubocop**
  [Documentation](https://docs.rubocop.org/rubocop/)
  [Usage](https://docs.rubocop.org/rubocop/usage/basic_usage.html)   

4. **Rspec**
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

### Rspec test enviroment
Usaremos o ambiente de test para rodas nossos testes com rspec, dessa forma, o banco de dados do ambiente de desenvolvimento não sofrerá mudanças indesejáveis e não será afetado pelo database_cleaner-active_record gem.  

* Just sets up ur test database currently called by app_test if already not prepared
```console
  rake db:test:prepare
```   
* Run migrate if needed
```console
  rails db:migrate RAILS_ENV=test
```   
* Running all specs
```console
  RAILS_ENV=test rspec
```   
* Running single spec
```console
  RAILS_ENV=test rspec spec/models/some_model_spec.rb
```   
* **IMPOORTANT**: If you run rspec in development enviroment his **data will be lost**, so make sure to set RAILS_ENV=test plus rspec 
command.   
* We do that because we want to run spec from development. Of course is included on best pratices by default convention.
* **RSpec não roda em ambiente de produção.** raises 'The Rails environment is running in production mode!'

### Helpers
We can simply write an alias to overwrite the rspec command adding the following to ~/.bashrc file, after this, save and source ~/.bashrc to make the alias avaliable, on the current bash.   
* **The alias will be avaliable in a new wsl instance too**.
```console
  alias rspec="RAILS_ENV=test rspec"
```   
### Use binding.pry for debugging

* Here the application test will stop and u will have acess to the response, by exit, the test will continue
```console
  get current_usuario.root_path
  binding.pry
  expect(response).to have_http_status(200)
```

* Rubocop just on modified files through git
```console
  git ls-files -m | xargs ls -1 2>/dev/null | grep '\.rb$'
```
```console
  git ls-files -m | xargs ls -1 2>/dev/null | grep '\.erb$'
```
* Adding | xargs rubocop -a
```console
  git ls-files -m | xargs ls -1 2>/dev/null | grep '\.rb$' | xargs rubocop -a
```
