class CardsController < ApplicationController
  before_action :set_deck
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def new
    @card = @deck.cards.build
  end

  def create
    @card = @deck.cards.create(card_params)
    if @card.save
      redirect_to [@deck, @card], notice: "Card has been created."
    else
      flash.now[:alert] = "Card has not been created."
      render action: "new"
    end
  end

  def show
  end

  private
    def set_deck
      @deck = Deck.find(params[:deck_id])
    end

    def set_card
      @card = @deck.cards.find(params[:id])
    end
    
    def card_params
      params.require(:card).permit(:title, :description, :link)
    end
end