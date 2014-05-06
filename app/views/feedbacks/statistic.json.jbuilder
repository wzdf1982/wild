json.questions @activity.questions do |question|
  json.title question.title
  json.answers question.answers.group(:content).count
end