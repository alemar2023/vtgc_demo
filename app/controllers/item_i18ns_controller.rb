class ItemI18nsController < ApplicationController
  before_action :set_item
  before_action :set_item_i18n , only: %i[show edit update destroy]
  before_action :authenticate_user!, except: [:index, :show]



  def new
    @item_i18n = Item_i18n.new
  end

  def edit
  end
  def create
    @item_i18n =Item_i18n.new(item_i18n_params)
    respond_to do |format|
      if @item_i18n.save
        format.html { redirect_to item_path(@item), notice: "Items transaltion successfully created"}
        format.json { render json: @item_i18n, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item_i18n.errors, status: :unprocessable_entity }
      end
    end


  end

  def update
    respond_to do |format|
      if @item_i18n.update(item_i18n_params)
          format.html { redirect_to item_path(@item), notice: "Item translation successfully updated" }
          format.json { render :show, status: :ok, location: @item }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @item_i18n.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item_i18n.destroy!
    respond_to do |format|
      format.html { redirect_to item_i18ns_url, notice: "Item translation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def item_i18n
    @item_i18n = Item_i18n.find(params[:id])
  end

  def item_i18n_params
    params.require(:item_i18n).permit(:item_id, :name, :locale)
  end


end