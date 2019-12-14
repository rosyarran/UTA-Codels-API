class CardsController < ApplicationController
  before_action :set_card, only: [:show, :update, :destroy]

  # GET /cards
  def index
    @cards = Card.all
    json_response(@cards)
  end

  # POST /cards
  def create
    @card = Card.create!(card_params)
    json_response(@card, :created)
  end

  # GET /cards/:id
  def show
    json_response(@card)
  end

  # PUT /cards/:id
  def update
    @card.update(card_params)
    head :no_content
  end

  # DELETE /cards/:id
  def destroy
    @card.destroy
    head :no_content
  end

  private

  def card_params
    # whitelist params
    params.permit(:title, :description, :section, :url, :image_url, :tags)
  end
  
  def set_card
    @card = Card.find(params[:id])
  end
end
