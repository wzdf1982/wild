class FeedbacksController < ApplicationController
  def index
    @activities = Activity.where(" speakers != '' ").order("start_time asc, position asc")
  end

  def show
    @activity = Activity.includes(:questions => {:answers => :responses}).find(params[:id])
    @responses = {}
    @activity.responses.each do |r|
      @responses[r.answer.question.id] = r if r.user_id == current_user
    end
  end

  def create
    success = true
    response = ''

    params.each do |key, value|
      if key =~ /question-\d+/
        response = Response.where(question_id: key.split("-").last, user_id: current_user )
        unless response.empty?
          response = response.last
          response.update_attributes(
            question_id: key.split("-").last,
            answer_id: value.split("-").last,
            user_id: current_user
          )
        else
          response = Response.new(
            question_id: key.split("-").last,
            answer_id: value.split("-").last,
            user_id: current_user
          )

          unless response.save
            success = false
          end
        end
      end
    end

    if success
      respond_to do |format|
        format.html { redirect_to feedbacks_url }
        format.js
      end
    end

  end
end
