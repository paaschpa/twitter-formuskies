module TweetsHelper
  
  def getLocation(val)
    ret = ""
    Tweet::LOCATIONS.select do |disp, value|
      if value==val
        ret = disp
      end
    end
    return ret
  end

end
