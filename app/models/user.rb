class User < ActiveRecord::Base
    validates :name, format: { with: /\A[a-zA-Z]{5,8}\z/, message: "only a validate Ericsson user id" }

    before_save do
      self.name = name.upcase
    end
end
