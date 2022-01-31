class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def edit
    @card = Card.find(params[:id])
  end

  def show
    @card = Card.find(params[:id])
  end

  def create
    @card = Card.new(params.require(:card).permit(:title, :id, :author, :memo, :price, :publisher))
    if @card.save
      flash[:notice] = "本を登録しました"
      redirect_to :cards
    else
      flash[:notice] = "本を登録できませんでした"
      render "new"
    end
  end

  def update
    @card = Card.find(params[:id])
    if @card.update(params.require(:card).permit(:title, :id, :author, :memo, :price, :publisher))
      flash[:notice] = "本情報を更新しました"
      redirect_to :cards
    else
      flash[:notice] = "本情報を更新できませんでした"
      render "edit"
    end
  end

  def delete
    @card = Card.find(params:id)
  end


end
