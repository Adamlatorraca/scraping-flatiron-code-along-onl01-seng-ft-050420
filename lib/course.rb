class Course
  attr_accessor :title, :schedule, :description

  def initialize
    @@all << self
  end
  
  def self.all
    @@all
  end
end
