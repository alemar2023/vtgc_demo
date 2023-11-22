class ItemValuesController < ApplicationController
  before_action :set_item
  before_action :set_item_value, only: %i[ show edit update destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @item_value = ItemValue.new
  end

  def edit
  end

  def create
    @item_value = ItemValue.new(item_value_params)

    respond_to do |format|
      if @item_value.save(item_value_paramas)
        format.html { redirect_to item_path(@item), notice: "Item value successfully created" }
        format.json { render json: @item, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def update
    respond_to do |format|
      if @item_value.update(item_value_paramas)
        format.html { redirect_to item_path(@item), notice: "Item value successfully updated" }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_item_value
    @item_value = ItemValue.find(params[:id])
  end


  def item_value_params
    params.require(:itemt_value).permit(:value, :item_id, :property_id)
  end


end