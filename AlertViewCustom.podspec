Pod::Spec.new do |s|
  s.name             = 'AlertViewCustom'
  s.version          = '2.0.0'
  s.summary          = 'A custom AlertView'

  s.description      = <<-DESC
  With CustomAlertView you can create a simple custom alert instead of using the default one from Apple, which doesn't always fit in with the style of your app.
                       DESC

  s.homepage         = 'https://github.com/jadebowl/CustomAlertView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Giada Ciotola' => 'giadaciotola@hotmail.it' }
  s.source           = { :git => 'https://github.com/jadebowl/CustomAlertView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '14.0'
  s.source_files = 'Sources/**/*'
  s.frameworks = 'UIKit'
  
  s.swift_version = '5.0'
  
end