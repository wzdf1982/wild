class Votee < ActiveRecord::Base
	acts_as_votable

	def enabled?
		self.id == self.class.enabled_id
	end

	def self.enabled_id=(id)
		$enabled_id = id ? id.to_s : id
	end

	def self.enabled_id
		$enabled_id && $enabled_id.to_i
	end
end
