class TopicsController < ApplicationController

  def index
    @topics = Topic.all
  end

  def like
    @topic = Topic.find( params[:id] )

    unless @topic.is_liked_by(current_user)
      Like.create( :topic => @topic, :user => current_user )
    end

    respond_to do |format|
      format.js
      format.html { redirect_to topics_path }
    end
  end

  def unlike
    @topic = Topic.find(params[:id])
    like = @topic.find_like(current_user)

    like.destroy

    respond_to do |format|
      format.js { render "like" } # like.js.erb
      format.html { redirect_to topics_path }
    end
  end

  def destroy
    @topic = Topic.find( params[:id] )
    @topic.destroy

    respond_to do |format|
      # :remote => true
      format.js # destroy.js.erb
      format.html { redirect_to topics_path }
    end
  end

end
