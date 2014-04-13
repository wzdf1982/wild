class VotesController < ApplicationController
  layout 'mobile'

  def index
  	if Votee.enabled_id
  		@votee = Votee.find(Votee.enabled_id)
      @up = current_user_instance.voted_up_on? @votee
      @down = current_user_instance.voted_down_on? @votee
  	end
  end

  def up
  	votee = Votee.find(params[:id])
    if current_user_instance.voted_up_on? votee
      current_user_instance.unvote_for votee
      @action = 'un_vote_up'
    else
  		votee.liked_by current_user_instance
      @action = 'vote_up'
  	end
  end

  def down
    votee = Votee.find(params[:id])
    if current_user_instance.voted_down_on? votee
      current_user_instance.unvote_for votee
      @action = 'un_vote_down'
    else
      votee.downvote_from current_user_instance
      @action = 'vote_down'
    end
  end

end
