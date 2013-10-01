class Question < ActiveRecord::Base
  belongs_to :activity
  has_many :answers
end
