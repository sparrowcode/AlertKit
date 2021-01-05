Pod::Spec.new do |s|

  s.name = 'SPAlert'
  s.version = '3.0.3'
  s.summary = 'Native alert from Apple Music & Feedback. Contains Done, Heart & Message and other presets.'
  s.homepage = 'https://github.com/varabeis/SPAlert'
  s.license = { :type => "MIT", :file => "LICENSE" }
  
  s.author = { "Ivan Vorobei" => "hello@ivanvorobei.by" }
  s.social_media_url = 'https://ivanvorobei.by/'
  
  s.swift_version = '5.1'
  s.ios.deployment_target = '12.0'

  s.source = { :git => 'https://github.com/varabeis/SPAlert.git', :tag => s.version }
  s.source_files = 'Sources/SPAlert/**/*.swift'

end
