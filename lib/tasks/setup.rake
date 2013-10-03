namespace :agile do
  desc "create acitivities from yaml"
  task :create_activity => :environment do
    Activity.delete_all
    activities = YAML.load_file("#{Rails.root}/config/activity.yml")
    activities.each do |key, activity|
      activity.delete_if { |k,v| v == " - " }
      activity = Hash[activity.map { |k, v| [k.underscore.sub(" ", "_").to_sym, v =~ /^\d+$/ ?  v.try(:to_i) : v] }]
      activity = Hash[activity.map { |k, v| [ k, k.to_s =~ /time$/ ?  DateTime.strptime( v, "%m/%d/%Y %H:%M") : v] }]
      puts activity.inspect
      Activity.create(activity)
    end
  end

  desc "Create the feedback question and answers for each activity."
  task :create_feedback => :environment do

    QUESTIONS = [
      'Question 1. xxxxxxxxxxxxxxxxxxx.',
      'Question 2. xxxxxxxxxxxxxxxxxxx.',
      'Question 3. xxxxxxxxxxxxxxxxxxx.'
    ]

    ANSWERS = [
      'terrible',
      'satisfy',
      'excellent'
    ]

    activities = Activity.where("speakers != ''")

    activities.each do |activity|
      QUESTIONS.each do |question|
        q = Question.new(title: question)
        ANSWERS.each { |answer| q.answers.build(name: answer)  }
        activity.questions << q
      end
    end
  end

  desc "Drop all the question and answers."
  task :drop_feedback => :environment do
    Answer.delete_all
    Question.delete_all
    Response.delete_all
  end
end
