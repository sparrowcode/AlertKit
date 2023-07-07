Pod::Spec.new do |s|

  s.name = 'SPAlert'
  s.version = '5.0.1'
  s.summary = 'Native alert from Apple Music & Feedback. Contains Done, Heart & Message and other presets. Support SwiftUI.'
  s.homepage = 'https://github.com/sparrowcode/AlertKit'
  s.source = { :git => 'https://github.com/sparrowcode/AlertKit.git', :tag => s.version }
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author = { 'Sparrow Code' => 'hello@sparrowcode.io' }
  
  s.swift_version = '5.1'
  s.ios.deployment_target = '13.0'
  s.tvos.deployment_target = '13.0'

  s.source_files = 'Sources/AlertKit/**/*.swift'

end
