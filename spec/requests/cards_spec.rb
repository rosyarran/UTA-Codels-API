require 'rails_helper'

RSpec.describe 'Codels API', type: :request do
  # initialize test data 
  let!(:cards) { create_list(:card, 10) }
  let(:card_id) { cards.first.id }

  # Test suite for GET /cards
  describe 'GET /cards' do
    # make HTTP get request before each example
    before { get '/cards' }

    it 'returns cards' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /cards/:id
  describe 'GET /cards/:id' do
    before { get "/cards/#{card_id}" }

    context 'when the record exists' do
      it 'returns the card' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(card_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:card_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find card/)
      end
    end
  end

  # Test suite for POST /cards
  describe 'POST /cards' do
    # valid payload
    let(:valid_attributes) { { title: 'Learn Elm', created_by: '1' } }

    context 'when the request is valid' do
      before { post '/cards', params: valid_attributes }

      it 'creates a card' do
        expect(json['title']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/cards', params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Created by can't be blank/)
      end
    end
  end

  # Test suite for PUT /cards/:id
  describe 'PUT /cards/:id' do
    let(:valid_attributes) { { title: 'Shopping' } }

    context 'when the record exists' do
      before { put "/cards/#{card_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /cards/:id
  describe 'DELETE /cards/:id' do
    before { delete "/cards/#{card_id}" }

    it 'returns status code 204e' do
      expect(response).to have_http_status(204)
    end
  end
end