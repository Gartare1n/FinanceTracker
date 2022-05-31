class FriendsController < ApplicationController

  def friends_list
    @friends = current_user.friends
  end

  def search
    if params[:friend].present?
      @friend = params[:friend]
      if @friend
        respond_to do |format|
          format.js { render partial: 'friends/friend_result' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Couldn't find user"
          format.js { render partial: 'friends/friend_result' }
        end
      end    
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a friend name or email to search"
        format.js { render partial: 'friends/friend_result' }
      end
    end
  end

  def destroy
    friend = Friendship.find(params[:id])
    user_friend = Friendship.where(user_id: current_user.id, friend_id: friend.id).first
    user_friend.destroy
    flash[:notice] = "#{friend.name} was successfully removed from portfolio"
    redirect_to friends_list_path
  end


end