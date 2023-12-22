class ItemsController < ApplicationController

  before_action :set_item, only: %i[ show update edit destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.includes(:area, :brand, :collection, :rarity, :property, :en_translation, item_values: :property, category: :category_i18ns)
    #@items = Item.all
    #@items = Item.includes(blueprint_values: :property).all
  end

  def show
    @item = Item.find(params[:id])
    @item_values = @item.item_values.includes(:property)
    @item_i18ns = @item.item_i18ns

    #@brand_label = @item.brand.labels.find_by(locale: 'EN')
    @brand_name = @item.enbra_translation.name
    @collection_name = @item.collection.encoll_translation.name
    @item_name = @item.en_translation.name
    @category_name = @item.category.eng_translation.name
  end


  def new
    @item = Item.new
    @item.item_i18ns.build
    @item.item_values.build

  end


  def edit
  end


def create
  @item = Item.new(item_params)

  respond_to do |format|
    if @item.save
      format.html { redirect_to item_path, notice: "Blueprint successfully created" }
      format.json { render :show, status: :created, location: @item }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @item.errors, status: :unprocessable_entity }
    end
  end
end

  def update
    respond_to do |format|
      if @item.update(blueprint_params)
        format.html { redirect_to items_url, notice: "Item successfully updated" }
        format.json { render json:, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy!

    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed" }
      format.json { head :non_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(
      :id, :area_id, :brand_id, :collection_id, :image, :category_id,
      item_i18ns_attributes: [:id, :name, :locale],
      item_values_attributes: [:id, :property_id, :value],

    )
  end
end