class Player < ApplicationRecord
  validates :name, uniqueness: { scope: [:nationality, :jersey_no]}
  validates_presence_of :name, :networth, :nationality, :jersey_no, :club, :age, :height, :foot, :outfitter
  after_initialize :calculate_avg_stars

  def self.search_by_name(name)
    if name
      limit(5).where('name LIKE ?', "%#{name}%")
    else
      all
    end
  end

  def player_image= image_file
    if image_file.instance_of? ActionDispatch::Http::UploadedFile
      file_name = "app/assets/images/#{rand 99999999999999}.#{image_file.original_filename.split('.')[-1]}"
      File.open(file_name, 'wb') {|f| f.write image_file.read}
      self.image = file_name.split('images/')[-1]
    else
      self.image = image_file
    end
  end


  def calculate_avg_stars
    self.avg_stars = ((self.five_stars * 5) + (self.four_stars * 4)  + (self.three_stars * 3) + (self.two_stars * 2) + (self.one_stars * 1))/(self.five_stars + self.four_stars + self.three_stars + self.two_stars + self.one_stars) || 0
  rescue Exception => e
    self.avg_stars = 0
  end
end
