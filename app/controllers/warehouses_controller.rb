class WarehousesController < ApplicationController
  before_action :set_warehouse, only: [:show, :edit, :update]
  
  def index
    @warehouses = Warehouse.all
  end

  def show
    @warehouse
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    warehouse = Warehouse.create(warehouse_params)
    warehouse.save

    redirect_to warehouses_path, notice: "#{warehouse.name} created successfully."
  end

  def edit
    @warehouse
  end

  def update
    @warehouse.update(warehouse_params)
    @warehouse.save

    redirect_to warehouse_path(@warehouse.id), notice: "Warehouse updated successfully."
  end

  private

  def set_warehouse
    if Warehouse.exists?(params[:id])
      @warehouse = Warehouse.find(params[:id])
    else
      redirect_to warehouses_path, alert: "Warehouse does not exist."
    end
  end

  def warehouse_params
    params.require(:warehouse).permit(:name)
  end
end