module ApplicationHelper
  def full_name_for(user)
    user&.first_name.to_s + ' ' + user&.last_name.to_s
  end
end
