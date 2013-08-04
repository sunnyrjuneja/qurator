class CardsController < ApplicationController
  before_action :set_deck
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def new
    @card = @deck.cards.build
  end

  def create
    @card = @deck.cards.create(card_params)
    if @card.save
      flash[:success] = "Card has been created."
      redirect_to [@deck, @card]
    else
      flash.now[:alert] = "Card has not been created."
      render action: "new"
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @card.destroy
    redirect_to @deck, notice: "Card has been deleted."
  end

  def update
    if @card.update(card_params)
      flash[:success] = "Card has been updated."
      redirect_to [@deck, @card]
    else
      flash.now[:alert] = "Card has not been updated."
      render action: "edit"
    end
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
