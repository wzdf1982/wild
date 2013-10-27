class InformationsController < ApplicationController
  def index
    @informations = Information.all
  end

  def show
  end
end
