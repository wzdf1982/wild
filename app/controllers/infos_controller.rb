class InfosController < ApplicationController
  layout 'mobile'
  caches_page :overview, :registration, :security, :venue, :contact

  def overview
  end
end
