class Votee < ActiveRecord::Base
	acts_as_votable

	def enabled?
		EnabledVotee.take && self.id == EnabledVotee.take.votee_id
	end

	def self.enabled_id=(id)
		a = EnabledVotee.take 
		if a 
			a.update(votee_id: id)
			a.save
		else
			EnabledVotee.create(votee_id: id)
		end
	end

	def self.enabled_id
		EnabledVotee.take && EnabledVotee.take.votee_id
	end
end
