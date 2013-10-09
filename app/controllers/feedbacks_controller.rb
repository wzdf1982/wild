class FeedbacksController < ApplicationController
  before_action :require_login

  layout 'mobile'
  def index
    @activities = Activity.where(" column_span = 2" ).order("start_time asc, position asc")
  end

  def show
    @activity = Activity.includes(:questions => :answers).find(params[:id])

    @answers = {}
    @activity.answers.each do |answer|
      @answers[answer.question.id] = answer if answer.user_id == current_user
    end

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

    redirect_to schedule_path(answer.question.activity)
  end
end
