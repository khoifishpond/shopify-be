class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
    @item
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.create(item_params)
    item.save

    redirect_to items_path, notice: "#{item.name} created successfully."
  end

  def edit
    @item
  end

  def update
    @item.update(item_params)
    @item.save

    redirect_to item_path(@item.id), notice: "Item updated successfully."
  end

  def destroy
    @item.destroy

    redirect_to items_path, notice: "Item destroyed successfully."
  end

  private

  def set_item
    if Item.exists?(params[:id])
      @item = Item.find(params[:id])
    else
      redirect_to items_path, alert: "Item does not exist."
    end
  end

  def item_params
    params.require(:item).permit(:name, :quantity, :warehouse_id)
  end
end