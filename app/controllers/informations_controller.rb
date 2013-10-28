class InformationsController < ApplicationController
  layout 'mobile'
  def index
    @informations = Information.all
  end

  def show
    @information = Information.find(params[:id])
  end
end
