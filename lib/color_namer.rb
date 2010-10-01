require 'color'

module ColorNamer
  
  class << self
    
    def name_from_html_hash(hash)
      color = Color::RGB.from_html(hash)
      name(color)
    end
    
    def name_from_rgb(*rgb)
      rgb = rgb[0].split(',').map{ |v| v.strip } if rgb.size == 1
      raise ArgumentError, "Wrong format of RGB value. Use 'r,g,b' or [r,g,b]" if rgb.size < 3
      rgb.map!(&:to_i)
      color = Color::RGB.new(rgb[0], rgb[1], rgb[2])
      name(color)
    end  
    
    def name(color) # You can pass any Color object to this method
      
      find_rgb     = color.to_rgb
      find_hsl     = color.to_hsl
      return_color = nil
      df           = nil
      
      self.color_names.each do |hash, name, shade|
        return [hash, name, shade] if "##{hash}" == find_rgb.html
        
        # This part is ported from Javascript version found at http://chir.ag/tech/download/ntc
        
        rgb = Color::RGB.from_html(hash)
        hsl = rgb.to_hsl
        ndf1 = ((find_rgb.red - rgb.red) ** 2) + ((find_rgb.green - rgb.green) ** 2) + ((find_rgb.blue - rgb.blue) ** 2)
        ndf2 = (
                (((find_hsl.h * 255) - (hsl.h * 255)) ** 2) + 
                (((find_hsl.s * 255) - (hsl.s * 255)) ** 2) + 
                (((find_hsl.l * 255) - (hsl.l * 255)) ** 2)
               ).abs
        
        ndf = ndf1 + ndf2 * 2
        
        if df.nil? or df > ndf
          df = ndf
          return_color = [hash, name, shade]
        end
        
      end
      
      return return_color
      
    end
    
    def color_names
      ColorNamer::ColorNames.names
    end
    
  end

end

require 'color_namer/color_names'