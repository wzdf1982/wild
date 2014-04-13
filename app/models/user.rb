class User < ActiveRecord::Base
    has_many :feedbacks
    has_many :responses
    has_many :appointments
    has_many :activities, through: :appointments

    validates :name, format: { with: /\A[a-zA-Z]{5,8}\z/, message: "only a validate Ericsson user id" }
    
    acts_as_voter
    
    ROLES = %w[administrator voter]

    before_save do
      self.name = name.upcase
    end

    def roles=(roles)
    	self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
    end

    def roles
    	ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
    end

    def is?(role)
    	roles.include?(role.to_s)
    end
end
