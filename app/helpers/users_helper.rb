module UsersHelper
  def show_user_avatar(user)
    "https://graph.facebook.com/#{user.uid}/picture?width=480&height=480"
  end
end