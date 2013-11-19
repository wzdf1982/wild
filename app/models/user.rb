class User < ActiveRecord::Base
    has_many :feedbacks
    has_many :responses
    has_many :appointments
    has_many :activities, through: :appointments

    validates :name, format: { with: /\A[a-zA-Z]{5,8}\z/, message: "only a validate Ericsson user id" }

    before_save do
      self.name = name.upcase
    end
end
