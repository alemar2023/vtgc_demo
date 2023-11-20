module UserHelper

  def all_roles
    ["superadmin", "admin", "moderator", "user"]
  end

  def all_roles_for_select
    all_roles.map{ | l | [l, l] }
  end
end