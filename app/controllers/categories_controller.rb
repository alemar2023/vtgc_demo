class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @categories = Category.all.includes(:eng_translation, children: [:eng_translation, children: :eng_translation ], ).where(parent_id: nil)


  end

  def show
  end
  def new
    @category = Category.new
    @category_i18n = @category.category_i18ns.build

  end
  def edit
  end

  def create


    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save

=begin
        name = category_params[:name].to_s
        locale = category_params[:locale].to_s
        category_id = category_params[:category_id].to_s


        puts "nome: #{name}"
        puts "locale: #{locale}"
        puts "category_id: #{category_id}"
         byebug
=end
        format.html { redirect_to categories_path, notice: "Category was successfully created" }
        format.json { render :show , status: :created, location: @category}
      else
        format.html { render :new, status: :unprocessable_entity}
        format.json { render json: @category.errors, status: :unprocessable_entity}
      end
    end
  end



  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to categories_url, notice: "Category was successfully update"}
        format.json { render :show, status: ok, location: @category}
      else
        format.html { render :edit, status: :unprocessable_entity}
        format.json { render json: @category.errors, status: :unprocessable_entity}
      end
    end
  end
  def destroy
    @category.destroy!

    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category was successfully destroyed"}
      format.json { head :no_content}
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:parent_id, category_i18ns_attributes: [:id, :name, :locale])
  end


end