require 'opencv'
include OpenCV
class HomeController < ApplicationController
  def index
    
  end
  def photo
    
      data = '/usr/share/opencv/haarcascades/haarcascade_mcs_mouth.xml'
      detector = CvHaarClassifierCascade::load(data)
      image = CvMat.load(params[:photo_file].path)
      detector.detect_objects(image).each do |region|
        color = CvColor::Blue
        image.rectangle! region.top_left, region.bottom_right, :color => color
      end

      image.save_image("output.jpg")
      send_file("output.jpg", disposition: 'inline')

  end
end
