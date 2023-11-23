class BrandsController < ApplicationController
  #layout 'brandx'
  before_action :set_brand, only: %i[ show edit update destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @brands = Brand.all.includes(:area)
  end
  def show
  end

  def new
    @brand = Brand.new
  end
  def edit
  end

  def create
    @brand = Brand.new(brand_params)

    respond_to do |format|
      if @brand.save
        format.html { redirect_to brand_url(@brand), notice: "Brand successfully created." }
        format.json { render :show, status: :created, location: @brand }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @brand.error, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @brand.update(brand_params)
        format.html { redirect_to brands_url, notice: "Brand  successfully updated"}
        format.json { render :sho, status: :ok, location: @brand}
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @brand.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @brand.destroy!

    respond_to do |format|
      format.html { redirect_to brands_url, notice: "Brand  successfully destroyed"}
      format.json { head :no_content}
    end
  end

  private

  def set_brand
    @brand = Brand.find(params[:id])
  end
  def brand_params
    params.require(:brand).permit(:name, :area_id)
  end

end