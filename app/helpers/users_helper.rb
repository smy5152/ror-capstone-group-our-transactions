module UsersHelper
  def avatar_url_for_user
    current_user.avatar.key.nil? ? 'No-profile-icon.png' : current_user.avatar
  end
end
