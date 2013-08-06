class DecksController < ApplicationController
  def index
    @decks = current_user.decks
  end
  
  def new
    @deck = Deck.new
  end

  def create
    @deck = current_user.decks.build(deck_params)

    if @deck.save
      flash[:success] = "Deck has been created."
      redirect_to @deck
    else
      flash.now[:alert] = "Deck has not been created."
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
      flash[:success] = "Deck has been updated."
      redirect_to @deck
    else
      flash.now[:alert] = "Deck has not been updated."
      render action: "edit"
    end
  end

  def destroy
    @deck = Deck.find(params[:id])
    @deck.destroy

    redirect_to decks_path, notice: "Deck has been destroyed."
  end

  private

    def deck_params
      params.require(:deck).permit(:name)
    end
end
