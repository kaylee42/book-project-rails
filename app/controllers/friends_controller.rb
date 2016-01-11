class FriendsController < ApplicationController
  def add
    Frienship.create(user_id: current_user.id, friend_id: params[:id])
    redirect_to User.find(params[:id]), notice: "Friend added!"
  end

  def remove
    friend = Frienship.find_by(user_id: current_user.id, friend_id: params[:id])
    friend.destroy
    redirect_to User.find(params[:id]), notice: "Friend removed."
  end
end
