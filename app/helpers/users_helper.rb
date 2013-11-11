module UsersHelper
  def show_user_avatar(user)
    "https://graph.facebook.com/#{user.uid}/picture?width=140&height=140"
  end
end