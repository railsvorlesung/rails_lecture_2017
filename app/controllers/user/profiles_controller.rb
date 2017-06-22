class User::ProfilesController < ApplicationController

  skip_before_action  :create_profile_if_necessary, only: [:new, :create]

  def new
    @profile = current_user.build_user_profile  
  end # #new

  def create
    current_user.create_user_profile(permitted_params)
    redirect_to user_profile_url
  end # #create

  def show
    @profile = current_user.user_profile 
  end # #show

  def edit
    
  end # #edit

  protected

  def permitted_params
    params.require(:user_profile).permit(:firstname, :lastname, :zipcode, :street, :city, :image)
  end # #permitted_params
end
