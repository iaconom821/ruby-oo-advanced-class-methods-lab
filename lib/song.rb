require 'pry'

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
    new_song = self.new
    self.all << new_song
    new_song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name 
    self.all << song
    song 
  end

  def self.find_by_name(name)
    song = self.new
    self.all.find do |elem| 
      elem.name == name 
    end
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by do |obj|
      obj.name
    end
  end

  def self.new_from_filename(filename)
    file = filename.gsub('.mp3','').split(/[-]/)
    artist = file[0].chop
    name = file[1][1..-1]

    song = self.new
    song.name = name
    song.artist_name = artist
    song 
    
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    self.all << song
  end

  def self.destroy_all
    self.all.clear
  end

end
