require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "ColorNamer" do
  
  it "should correctly name color from HTML hash" do
    color_name = ColorNamer.name_from_html_hash('FF3300')
    color_name[1].should == 'Scarlet'
    color_name[2].should == 'Red'
  end
  
  it "should correctly name color from RGB string" do
    color_name = ColorNamer.name_from_rgb('205, 94, 94')
    color_name[1].should == 'Indian Red'
    color_name[2].should == 'Red'
  end
  
  it "should correctly name color from RGB array" do
    color_name = ColorNamer.name_from_rgb(205, 94, 94)
    color_name[1].should == 'Indian Red'
    color_name[2].should == 'Red'
  end
  
  it "should correctly name color from any Color object" do
    color = Color::CMYK.new(30, 0, 80, 30)
    color_name = ColorNamer.name(color)
    color_name[1].should == 'Lima'
    color_name[2].should == 'Green'
  end
  
  it "should raise ArgumentError when called with invalid arguments" do
    expect{ ColorNamer.name_from_rgb('w2342345') }.to raise_error(ArgumentError)
    expect{ ColorNamer.name_from_rgb('255.255.255') }.to raise_error(ArgumentError)
    expect{ ColorNamer.name_from_rgb('123,123') }.to raise_error(ArgumentError)
    expect{ ColorNamer.name_from_rgb(123,123) }.to raise_error(ArgumentError)
  end
  
end
