# Green Piece by VegaSoft

Starts docker   
```console
sudo service docker start
```
Build  
```console
docker compose build --no-cache
```
Up   
```console
docker compose up
```
Containers Bash   
```console
docker exec -it greenpiecebackend-server-1 bash
```

## Running sidekiq for debugging on container
```console
bundle exec sidekiq --environment development -C config/sidekiq.yml
```

## Mailer Preview
We are using letter_opening gem, we can preview e-mail beside sending them   
Visible at 'tmp', 'mailers_preview'

## Developer Annotations
```console
annotate
```   
```console
annotate --delete 
```

## GP Conventional Docs
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
