mv ../1129InnvoDay1.csv 1129InnvoDay1.csv
rake db:drop && rake db:migrate
ruby script/csv2yml.rb 1129InnvoDay1.csv > config/activity.yml
rake agile:drop_feedback
rake agile:create_activity
rake agile:create_feedback
