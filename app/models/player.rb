class Player < ApplicationRecord
  validates :name, uniqueness: { scope: [:nationality, :jersey_no]}
  validates_presence_of :name, :networth, :nationality, :jersey_no, :club, :age, :height, :foot, :outfitter
  def self.search_by_name(name)
    if name
      limit(5).where('name LIKE ?', "%#{name}%")
    else
      all
    end
  end
end
