module AlfredModulesHelper
  def can_edit?(m)
    return false unless user_signed_in?
    return true if m.user == current_user
  end
end
