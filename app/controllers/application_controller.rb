class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception



  # NOTE this method is provided by devise
  before_action :authenticate_user!


  # NOTE optional (if you want to keep the whole application protected with htacces, for example a test installation)
  before_action :authorize

  before_action :create_profile_if_necessary, if: :current_user
  protected

  def authorize
    # the autorization will be skipped if the rails app is not in production mode
    return true unless Rails.env.production?


    authenticate_or_request_with_http_basic do |user, password|
      (user == 'blog' && password == 'test123')
    end
  end # #authorize

  def create_profile_if_necessary
    if current_user.user_profile.blank?
      redirect_to new_user_profile_path
    end
  end # #create_profile_if_necessary

end
