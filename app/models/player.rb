class Player < ApplicationRecord
  def self.search_by_name(name)
    if name
      limit(5).where('name LIKE ?', "%#{name}%")
    else
      all
    end
  end
end
