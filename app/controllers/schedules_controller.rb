class SchedulesController < ApplicationController
   layout 'mobile'
   caches_page :index, :show

  def index
    start_times = Activity.all.group(:start_time).select(:start_time)
    @groups = []
    start_times.each do |time|
      @groups << Activity.where(start_time: time.start_time).order('position')
    end

    @max_column_span = Activity.all.select('column_span').max.column_span
  end

  def show
    @active = Activity.find(params[:id])
  end
end
