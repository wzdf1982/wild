class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :activity
  belongs_to :user
  has_many :responses
end
