class VoteesController < ApplicationController
  
  layout 'application'
  def index
  	if current_user_instance.is? :administrator
  		@votee = Votee.new
  		@votees = Votee.all
  	else
  		redirect_to root_url
  	end
  end

 def create
  	@votee = Votee.new(title: params[:votee][:title])
  	if @votee.save
  		redirect_to votees_url, notice: "Question '#{params[:title]}' has been create successfully!"
  	else
  		logger.debug $!
  		redirect_to :index, alert: "There was an error, try again"
  	end
  end

  def toggle
  	votee = Votee.find(params[:id])
    if votee.enabled?
      Votee.enabled_id = nil
    else
      Votee.enabled_id = votee.id
    end
    @votees = Votee.all
  end

  def destroy
  	@votee = Votee.find(params[:id])
  	if @votee.destroy
  		redirect_to action: :index, notice: 'Deleted successfully'
  	else
  		redirect_to action: :index, notice: 'Deleted failed'
    end
  end
end
