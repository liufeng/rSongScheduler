module rSongScheduler
  class MyTime
    def initialize(time)
      if time == 0
        @time = nil
      else
        @time = Time.at(time)
      end
    end
    
    def to_i
      if @time == nil
        0
      else
        @time.to_i
      end
    end
    
    def add(time)
      @time += time
    end
    
    # Calculate how many days are there from this to time
    def minus(time)
      if time == nil
        0
      else
        (time.to_i - @time.to_i) / (24 * 60 * 60 * 1000) + 1
      end
    end
    
    def after(time)
      @time > time
    end
    
    def before(time)
      @time < time
    end
    
    def getCurrentTime
      MyTime.new(Time.now.to_i)
    end
    
    def getPreviousDay
    end
    
    def getNextDay
    end
    
    def getPreviousHour
    end
    
    def getNextHour
    end
  end
end