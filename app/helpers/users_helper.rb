module UsersHelper
  def user_link_tag(user)
    link_to_if(user_signed_in?, user.email, auth_user_articles_path(user.id))
  end
end

