Pod::Spec.new do |s|

  s.name          = "SPAlert"
  s.version       = "1.1"
  s.summary       = "Native popup alert similar to Apple Music or Feedback in AppStore app."
  s.homepage      = "https://github.com/IvanVorobei/SPAlert"
  s.source        = { :git => "https://github.com/IvanVorobei/SPAlert.git", :tag => s.version }
  s.license       = { :type => "MIT", :file => "LICENSE" }
  
  s.author        = { "Ivan Vorobei" => "hello@ivanvorobei.by" }
  
  s.platform      = :ios
  s.ios.framework = 'UIKit'
  s.swift_version = ['4.2', '5.0']
  s.ios.deployment_target = "10.0"

  s.source_files  = "Source/SPAlert/**/*.swift"

end