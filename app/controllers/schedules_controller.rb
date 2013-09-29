class SchedulesController < ApplicationController
  def index
    start_times = Activity.all.group(:start_time).select(:start_time)

    puts start_times
    @groups = []
    start_times.each do |time|
      @groups << Activity.where(start_time: time.start_time).order('position')
    end
  end
end
