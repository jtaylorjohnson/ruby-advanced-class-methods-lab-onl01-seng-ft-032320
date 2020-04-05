class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    new = self.new 
    new.name = name
    new.save
    new
  end

  def self.new_by_name(new_name)
    song = self.new
    song.name = new_name 
    song
  end
  
  def self.create_by_name(string)
    song = self.new
    song.name = string 
    song.save
    song
  end 
  
  def self.find_by_name(string)
    new = self.all.detect {|song| song.name == string}
    new
  end
  
  def self.find_or_create_by_name(string)
    if self.find_by_name(string) == nil
      self.create_by_name(string)
    else self.find_by_name(string)
    end
  end
    
  def self.alphabetical
    alpha = self.all.sort_by {|song| song.name}
    alpha
  end
  
  def self.new_from_filename(file)
    array = file.split(" - ")
    array[1] = array[1].chomp(".mp3")
    song = self.new 
    song.name = array[1]
    song.artist_name = array[0]
    song
  end
  
  def self.create_from_filename(file)
    #is this ok?
    self.new_from_filename(file).save
  end 
  
  def self.destroy_all
    #is this ok?
    @@all = []
  end
end
