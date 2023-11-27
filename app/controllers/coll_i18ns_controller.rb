class CollI18nsController < ApplicationController
  before_action :set_collection
  before_action :set_col_i18nn , only: %i[show edit update destroy]



  def new
    @coll_i18n = CollI18n.new
  end
  def edit
  end

  def create

    @coll_i18n = CollI18n.new(coll_i18n_params)

    respond_to do |format|
      if @coll_i18n.save
        format.html { redirect_to collection_path(@collection), notice: "Blueprint Translation successfully created" }
        format.json { render json: @coll_i18n, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coll_i18n.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @coll_i18n.update(coll_i18n_params)
        format.html { redirect_to collecttion_path(@collection), notice: "Blueprint Translation successfully updated" }
        format.json { render json: @coll_i18n, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coll_i18n.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private

  def set_collection
    @collection = Collection.find(params[:collection_id])
  end
  def set_coll_i18n
    @coll_i18n = CollI18n.find(params[:id])
  end
  def set_coll_i18n_params
    params.require(:coll_i18n).permit(:collection_id, :name, :locale)
  end


end