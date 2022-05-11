module UsersHelper
  def display_nickname(user)
    unless user == nil
      "@#{user.nickname}"
    end
  end
end
