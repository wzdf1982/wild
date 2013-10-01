class FeedbacksController < ApplicationController
  def index
    @activities = Activity.where(" speakers != '' ").order("start_time asc, position asc")

    answers = ['Terrible','Bad','Average','Good','Exellent']
    questions = ['qustion1','qustion2']

    @activities.each do |active|
      questions.each do |q|
        question = active.questions.build(title: q)
        answers.each { |answer| question.answers.build(name: answer) }
      end
    end

  end

  def show
  end
end
