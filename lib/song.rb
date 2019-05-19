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
    song = self.new
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find{
      |sn| sn.name == name
    }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name) # Use || to choose find_by_name or create_by_name
  end

  def self.alphabetical()
    @@all.sort_by{
      |sn| sn.name
    }
  end

  def self.new_from_filename(mp3_formatted_file)
    # Build a class constructor that accepts a filename in the
    # format of " - .mp3", for example "Taylor Swift - Blank Space.mp3".

    # Given Song.new_from_filename("Taylor Swift - Blank Space.mp3"),
    # the constructor should return a new Song instance with the song
    # name set to Blank Space and the artist_name set to Taylor Swift.
    c = self.new
    c.name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[1]
    c.artist_name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    c
  end 

  def self.create_from_filename(mp3_formatted_file)
    # Build a class constructor that accepts a filename in the
    # format of " - .mp3", for example "Taylor Swift - Blank Space.mp3".

    # Given Song.new_from_filename("Taylor Swift - Blank Space.mp3"),
    # the constructor should return a new Song instance with the song
    # name set to Blank Space and the artist_name set to Taylor Swift.
    c = self.new
    c.name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[1]
    c.artist_name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    c.save
    c
  end

  def save
    self.class.all << self
  end


  def self.destroy_all()
    @@all.clear
  end

end
