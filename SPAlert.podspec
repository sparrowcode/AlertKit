Pod::Spec.new do |s|

  s.name          = "SPAlert"
  s.version       = "2.1.2"
  s.summary       = "Native alert from Apple Music & Feedback. Contains Done, Heart & Message and other presets."
  s.homepage      = "https://github.com/IvanVorobei/SPAlert"
  s.source        = { :git => "https://github.com/IvanVorobei/SPAlert.git", :tag => s.version }
  s.license       = { :type => "MIT", :file => "LICENSE" }
  
  s.author        = { "Ivan Vorobei" => "ivanvorobei@icloud.com" }
  
  s.platform      = :ios
  s.ios.framework = 'UIKit'
  s.swift_version = ['4.2', '5.0']
  s.ios.deployment_target = "10.0"

  s.source_files  = "Source/SPAlert/**/*.swift"

end
