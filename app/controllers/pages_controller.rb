class PagesController < ApplicationController
  def home
    @brands = Brand.all.includes(:area)
  end

  def about
  end

  def contact
  end

  def ctrl_panel
  end
end
