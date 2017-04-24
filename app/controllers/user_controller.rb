class UserController < ApplicationController

  def index
    @users = User.all.reject{|user| user ==  current_user}
    render :layout => false
  end
end
