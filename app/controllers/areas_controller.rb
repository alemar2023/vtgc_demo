class AreasController < ApplicationController

  before_action :set_area, only: %i[ show edit update destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @areas = Area.all
  end
  def show
  end

  def new
    @area = Area.new
  end
  def edit
  end

  def create
    @area = Area.new(area_params)

    respond_to do |format|
      if @area.save
        format.html { redirect_to brand_url(@area), notice: "Market Area successfully created." }
        format.json { render :show, status: :created, location: @area }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @area.error, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @area.update(arae_params)
        format.html { redirect_to brands_url, notice: "Market Area successfully updated."}
        format.json { render :sho, status: :ok, location: @area}
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @area.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @area.destroy!

    respond_to do |format|
      format.html { redirect_to areas_url, notice: "Market Area successfully destroyed"}
      format.json { head :no_content}
    end
  end

  private

  def set_area
    @area = Area.find(params[:id])
  end
  def area_params
    params.require(:area).permit(:name)
  end

end



