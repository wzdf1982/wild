class SchedulesController < ApplicationController
   layout 'mobile'
   before_action :require_login, except: [:index,:show]

  def index
    start_times = Activity.all.group(:start_time).select(:start_time)
    @groups = []
    start_times.each do |time|
      @groups << Activity.where(start_time: time.start_time).order('position')
    end

    @max_column_span = Activity.all.select('column_span').max.column_span
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def register
    @activity = Activity.find params[:id]

    if has_sub_session?
      whole_sessions_in_hour.each { |act| act.users << current_user_instance }
    else
      @activity.users << current_user_instance
    end

    render :show
  end

  def unregister
    @activity = Activity.find params[:id]
    puts has_sub_session?

    if has_sub_session?
      whole_sessions_in_hour.each { |act| act.users.destroy current_user_instance }
    else
      @activity.users.destroy current_user_instance
    end

    render :show
  end

  private
    def relative_activity
      @relative_activity ||= begin
        if ['20', '40'].include? @activity.start_time.strftime("%M")
          begin_time = @activity.start_time.change(min: 0)
          finish_time = @activity.start_time.change(min: 0) + 1.hour
          Activity.where(start_time: (begin_time...finish_time), background_color: @activity.background_color)
        end
      end
    end

    def min_is_00_20_40?
      ['00','20','40'].include? @activity.start_time.strftime("%M")
    end

    def has_sub_session?
      ! whole_sessions_in_hour.select { |session| ['20', '40'].include? session.start_time.strftime("%M") }.empty?
    end

    def begin_time
      @activity.start_time.change(min: 0)
    end

    def finish_time
      @activity.start_time.change(min: 0) + 1.hour
    end

    def whole_sessions_in_hour
      @whole_sessions_in_hour ||= Activity.where(start_time: (begin_time...finish_time), background_color: @activity.background_color)
    end
end
