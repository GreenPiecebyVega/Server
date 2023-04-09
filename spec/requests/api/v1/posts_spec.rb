# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/api/v1/posts', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Api::V1::Post. As you add validations to Api::V1::Post, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # Api::V1::PostsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Api::V1::Post.create! valid_attributes
      get api_v1_posts_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      post = Api::V1::Post.create! valid_attributes
      get api_v1_post_url(post), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Api::V1::Post' do
        expect do
          post api_v1_posts_url,
               params: { api_v1_post: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Api::V1::Post, :count).by(1)
      end

      it 'renders a JSON response with the new api_v1_post' do
        post api_v1_posts_url,
             params: { api_v1_post: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Api::V1::Post' do
        expect do
          post api_v1_posts_url,
               params: { api_v1_post: invalid_attributes }, as: :json
        end.to change(Api::V1::Post, :count).by(0)
      end

      it 'renders a JSON response with errors for the new api_v1_post' do
        post api_v1_posts_url,
             params: { api_v1_post: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested api_v1_post' do
        post = Api::V1::Post.create! valid_attributes
        patch api_v1_post_url(post),
              params: { api_v1_post: new_attributes }, headers: valid_headers, as: :json
        post.reload
        skip('Add assertions for updated state')
      end

      it 'renders a JSON response with the api_v1_post' do
        post = Api::V1::Post.create! valid_attributes
        patch api_v1_post_url(post),
              params: { api_v1_post: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the api_v1_post' do
        post = Api::V1::Post.create! valid_attributes
        patch api_v1_post_url(post),
              params: { api_v1_post: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested api_v1_post' do
      post = Api::V1::Post.create! valid_attributes
      expect do
        delete api_v1_post_url(post), headers: valid_headers, as: :json
      end.to change(Api::V1::Post, :count).by(-1)
    end
  end
end
