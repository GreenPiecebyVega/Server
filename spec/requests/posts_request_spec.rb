require 'rails_helper'

RSpec.describe "api/v1/posts", type: :request do
  # Create
  context 'POST /api/v1/posts' do
    context 'without a user' do
      it 'returns a 401' do
        post '/api/v1/posts'
        expect(response).to have_http_status(401)
      end
    end

    context 'as a user' do
      it 'should let me create a post' do
        user = create_user
        headers = get_headers(user.username)
        url = '/api/v1/posts'
        post url, params: '{ "post": { "title": "post 1", "content": "content 1" } }', headers: headers
        parsed = JSON.parse(response.body, object_class: OpenStruct)
        expect(response).to have_http_status(200)
        expect(parsed.data.attributes.user.id).to eq(user.id)
      end
    end
  end

  # Destroy
  context 'DELETE /api/v1/posts/:id' do
    context 'without a user' do
      it 'returns a 401' do
        record = create_post
        delete "/api/v1/posts/#{record.id}"
        expect(response).to have_http_status(401)
      end
    end

    context 'as a user' do
      it 'should not let me destroy an post' do
        user = create_user
        user2 = create_user
        record = create_post({ user: user })
        url = "/api/v1/posts/#{record.id}"
        delete url, headers: get_headers(user2.username)
        expect(response).to have_http_status(404)
      end
    end

    context 'as a user (owner)' do
      it 'should let me destroy a post' do
        user = create_user
        record = create_post({ user: user })
        url = "/api/v1/posts/#{record.id}"
        delete url, headers: get_headers(user.username)
        expect(response).to have_http_status(200)
      end
    end
  end

  # Index
  context 'GET /api/v1/posts' do
    it 'Returns a status of 200 with a list of posts' do
      user = create_user
      create_post({ user: user })
      create_post({ user: user })
      get '/api/v1/posts'
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(response).to have_http_status(200)
      expect(parsed.data.size).to eq(2)
    end
  end

  # Show
  context 'GET /api/v1/posts/:slug' do
    it 'Returns a status of 404 if does not exist' do
      get '/api/v1/posts/name'
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(response).to have_http_status(404)
    end

    it 'Returns post if sending back slug' do
      user = create_user(username: 'testtest')
      record = create_post({ user: user })
      get "/api/v1/posts/#{record.slug}"
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(response).to have_http_status(200)
      expect(parsed.data.id.to_i).to eq(record.id)
    end

    it 'Returns a post if sending back id' do
      user = create_user(username: 'testtest')
      record = create_post({ user: user })
      get "/api/v1/posts/#{record.id}"
      parsed = JSON.parse(response.body, object_class: OpenStruct)
      expect(response).to have_http_status(200)
      expect(parsed.data.id.to_i).to eq(record.id)
    end
  end

  # Update
  context 'PUT /api/v1/posts/:id' do
    context 'without a user' do
      it 'returns a 401' do
        record = create_post
        url = "/api/v1/posts/#{record.id}"
        put url, params: '{ "post": { "title": "post updated 1" } }'
        expect(response).to have_http_status(401)
      end
    end

    context 'as a non-user of post' do
      it 'should not let me update a post' do
        user = create_user
        user2 = create_user
        record = create_post({ user: user })
        headers = get_headers(user2.username)
        url = "/api/v1/posts/#{record.id}"
        put url, params: '{ "post": { "title": "post updated 1" } }', headers: headers
        expect(response).to have_http_status(404)
      end
    end

    context 'as a post owner' do
      it 'should let me update a post' do
        user = create_user
        record = create_post({ user: user })
        headers = get_headers(user.username)
        url = "/api/v1/posts/#{record.id}"
        put url, params: '{ "post": { "title": "post updated 1" } }', headers: headers
        parsed = JSON.parse(response.body, object_class: OpenStruct)
        expect(response).to have_http_status(200)
        expect(parsed.data.attributes.title).to eq('post updated 1')
      end
    end
  end
end
