class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      sign_in @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?

      redirect_to dashboard_index_url
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to root_url
    end
  end
end