class Tweet < ActiveRecord::Base
  LOCATIONS = 
    [
      #Displayed          stored in db
      ["Chase Hall",		"chase"],
      ["Wehr Center",		"wehr"],
      ["Lay Chapel",		"layc"]
    ]
  
  validates_inclusion_of :location, :in => LOCATIONS.map { |disp, val| val }

end
