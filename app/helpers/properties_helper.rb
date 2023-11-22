module PropertiesHelper
  def all_types
    ["text", "longtext", "numeric", "currency", "email", "telephone"]
  end

  def all_types_for_select
    all_types.map{ | l | [l, l] }
  end

end