class FeedbacksController < ApplicationController
  before_action :require_login, except: [:index, :statistic]

  def index
    @activities = Activity.where("room not null").order("start_time asc, position asc")
  end

  def show
    @activity = Activity.includes(:questions => :answers).find(params[:id])

    @answers = {}
    @activity.answers.each do |answer|
      @answers[answer.question.id] = answer if answer.user_id == current_user
    end
  end

  def statistic
    @activity = Activity.includes(:questions => :answers).last

    # render json: @activity.answers
  end

  def create
    answer = ''

    params[:answers].each do |key, value|
      answers = Answer.where(question_id: key, user_id: current_user )
      unless answers.empty?
        answer = answers.last
        answer.update_attributes(
          question_id: key,
          content: value,
          user_id: current_user
        )
      else
        answer = Answer.new(
          question_id: key,
          content: value,
          user_id: current_user
        )

        answer.save
      end
    end

    redirect_back_or schedule_path(answer.question.activity)
  end
end
