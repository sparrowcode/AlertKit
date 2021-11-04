Pod::Spec.new do |s|

  s.name = 'SPAlert'
  s.version = '3.5.0'
  s.summary = 'Native alert from Apple Music & Feedback. Contains Done, Heart & Message and other presets.'
  s.homepage = 'https://github.com/ivanvorobei/SPAlert'
  s.source = { :git => 'https://github.com/ivanvorobei/SPAlert.git', :tag => s.version }
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author = { 'Ivan Vorobei' => 'hello@ivanvorobei.by' }
  
  s.swift_version = '5.1'
  s.ios.deployment_target = '11.0'

  s.source_files = 'Sources/SPAlert/**/*.swift'

end
