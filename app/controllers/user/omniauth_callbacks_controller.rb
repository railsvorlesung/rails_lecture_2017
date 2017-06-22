class User::OmniauthCallbacksController < ApplicationController

  skip_before_action  :authenticate_user!

  def github

  # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    @user.save!

    request.env['omniauth.auth'].delete('extra')

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
    else
      session["devise.github_data"] = request.env["omniauth.auth"].slice('provider', 'uid', 'info', 'credentials')
      new_user_registration_url
    end
  end # #github

  def failure
    redirect_to root_path
  end

  protected
    
  def debug_env(request)
    request.env.each do |key, value|
      if key.to_s.include?('omniauth')
      puts "#{key}:"
      pp value
      end
    end
  end # #debug_env
end
