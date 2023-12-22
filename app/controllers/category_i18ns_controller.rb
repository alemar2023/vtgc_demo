class CategoryI18nsController < ApplicationController
  before_action :set_category_i18n, only: [:edit, :update, :destroy]

  def index
    @category_i18ns = CategoryI18n.all
  end

  def new
    @category_i18n = CategoryI18n.new
  end

  def create
    @category_i18n = CategoryI18n.new(voice_params)
    if @category_i18n.save
      redirect_to category_i18ns_path, notice: 'Voice was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category_i18n.update(category_i18n_params)
      redirect_to voices_path, notice: 'Voice was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category_i18n.destroy
    redirect_to category_i18ns_path, notice: 'Voice was successfully destroyed.'
  end

  private

  def set_category_i18n
    @category_i18n = CategoryI18n.find(params[:id])
  end

  def category_i18n
    params.require(:voice).permit(:name, :category_id, :locale)
  end
end
