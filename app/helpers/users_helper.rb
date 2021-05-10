module UsersHelper
  def avatar_url_for_user
    @user.avatar.nil? ? 'docs/nousericon.png' : @user.avatar.to_s
  end
end
