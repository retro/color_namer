# color_namer

ColorNamer is a gem that allows you to name color from RGB value or from HTML hash. It will find the closest color and return a HTML hash, name and shade of that color. 

# Usage

    require 'color_namer'
    
    ColorNamer.name_from_html_hash('#FF3300') # returns ["FF2400", "Scarlet", "Red"]
    ColorNamer.name_from_rgb(205, 94, 94) # returns ["CD5C5C", "Indian Red", "Red"]
    
    # You can also pass any Color object to name method
    
    ColorNamer.name Color::CMYK.new(30, 0, 80, 30) # returns ["7AAC21", "Lima", "Green"]

# Dependencies
  
  Color gem http://github.com/halostatue/color

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 retro. See LICENSE for details.
