class BrandI18nsController < ApplicationController
  before_action :set_brand_i18n, only: [:edit, :update, :destroy]

  def index
    @brand_i18ns = BrandI18n.all
  end

  def new
    @brand_i18n = BrandI18n.new
  end

  def create
    @brand_i18n = BrandI18n.new(voice_params)
    if @brand_i18n.save
      redirect_to brand_i18ns_path, notice: 'Voice was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @brand_i18n.update(brand_i18n_params)
      redirect_to voices_path, notice: 'Voice was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @brand_i18n.destroy
    redirect_to brand_i18ns_path, notice: 'Voice was successfully destroyed.'
  end

  private

  def set_brand_i18n
    @brand_i18n = BrandI18n.find(params[:id])
  end

  def brand_i18n
    params.require(:voice).permit(:name, :brand_id, :locale)
  end
end
