class DecksController < ApplicationController
  def index
  end
  
  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(deck_params)

    if @deck.save
      flash[:notice] = "Deck has been created."
      redirect_to @deck
    else
      # nothing yet
    end
  end

  def show
    @deck = Deck.find(params[:id])
  end

  private

    def deck_params
      params.require(:deck).permit(:name)
    end
end
