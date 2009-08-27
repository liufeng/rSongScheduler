model rSongScheduler
class Song
  attr_reader :title, :artist, :album, :year, :duration, :popularity, :id, :addedTime, :lastPlayed
  private_class_method :get_average_plays
  def initialize(title, artist, album, year, duration, popularity, id, addedTime, lastPlayed)
    @title = title
    @artist = artist
    @album = album
    @year = year
    @duration = duration
    @popularity = popularity
    @id = id
    @addedTime = Time.at(addedTime)
    if lastPlayed == 0
      @lastPlayed = 0
    else
      @lastPlayed = Time.at(lastPlayed)
    end
    @playCount = 0
  end
  
  def get_average_plays
    # the algorithm: result = <played times> / <weeks being added>
    weeks = (Time.now - @addedTime).to_i / 60 / 60 / 24 / 7
    if weeks == 0
      return playCount
    end
    (playCount / weeks).to_i
  end
  
  def updatePriority
    if (lastPlayed == 0)
      10 * @popularity - 7 * get_average_plays
    else
      10 * @popularity - 7 * get_average_plays - 16 / (Time.now - @lastPlayed)
    end
  end
  
  def ==(other)
    @title.capitalize == other.capitalize
  end
end