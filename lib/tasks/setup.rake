namespace :agile do
  desc "create acitivities from yaml"
  task :create_activity => :environment do
    Activity.delete_all
    activities = YAML.load_file("#{Rails.root}/config/activity.yml")
    activities.each do |key, activity|
      room = ''
      activity.delete_if { |k,v| v == " - " }
      activity = Hash[activity.map { |k, v| [k =~ /^Room/ ?  'room' : k, k =~ /^Room/ && v != nil ? room = room + k + ': ' + v + "\n"  : v ] }]
      activity = Hash[activity.map { |k, v| [k.underscore.sub(" ", "_").to_sym, v =~ /^\d+$/ ?  v.try(:to_i) : v] }]
      activity = Hash[activity.map { |k, v| [ k, k.to_s =~ /time$/ ?  DateTime.strptime( v, "%m/%d/%Y %H:%M") : v] }]

      puts activity.inspect
      Activity.create(activity)
    end
  end

  desc "Create the feedback question and answers for each activity."
  task :create_feedback => :environment do

    QUESTIONS = [
      '1. What’s your key learning from this session?',
      '2. What advice do you have to the speaker?',
      '3. Other comments?'
    ]

    activities = Activity.where("speakers != ''")

    activities.each do |activity|
      QUESTIONS.each do |question|
        q = Question.new(title: question)
        activity.questions << q
      end
    end
  end

  desc "Drop all the question and answers."
  task :drop_feedback => :environment do
    Answer.delete_all
    Question.delete_all
  end
end
