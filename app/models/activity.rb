class Activity < ActiveRecord::Base
  has_many :questions
  has_many :answers, :through => :questions

  has_many :appointments
  has_many :users, through: :appointments

  def off_set?
    !off_set.blank?
  end
end
