class DecksController < ApplicationController
  def index
    @decks = Deck.all
  end
  
  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(deck_params)

    if @deck.save
      redirect_to @deck, notice: "Deck has been created."
    else
      flash[:alert] = "Deck has not been created."
      render action: "new"
    end
  end

  def show
    @deck = Deck.find(params[:id])
  end

  def edit
    @deck = Deck.find(params[:id])
  end

  def update
    @deck = Deck.find(params[:id])
    if @deck.update(deck_params)
      redirect_to @deck, notice: "Deck has been updated."
    else
      flash[:alert] = "Deck has not been updated."
      render action: "edit"
    end
  end


  private

    def deck_params
      params.require(:deck).permit(:name)
    end
end
